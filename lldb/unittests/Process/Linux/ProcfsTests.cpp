//===-- ProcfsTests.cpp ---------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "Procfs.h"

#include "lldb/Host/linux/Support.h"
#include "lldb/Host/posix/Support.h"

#include "gmock/gmock.h"
#include "gtest/gtest.h"

using namespace lldb_private;
using namespace process_linux;
using namespace llvm;

TEST(Perf, HardcodedLogicalCoreIDs) {
  Expected<std::vector<lldb::cpu_id_t>> cpu_ids =
      GetAvailableLogicalCoreIDs(R"(processor       : 13
vendor_id       : GenuineIntel
cpu family      : 6
model           : 85
model name      : Intel(R) Xeon(R) Gold 6138 CPU @ 2.00GHz
stepping        : 4
microcode       : 0x2000065
cpu MHz         : 2886.370
cache size      : 28160 KB
physical id     : 1
siblings        : 40
core id         : 19
cpu cores       : 20
apicid          : 103
initial apicid  : 103
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
power management:

processor       : 24
vendor_id       : GenuineIntel
cpu family      : 6
model           : 85
model name      : Intel(R) Xeon(R) Gold 6138 CPU @ 2.00GHz
stepping        : 4
microcode       : 0x2000065
cpu MHz         : 2768.494
cache size      : 28160 KB
physical id     : 1
siblings        : 40
core id         : 20
cpu cores       : 20
apicid          : 105
power management:

processor       : 35
vendor_id       : GenuineIntel
cpu family      : 6
model           : 85
model name      : Intel(R) Xeon(R) Gold 6138 CPU @ 2.00GHz
stepping        : 4
microcode       : 0x2000065
cpu MHz         : 2884.703
cache size      : 28160 KB
physical id     : 1
siblings        : 40
core id         : 24
cpu cores       : 20
apicid          : 113

processor       : 79
vendor_id       : GenuineIntel
cpu family      : 6
model           : 85
model name      : Intel(R) Xeon(R) Gold 6138 CPU @ 2.00GHz
stepping        : 4
microcode       : 0x2000065
cpu MHz         : 3073.955
cache size      : 28160 KB
physical id     : 1
siblings        : 40
core id         : 28
cpu cores       : 20
apicid          : 121
power management:
)");

  ASSERT_TRUE((bool)cpu_ids);
  ASSERT_THAT(*cpu_ids, ::testing::ElementsAre(13, 24, 35, 79));
}

TEST(Perf, RealLogicalCoreIDs) {
  // We first check we can read /proc/cpuinfo
  auto buffer_or_error = errorOrToExpected(getProcFile("cpuinfo"));
  if (!buffer_or_error)
    GTEST_SKIP() << toString(buffer_or_error.takeError());

  // At this point we shouldn't fail parsing the core ids
  Expected<ArrayRef<lldb::cpu_id_t>> cpu_ids = GetAvailableLogicalCoreIDs();
  ASSERT_TRUE((bool)cpu_ids);
  ASSERT_GT((int)cpu_ids->size(), 0) << "We must see at least one core";
}

TEST(Perf, RealPtraceScopeWhenExist) {
  // We first check we can read /proc/sys/kernel/yama/ptrace_scope
  auto buffer_or_error =
      errorOrToExpected(getProcFile("sys/kernel/yama/ptrace_scope"));
  if (!buffer_or_error)
    GTEST_SKIP() << toString(buffer_or_error.takeError());

  // At this point we shouldn't fail parsing the ptrace_scope value.
  Expected<int> ptrace_scope = GetPtraceScope();
  ASSERT_TRUE((bool)ptrace_scope) << ptrace_scope.takeError();
  ASSERT_GE(*ptrace_scope, 0)
      << "Sensible values of ptrace_scope are between 0 and 3";
  ASSERT_LE(*ptrace_scope, 3)
      << "Sensible values of ptrace_scope are between 0 and 3";
}

TEST(Perf, RealPtraceScopeWhenNotExist) {
  // We first check we can NOT read /proc/sys/kernel/yama/ptrace_scope
  auto buffer_or_error =
      errorOrToExpected(getProcFile("sys/kernel/yama/ptrace_scope"));
  if (buffer_or_error)
    GTEST_SKIP() << "In order for this test to run, "
                    "/proc/sys/kernel/yama/ptrace_scope should not exist";
  consumeError(buffer_or_error.takeError());

  // At this point we should fail parsing the ptrace_scope value.
  Expected<int> ptrace_scope = GetPtraceScope();
  ASSERT_FALSE((bool)ptrace_scope);
  consumeError(ptrace_scope.takeError());
}

#ifdef LLVM_ENABLE_THREADING
TEST(Support, getProcFile_Tid) {
  auto BufferOrError = getProcFile(getpid(), llvm::get_threadid(), "comm");
  ASSERT_TRUE(BufferOrError);
  ASSERT_TRUE(*BufferOrError);
}
#endif /*ifdef LLVM_ENABLE_THREADING */
