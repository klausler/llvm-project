; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 3
; RUN: opt -S < %s --passes=slp-vectorizer -slp-threshold=-50 -mtriple=riscv64-unknown-linux-gnu -mattr=+v | FileCheck %s

define void @loads() {
; CHECK-LABEL: define void @loads(
; CHECK-SAME: ) #[[ATTR0:[0-9]+]] {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x fp128>, ptr null, align 16
; CHECK-NEXT:    [[TMP3:%.*]] = fcmp une <2 x fp128> [[TMP1]], zeroinitializer
; CHECK-NEXT:    call void null(i32 0, ptr null, i32 0)
; CHECK-NEXT:    [[TMP2:%.*]] = fcmp une <2 x fp128> [[TMP1]], zeroinitializer
; CHECK-NEXT:    ret void
;
entry:
  %_M_value.imagp.i266 = getelementptr { fp128, fp128 }, ptr null, i64 0, i32 1
  %0 = load fp128, ptr null, align 16
  %cmp.i382 = fcmp une fp128 %0, 0xL00000000000000000000000000000000
  %1 = load fp128, ptr %_M_value.imagp.i266, align 16
  %cmp4.i385 = fcmp une fp128 %1, 0xL00000000000000000000000000000000
  call void null(i32 0, ptr null, i32 0)
  %cmp.i386 = fcmp une fp128 %0, 0xL00000000000000000000000000000000
  %cmp2.i388 = fcmp une fp128 %1, 0xL00000000000000000000000000000000
  ret void
}

define void @stores(ptr noalias %p) {
; CHECK-LABEL: define void @stores(
; CHECK-SAME: ptr noalias [[P:%.*]]) #[[ATTR0]] {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[_M_VALUE_IMAGP_I266:%.*]] = getelementptr { fp128, fp128 }, ptr null, i64 0, i32 1
; CHECK-NEXT:    [[TMP0:%.*]] = load fp128, ptr null, align 16
; CHECK-NEXT:    [[TMP1:%.*]] = load fp128, ptr [[_M_VALUE_IMAGP_I266]], align 16
; CHECK-NEXT:    [[P1:%.*]] = getelementptr fp128, ptr [[P]], i64 1
; CHECK-NEXT:    store fp128 [[TMP0]], ptr [[P1]], align 16
; CHECK-NEXT:    store fp128 [[TMP1]], ptr [[P]], align 16
; CHECK-NEXT:    ret void
;
entry:
  %_M_value.imagp.i266 = getelementptr { fp128, fp128 }, ptr null, i64 0, i32 1
  %0 = load fp128, ptr null, align 16
  %1 = load fp128, ptr %_M_value.imagp.i266, align 16
  %p1 = getelementptr fp128, ptr %p, i64 1
  store fp128 %0, ptr %p1, align 16
  store fp128 %1, ptr %p, align 16
  ret void
}
