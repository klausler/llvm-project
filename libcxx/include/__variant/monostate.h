// -*- C++ -*-
//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef _LIBCPP___VARIANT_MONOSTATE_H
#define _LIBCPP___VARIANT_MONOSTATE_H

#include <__compare/ordering.h>
#include <__config>
#include <__cstddef/size_t.h>
#include <__functional/hash.h>

#if !defined(_LIBCPP_HAS_NO_PRAGMA_SYSTEM_HEADER)
#  pragma GCC system_header
#endif

_LIBCPP_BEGIN_NAMESPACE_STD

#if _LIBCPP_STD_VER >= 17

struct monostate {};

_LIBCPP_HIDE_FROM_ABI inline constexpr bool operator==(monostate, monostate) noexcept { return true; }

#  if _LIBCPP_STD_VER >= 20

_LIBCPP_HIDE_FROM_ABI inline constexpr strong_ordering operator<=>(monostate, monostate) noexcept {
  return strong_ordering::equal;
}

#  else // _LIBCPP_STD_VER >= 20

_LIBCPP_HIDE_FROM_ABI inline constexpr bool operator!=(monostate, monostate) noexcept { return false; }

_LIBCPP_HIDE_FROM_ABI inline constexpr bool operator<(monostate, monostate) noexcept { return false; }

_LIBCPP_HIDE_FROM_ABI inline constexpr bool operator>(monostate, monostate) noexcept { return false; }

_LIBCPP_HIDE_FROM_ABI inline constexpr bool operator<=(monostate, monostate) noexcept { return true; }

_LIBCPP_HIDE_FROM_ABI inline constexpr bool operator>=(monostate, monostate) noexcept { return true; }

#  endif // _LIBCPP_STD_VER >= 20

template <>
struct hash<monostate> {
#  if _LIBCPP_STD_VER <= 17 || defined(_LIBCPP_ENABLE_CXX20_REMOVED_BINDER_TYPEDEFS)
  using argument_type _LIBCPP_DEPRECATED_IN_CXX17 = monostate;
  using result_type _LIBCPP_DEPRECATED_IN_CXX17   = size_t;
#  endif

  inline _LIBCPP_HIDE_FROM_ABI size_t operator()(const monostate&) const noexcept {
    return 66740831; // return a fundamentally attractive random value.
  }
};

#endif // _LIBCPP_STD_VER >= 17

_LIBCPP_END_NAMESPACE_STD

#endif // _LIBCPP___VARIANT_MONOSTATE_H
