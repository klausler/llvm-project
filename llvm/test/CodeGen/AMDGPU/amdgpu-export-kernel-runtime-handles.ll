; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --check-attributes --check-globals all --version 5
; RUN: opt -S -mtriple=amdgcn-amd-amdhsa -amdgpu-export-kernel-runtime-handles < %s | FileCheck %s
; RUN: opt -S -mtriple=amdgcn-amd-amdhsa -passes=amdgpu-export-kernel-runtime-handles < %s | FileCheck %s

%block.runtime.handle.t = type { ptr addrspace(1), i32, i32 }

; associated globals without the correct section should be ignored.
@block.handle = internal addrspace(1) externally_initialized constant %block.runtime.handle.t zeroinitializer, section ".amdgpu.kernel.runtime.handle"
@not.a.block.handle = internal addrspace(1) externally_initialized constant %block.runtime.handle.t zeroinitializer

;.
; CHECK: @block.handle = addrspace(1) externally_initialized constant %block.runtime.handle.t zeroinitializer, section ".amdgpu.kernel.runtime.handle"
; CHECK: @not.a.block.handle = internal addrspace(1) externally_initialized constant %block.runtime.handle.t zeroinitializer
;.
define internal amdgpu_kernel void @block_kernel() !associated !0 {
; CHECK-LABEL: define protected amdgpu_kernel void @block_kernel(
; CHECK-SAME: ) !associated [[META0:![0-9]+]] {
; CHECK-NEXT:    ret void
;
  ret void
}

define internal dso_local amdgpu_kernel void @dso_local_block_kernel() !associated !0 {
; CHECK-LABEL: define protected amdgpu_kernel void @dso_local_block_kernel(
; CHECK-SAME: ) !associated [[META0]] {
; CHECK-NEXT:    ret void
;
  ret void
}

define internal amdgpu_kernel void @not_block_kernel() !associated !1 {
; CHECK-LABEL: define internal amdgpu_kernel void @not_block_kernel(
; CHECK-SAME: ) !associated [[META1:![0-9]+]] {
; CHECK-NEXT:    ret void
;
  ret void
}

define internal amdgpu_kernel void @associated_null() !associated !2 {
; CHECK-LABEL: define internal amdgpu_kernel void @associated_null(
; CHECK-SAME: ) !associated [[META2:![0-9]+]] {
; CHECK-NEXT:    ret void
;
  ret void
}

define internal amdgpu_kernel void @no_metadata() {
; CHECK-LABEL: define internal amdgpu_kernel void @no_metadata() {
; CHECK-NEXT:    ret void
;
  ret void
}

!0 = !{ptr addrspace(1) @block.handle }
!1 = !{ptr addrspace(1) @not.a.block.handle }
!2 = !{ptr addrspace(1) null }

;.
; CHECK: [[META0]] = !{ptr addrspace(1) @block.handle}
; CHECK: [[META1]] = !{ptr addrspace(1) @not.a.block.handle}
; CHECK: [[META2]] = !{ptr addrspace(1) null}
;.
