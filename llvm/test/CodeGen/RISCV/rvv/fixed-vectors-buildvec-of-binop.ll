; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+m,+v,+d -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,RV32
; RUN: llc -mtriple=riscv64 -mattr=+m,+v,+d -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,RV64

define <4 x i32> @add_constant_rhs(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: add_constant_rhs:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; CHECK-NEXT:    vmv.v.x v8, a0
; CHECK-NEXT:    lui a0, %hi(.LCPI0_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI0_0)
; CHECK-NEXT:    vle32.v v9, (a0)
; CHECK-NEXT:    vslide1down.vx v8, v8, a1
; CHECK-NEXT:    vslide1down.vx v8, v8, a2
; CHECK-NEXT:    vslide1down.vx v8, v8, a3
; CHECK-NEXT:    vadd.vv v8, v8, v9
; CHECK-NEXT:    ret
  %e0 = add i32 %a, 23
  %e1 = add i32 %b, 25
  %e2 = add i32 %c, 1
  %e3 = add i32 %d, 2355
  %v0 = insertelement <4 x i32> poison, i32 %e0, i32 0
  %v1 = insertelement <4 x i32> %v0, i32 %e1, i32 1
  %v2 = insertelement <4 x i32> %v1, i32 %e2, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %e3, i32 3
  ret <4 x i32> %v3
}

define <8 x i32> @add_constant_rhs_8xi32(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h) {
; CHECK-LABEL: add_constant_rhs_8xi32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e32, m2, ta, ma
; CHECK-NEXT:    vmv.v.x v8, a0
; CHECK-NEXT:    lui a0, %hi(.LCPI1_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI1_0)
; CHECK-NEXT:    vslide1down.vx v8, v8, a1
; CHECK-NEXT:    vslide1down.vx v8, v8, a2
; CHECK-NEXT:    vslide1down.vx v8, v8, a3
; CHECK-NEXT:    vslide1down.vx v8, v8, a4
; CHECK-NEXT:    vle32.v v10, (a0)
; CHECK-NEXT:    vslide1down.vx v8, v8, a5
; CHECK-NEXT:    vslide1down.vx v8, v8, a6
; CHECK-NEXT:    vslide1down.vx v8, v8, a7
; CHECK-NEXT:    vadd.vv v8, v8, v10
; CHECK-NEXT:    ret
  %e0 = add i32 %a, 23
  %e1 = add i32 %b, 25
  %e2 = add i32 %c, 1
  %e3 = add i32 %d, 2355
  %e4 = add i32 %e, 23
  %e5 = add i32 %f, 23
  %e6 = add i32 %g, 22
  %e7 = add i32 %h, 23
  %v0 = insertelement <8 x i32> poison, i32 %e0, i32 0
  %v1 = insertelement <8 x i32> %v0, i32 %e1, i32 1
  %v2 = insertelement <8 x i32> %v1, i32 %e2, i32 2
  %v3 = insertelement <8 x i32> %v2, i32 %e3, i32 3
  %v4 = insertelement <8 x i32> %v3, i32 %e4, i32 4
  %v5 = insertelement <8 x i32> %v4, i32 %e5, i32 5
  %v6 = insertelement <8 x i32> %v5, i32 %e6, i32 6
  %v7 = insertelement <8 x i32> %v6, i32 %e7, i32 7
  ret <8 x i32> %v7
}


define <4 x i32> @sub_constant_rhs(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: sub_constant_rhs:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; CHECK-NEXT:    vmv.v.x v8, a0
; CHECK-NEXT:    lui a0, %hi(.LCPI2_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI2_0)
; CHECK-NEXT:    vle32.v v9, (a0)
; CHECK-NEXT:    vslide1down.vx v8, v8, a1
; CHECK-NEXT:    vslide1down.vx v8, v8, a2
; CHECK-NEXT:    vslide1down.vx v8, v8, a3
; CHECK-NEXT:    vsub.vv v8, v8, v9
; CHECK-NEXT:    ret
  %e0 = sub i32 %a, 23
  %e1 = sub i32 %b, 25
  %e2 = sub i32 %c, 1
  %e3 = sub i32 %d, 2355
  %v0 = insertelement <4 x i32> poison, i32 %e0, i32 0
  %v1 = insertelement <4 x i32> %v0, i32 %e1, i32 1
  %v2 = insertelement <4 x i32> %v1, i32 %e2, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %e3, i32 3
  ret <4 x i32> %v3
}

define <4 x i32> @mul_constant_rhs(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: mul_constant_rhs:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; CHECK-NEXT:    vmv.v.x v8, a0
; CHECK-NEXT:    lui a0, %hi(.LCPI3_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI3_0)
; CHECK-NEXT:    vle32.v v9, (a0)
; CHECK-NEXT:    vslide1down.vx v8, v8, a1
; CHECK-NEXT:    vslide1down.vx v8, v8, a2
; CHECK-NEXT:    vslide1down.vx v8, v8, a3
; CHECK-NEXT:    vmul.vv v8, v8, v9
; CHECK-NEXT:    ret
  %e0 = mul i32 %a, 23
  %e1 = mul i32 %b, 25
  %e2 = mul i32 %c, 27
  %e3 = mul i32 %d, 2355
  %v0 = insertelement <4 x i32> poison, i32 %e0, i32 0
  %v1 = insertelement <4 x i32> %v0, i32 %e1, i32 1
  %v2 = insertelement <4 x i32> %v1, i32 %e2, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %e3, i32 3
  ret <4 x i32> %v3
}

define <4 x i32> @udiv_constant_rhs(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: udiv_constant_rhs:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; CHECK-NEXT:    vmv.v.x v8, a0
; CHECK-NEXT:    lui a0, %hi(.LCPI4_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI4_0)
; CHECK-NEXT:    vmv.v.i v9, 0
; CHECK-NEXT:    vslide1down.vx v8, v8, a1
; CHECK-NEXT:    lui a1, 524288
; CHECK-NEXT:    vle32.v v10, (a0)
; CHECK-NEXT:    lui a0, %hi(.LCPI4_1)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI4_1)
; CHECK-NEXT:    vslide1down.vx v9, v9, a1
; CHECK-NEXT:    vle32.v v11, (a0)
; CHECK-NEXT:    vslide1down.vx v8, v8, a2
; CHECK-NEXT:    vslide1down.vx v8, v8, a3
; CHECK-NEXT:    vmulhu.vv v10, v8, v10
; CHECK-NEXT:    vsub.vv v12, v8, v10
; CHECK-NEXT:    vmulhu.vv v9, v12, v9
; CHECK-NEXT:    vadd.vv v9, v9, v10
; CHECK-NEXT:    vmv.v.i v0, 4
; CHECK-NEXT:    vsrl.vv v9, v9, v11
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %e0 = udiv i32 %a, 23
  %e1 = udiv i32 %b, 25
  %e2 = udiv i32 %c, 1
  %e3 = udiv i32 %d, 235
  %v0 = insertelement <4 x i32> poison, i32 %e0, i32 0
  %v1 = insertelement <4 x i32> %v0, i32 %e1, i32 1
  %v2 = insertelement <4 x i32> %v1, i32 %e2, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %e3, i32 3
  ret <4 x i32> %v3
}


define <4 x float> @fadd_constant_rhs(float %a, float %b, float %c, float %d) {
; CHECK-LABEL: fadd_constant_rhs:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; CHECK-NEXT:    vfmv.v.f v8, fa0
; CHECK-NEXT:    lui a0, %hi(.LCPI5_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI5_0)
; CHECK-NEXT:    vle32.v v9, (a0)
; CHECK-NEXT:    vfslide1down.vf v8, v8, fa1
; CHECK-NEXT:    vfslide1down.vf v8, v8, fa2
; CHECK-NEXT:    vfslide1down.vf v8, v8, fa3
; CHECK-NEXT:    vfadd.vv v8, v8, v9
; CHECK-NEXT:    ret
  %e0 = fadd float %a, 23.0
  %e1 = fadd float %b, 25.0
  %e2 = fadd float %c, 2.0
  %e3 = fadd float %d, 23.0
  %v0 = insertelement <4 x float> poison, float %e0, i32 0
  %v1 = insertelement <4 x float> %v0, float %e1, i32 1
  %v2 = insertelement <4 x float> %v1, float %e2, i32 2
  %v3 = insertelement <4 x float> %v2, float %e3, i32 3
  ret <4 x float> %v3
}

define <4 x float> @fdiv_constant_rhs(float %a, float %b, float %c, float %d) {
; CHECK-LABEL: fdiv_constant_rhs:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; CHECK-NEXT:    vfmv.v.f v8, fa0
; CHECK-NEXT:    lui a0, %hi(.LCPI6_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI6_0)
; CHECK-NEXT:    vle32.v v9, (a0)
; CHECK-NEXT:    vfslide1down.vf v8, v8, fa1
; CHECK-NEXT:    vfslide1down.vf v8, v8, fa2
; CHECK-NEXT:    vfslide1down.vf v8, v8, fa3
; CHECK-NEXT:    vfdiv.vv v8, v8, v9
; CHECK-NEXT:    ret
  %e0 = fdiv float %a, 23.0
  %e1 = fdiv float %b, 25.0
  %e2 = fdiv float %c, 10.0
  %e3 = fdiv float %d, 23.0
  %v0 = insertelement <4 x float> poison, float %e0, i32 0
  %v1 = insertelement <4 x float> %v0, float %e1, i32 1
  %v2 = insertelement <4 x float> %v1, float %e2, i32 2
  %v3 = insertelement <4 x float> %v2, float %e3, i32 3
  ret <4 x float> %v3
}

define <4 x i32> @add_constant_rhs_splat(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: add_constant_rhs_splat:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; CHECK-NEXT:    vmv.v.x v8, a0
; CHECK-NEXT:    vslide1down.vx v8, v8, a1
; CHECK-NEXT:    vslide1down.vx v8, v8, a2
; CHECK-NEXT:    vslide1down.vx v8, v8, a3
; CHECK-NEXT:    li a0, 23
; CHECK-NEXT:    vadd.vx v8, v8, a0
; CHECK-NEXT:    ret
  %e0 = add i32 %a, 23
  %e1 = add i32 %b, 23
  %e2 = add i32 %c, 23
  %e3 = add i32 %d, 23
  %v0 = insertelement <4 x i32> poison, i32 %e0, i32 0
  %v1 = insertelement <4 x i32> %v0, i32 %e1, i32 1
  %v2 = insertelement <4 x i32> %v1, i32 %e2, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %e3, i32 3
  ret <4 x i32> %v3
}

define <4 x i32> @add_constant_rhs_with_identity(i32 %a, i32 %b, i32 %c, i32 %d) {
; RV32-LABEL: add_constant_rhs_with_identity:
; RV32:       # %bb.0:
; RV32-NEXT:    addi a1, a1, 25
; RV32-NEXT:    addi a2, a2, 1
; RV32-NEXT:    addi a3, a3, 2047
; RV32-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; RV32-NEXT:    vmv.v.x v8, a0
; RV32-NEXT:    addi a0, a3, 308
; RV32-NEXT:    vslide1down.vx v8, v8, a1
; RV32-NEXT:    vslide1down.vx v8, v8, a2
; RV32-NEXT:    vslide1down.vx v8, v8, a0
; RV32-NEXT:    ret
;
; RV64-LABEL: add_constant_rhs_with_identity:
; RV64:       # %bb.0:
; RV64-NEXT:    addiw a1, a1, 25
; RV64-NEXT:    addiw a2, a2, 1
; RV64-NEXT:    addi a3, a3, 2047
; RV64-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; RV64-NEXT:    vmv.v.x v8, a0
; RV64-NEXT:    addiw a0, a3, 308
; RV64-NEXT:    vslide1down.vx v8, v8, a1
; RV64-NEXT:    vslide1down.vx v8, v8, a2
; RV64-NEXT:    vslide1down.vx v8, v8, a0
; RV64-NEXT:    ret
  %e0 = add i32 %a, 0
  %e1 = add i32 %b, 25
  %e2 = add i32 %c, 1
  %e3 = add i32 %d, 2355
  %v0 = insertelement <4 x i32> poison, i32 %e0, i32 0
  %v1 = insertelement <4 x i32> %v0, i32 %e1, i32 1
  %v2 = insertelement <4 x i32> %v1, i32 %e2, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %e3, i32 3
  ret <4 x i32> %v3
}

define <4 x i32> @add_constant_rhs_identity(i32 %a, i32 %b, i32 %c, i32 %d) {
; RV32-LABEL: add_constant_rhs_identity:
; RV32:       # %bb.0:
; RV32-NEXT:    addi a1, a1, 25
; RV32-NEXT:    addi a2, a2, 1
; RV32-NEXT:    addi a3, a3, 2047
; RV32-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; RV32-NEXT:    vmv.v.x v8, a0
; RV32-NEXT:    addi a0, a3, 308
; RV32-NEXT:    vslide1down.vx v8, v8, a1
; RV32-NEXT:    vslide1down.vx v8, v8, a2
; RV32-NEXT:    vslide1down.vx v8, v8, a0
; RV32-NEXT:    ret
;
; RV64-LABEL: add_constant_rhs_identity:
; RV64:       # %bb.0:
; RV64-NEXT:    addiw a1, a1, 25
; RV64-NEXT:    addiw a2, a2, 1
; RV64-NEXT:    addi a3, a3, 2047
; RV64-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; RV64-NEXT:    vmv.v.x v8, a0
; RV64-NEXT:    addiw a0, a3, 308
; RV64-NEXT:    vslide1down.vx v8, v8, a1
; RV64-NEXT:    vslide1down.vx v8, v8, a2
; RV64-NEXT:    vslide1down.vx v8, v8, a0
; RV64-NEXT:    ret
  %e0 = add i32 %a, 0
  %e1 = add i32 %b, 25
  %e2 = add i32 %c, 1
  %e3 = add i32 %d, 2355
  %v0 = insertelement <4 x i32> poison, i32 %e0, i32 0
  %v1 = insertelement <4 x i32> %v0, i32 %e1, i32 1
  %v2 = insertelement <4 x i32> %v1, i32 %e2, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %e3, i32 3
  ret <4 x i32> %v3
}

define <4 x i32> @add_constant_rhs_identity2(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: add_constant_rhs_identity2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a0, a0, 23
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; CHECK-NEXT:    vmv.v.x v8, a0
; CHECK-NEXT:    vslide1down.vx v8, v8, a1
; CHECK-NEXT:    vslide1down.vx v8, v8, a2
; CHECK-NEXT:    vslide1down.vx v8, v8, a3
; CHECK-NEXT:    ret
  %e0 = add i32 %a, 23
  %v0 = insertelement <4 x i32> poison, i32 %e0, i32 0
  %v1 = insertelement <4 x i32> %v0, i32 %b, i32 1
  %v2 = insertelement <4 x i32> %v1, i32 %c, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %d, i32 3
  ret <4 x i32> %v3
}

define <4 x i32> @add_constant_rhs_inverse(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: add_constant_rhs_inverse:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; CHECK-NEXT:    vmv.v.x v8, a0
; CHECK-NEXT:    lui a0, %hi(.LCPI11_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI11_0)
; CHECK-NEXT:    vle32.v v9, (a0)
; CHECK-NEXT:    vslide1down.vx v8, v8, a1
; CHECK-NEXT:    vslide1down.vx v8, v8, a2
; CHECK-NEXT:    vslide1down.vx v8, v8, a3
; CHECK-NEXT:    vadd.vv v8, v8, v9
; CHECK-NEXT:    ret
  %e0 = sub i32 %a, 1
  %e1 = add i32 %b, 25
  %e2 = add i32 %c, 1
  %e3 = add i32 %d, 2355
  %v0 = insertelement <4 x i32> poison, i32 %e0, i32 0
  %v1 = insertelement <4 x i32> %v0, i32 %e1, i32 1
  %v2 = insertelement <4 x i32> %v1, i32 %e2, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %e3, i32 3
  ret <4 x i32> %v3
}

define <4 x i32> @add_constant_rhs_commute(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: add_constant_rhs_commute:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; CHECK-NEXT:    vmv.v.x v8, a0
; CHECK-NEXT:    lui a0, %hi(.LCPI12_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI12_0)
; CHECK-NEXT:    vle32.v v9, (a0)
; CHECK-NEXT:    vslide1down.vx v8, v8, a1
; CHECK-NEXT:    vslide1down.vx v8, v8, a2
; CHECK-NEXT:    vslide1down.vx v8, v8, a3
; CHECK-NEXT:    vadd.vv v8, v8, v9
; CHECK-NEXT:    ret
  %e0 = add i32 %a, 23
  %e1 = add i32 %b, 25
  %e2 = add i32 1, %c
  %e3 = add i32 %d, 2355
  %v0 = insertelement <4 x i32> poison, i32 %e0, i32 0
  %v1 = insertelement <4 x i32> %v0, i32 %e1, i32 1
  %v2 = insertelement <4 x i32> %v1, i32 %e2, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %e3, i32 3
  ret <4 x i32> %v3
}


define <4 x i32> @add_general_rhs(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h) {
; RV32-LABEL: add_general_rhs:
; RV32:       # %bb.0:
; RV32-NEXT:    add a0, a0, a4
; RV32-NEXT:    add a1, a1, a5
; RV32-NEXT:    add a2, a2, a6
; RV32-NEXT:    add a3, a3, a7
; RV32-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; RV32-NEXT:    vmv.v.x v8, a0
; RV32-NEXT:    vslide1down.vx v8, v8, a1
; RV32-NEXT:    vslide1down.vx v8, v8, a2
; RV32-NEXT:    vslide1down.vx v8, v8, a3
; RV32-NEXT:    ret
;
; RV64-LABEL: add_general_rhs:
; RV64:       # %bb.0:
; RV64-NEXT:    add a0, a0, a4
; RV64-NEXT:    addw a1, a1, a5
; RV64-NEXT:    addw a2, a2, a6
; RV64-NEXT:    addw a3, a3, a7
; RV64-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; RV64-NEXT:    vmv.v.x v8, a0
; RV64-NEXT:    vslide1down.vx v8, v8, a1
; RV64-NEXT:    vslide1down.vx v8, v8, a2
; RV64-NEXT:    vslide1down.vx v8, v8, a3
; RV64-NEXT:    ret
  %e0 = add i32 %a, %e
  %e1 = add i32 %b, %f
  %e2 = add i32 %c, %g
  %e3 = add i32 %d, %h
  %v0 = insertelement <4 x i32> poison, i32 %e0, i32 0
  %v1 = insertelement <4 x i32> %v0, i32 %e1, i32 1
  %v2 = insertelement <4 x i32> %v1, i32 %e2, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %e3, i32 3
  ret <4 x i32> %v3
}

define <4 x i32> @add_general_splat(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e) {
; RV32-LABEL: add_general_splat:
; RV32:       # %bb.0:
; RV32-NEXT:    add a0, a0, a4
; RV32-NEXT:    add a1, a1, a4
; RV32-NEXT:    add a2, a2, a4
; RV32-NEXT:    add a3, a3, a4
; RV32-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; RV32-NEXT:    vmv.v.x v8, a0
; RV32-NEXT:    vslide1down.vx v8, v8, a1
; RV32-NEXT:    vslide1down.vx v8, v8, a2
; RV32-NEXT:    vslide1down.vx v8, v8, a3
; RV32-NEXT:    ret
;
; RV64-LABEL: add_general_splat:
; RV64:       # %bb.0:
; RV64-NEXT:    add a0, a0, a4
; RV64-NEXT:    addw a1, a1, a4
; RV64-NEXT:    addw a2, a2, a4
; RV64-NEXT:    addw a3, a3, a4
; RV64-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; RV64-NEXT:    vmv.v.x v8, a0
; RV64-NEXT:    vslide1down.vx v8, v8, a1
; RV64-NEXT:    vslide1down.vx v8, v8, a2
; RV64-NEXT:    vslide1down.vx v8, v8, a3
; RV64-NEXT:    ret
  %e0 = add i32 %a, %e
  %e1 = add i32 %b, %e
  %e2 = add i32 %c, %e
  %e3 = add i32 %d, %e
  %v0 = insertelement <4 x i32> poison, i32 %e0, i32 0
  %v1 = insertelement <4 x i32> %v0, i32 %e1, i32 1
  %v2 = insertelement <4 x i32> %v1, i32 %e2, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %e3, i32 3
  ret <4 x i32> %v3
}

; This test previously failed with an assertion failure because constant shift
; amounts are type legalized early.
define void @buggy(i32 %0) #0 {
; RV32-LABEL: buggy:
; RV32:       # %bb.0: # %entry
; RV32-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; RV32-NEXT:    vmv.s.x v8, a0
; RV32-NEXT:    vadd.vv v8, v8, v8
; RV32-NEXT:    vor.vi v8, v8, 1
; RV32-NEXT:    vrgather.vi v9, v8, 0
; RV32-NEXT:    vse32.v v9, (zero)
; RV32-NEXT:    ret
;
; RV64-LABEL: buggy:
; RV64:       # %bb.0: # %entry
; RV64-NEXT:    slli a0, a0, 1
; RV64-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; RV64-NEXT:    vmv.s.x v8, a0
; RV64-NEXT:    vor.vi v8, v8, 1
; RV64-NEXT:    vrgather.vi v9, v8, 0
; RV64-NEXT:    vse32.v v9, (zero)
; RV64-NEXT:    ret
entry:
  %mul.us.us.i.3 = shl i32 %0, 1
  %1 = insertelement <4 x i32> zeroinitializer, i32 %mul.us.us.i.3, i64 0
  %2 = or <4 x i32> %1, <i32 1, i32 1, i32 1, i32 1>
  %3 = shufflevector <4 x i32> %2, <4 x i32> zeroinitializer, <4 x i32> zeroinitializer
  store <4 x i32> %3, ptr null, align 16
  ret void
}


define <8 x i32> @add_constant_rhs_8xi32_vector_in(<8 x i32> %vin, i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: add_constant_rhs_8xi32_vector_in:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a0, a0, 23
; CHECK-NEXT:    addi a1, a1, 25
; CHECK-NEXT:    addi a2, a2, 1
; CHECK-NEXT:    addi a3, a3, 2047
; CHECK-NEXT:    addi a3, a3, 308
; CHECK-NEXT:    vsetivli zero, 2, e32, m1, tu, ma
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    vmv.s.x v10, a1
; CHECK-NEXT:    vslideup.vi v8, v10, 1
; CHECK-NEXT:    vmv.s.x v10, a2
; CHECK-NEXT:    vsetivli zero, 3, e32, m1, tu, ma
; CHECK-NEXT:    vslideup.vi v8, v10, 2
; CHECK-NEXT:    vmv.s.x v10, a3
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, tu, ma
; CHECK-NEXT:    vslideup.vi v8, v10, 3
; CHECK-NEXT:    ret
  %e0 = add i32 %a, 23
  %e1 = add i32 %b, 25
  %e2 = add i32 %c, 1
  %e3 = add i32 %d, 2355
  %v0 = insertelement <8 x i32> %vin, i32 %e0, i32 0
  %v1 = insertelement <8 x i32> %v0, i32 %e1, i32 1
  %v2 = insertelement <8 x i32> %v1, i32 %e2, i32 2
  %v3 = insertelement <8 x i32> %v2, i32 %e3, i32 3
  ret <8 x i32> %v3
}

define <8 x i32> @add_constant_rhs_8xi32_vector_in2(<8 x i32> %vin, i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: add_constant_rhs_8xi32_vector_in2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a0, a0, 23
; CHECK-NEXT:    addi a1, a1, 25
; CHECK-NEXT:    addi a2, a2, 1
; CHECK-NEXT:    addi a3, a3, 2047
; CHECK-NEXT:    addi a3, a3, 308
; CHECK-NEXT:    vsetivli zero, 5, e32, m2, tu, ma
; CHECK-NEXT:    vmv.s.x v10, a0
; CHECK-NEXT:    vslideup.vi v8, v10, 4
; CHECK-NEXT:    vmv.s.x v10, a1
; CHECK-NEXT:    vsetivli zero, 6, e32, m2, tu, ma
; CHECK-NEXT:    vslideup.vi v8, v10, 5
; CHECK-NEXT:    vmv.s.x v10, a2
; CHECK-NEXT:    vsetivli zero, 7, e32, m2, tu, ma
; CHECK-NEXT:    vslideup.vi v8, v10, 6
; CHECK-NEXT:    vmv.s.x v10, a3
; CHECK-NEXT:    vsetivli zero, 8, e32, m2, ta, ma
; CHECK-NEXT:    vslideup.vi v8, v10, 7
; CHECK-NEXT:    ret
  %e0 = add i32 %a, 23
  %e1 = add i32 %b, 25
  %e2 = add i32 %c, 1
  %e3 = add i32 %d, 2355
  %v0 = insertelement <8 x i32> %vin, i32 %e0, i32 4
  %v1 = insertelement <8 x i32> %v0, i32 %e1, i32 5
  %v2 = insertelement <8 x i32> %v1, i32 %e2, i32 6
  %v3 = insertelement <8 x i32> %v2, i32 %e3, i32 7
  ret <8 x i32> %v3
}

define <8 x i32> @add_constant_rhs_8xi32_vector_in3(<8 x i32> %vin, i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: add_constant_rhs_8xi32_vector_in3:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a0, a0, 23
; CHECK-NEXT:    addi a1, a1, 25
; CHECK-NEXT:    addi a2, a2, 1
; CHECK-NEXT:    addi a3, a3, 2047
; CHECK-NEXT:    addi a3, a3, 308
; CHECK-NEXT:    vsetivli zero, 3, e32, m1, tu, ma
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    vmv.s.x v10, a1
; CHECK-NEXT:    vslideup.vi v8, v10, 2
; CHECK-NEXT:    vmv.s.x v10, a2
; CHECK-NEXT:    vsetivli zero, 5, e32, m2, tu, ma
; CHECK-NEXT:    vslideup.vi v8, v10, 4
; CHECK-NEXT:    vmv.s.x v10, a3
; CHECK-NEXT:    vsetivli zero, 7, e32, m2, tu, ma
; CHECK-NEXT:    vslideup.vi v8, v10, 6
; CHECK-NEXT:    ret
  %e0 = add i32 %a, 23
  %e1 = add i32 %b, 25
  %e2 = add i32 %c, 1
  %e3 = add i32 %d, 2355
  %v0 = insertelement <8 x i32> %vin, i32 %e0, i32 0
  %v1 = insertelement <8 x i32> %v0, i32 %e1, i32 2
  %v2 = insertelement <8 x i32> %v1, i32 %e2, i32 4
  %v3 = insertelement <8 x i32> %v2, i32 %e3, i32 6
  ret <8 x i32> %v3
}

define <8 x i32> @add_constant_rhs_8xi32_partial(<8 x i32> %vin, i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: add_constant_rhs_8xi32_partial:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 5, e32, m2, tu, ma
; CHECK-NEXT:    vmv.s.x v10, a0
; CHECK-NEXT:    vmv.s.x v12, a1
; CHECK-NEXT:    vslideup.vi v8, v10, 4
; CHECK-NEXT:    vmv.s.x v10, a2
; CHECK-NEXT:    lui a0, %hi(.LCPI19_0)
; CHECK-NEXT:    addi a0, a0, %lo(.LCPI19_0)
; CHECK-NEXT:    vsetivli zero, 6, e32, m2, tu, ma
; CHECK-NEXT:    vslideup.vi v8, v12, 5
; CHECK-NEXT:    vsetivli zero, 8, e32, m2, ta, ma
; CHECK-NEXT:    vle32.v v12, (a0)
; CHECK-NEXT:    vsetivli zero, 7, e32, m2, tu, ma
; CHECK-NEXT:    vslideup.vi v8, v10, 6
; CHECK-NEXT:    vmv.s.x v10, a3
; CHECK-NEXT:    vsetivli zero, 8, e32, m2, ta, ma
; CHECK-NEXT:    vslideup.vi v8, v10, 7
; CHECK-NEXT:    vadd.vv v8, v8, v12
; CHECK-NEXT:    ret
  %vadd = add <8 x i32> %vin, <i32 1, i32 2, i32 3, i32 5, i32 undef, i32 undef, i32 undef, i32 undef>
  %e0 = add i32 %a, 23
  %e1 = add i32 %b, 25
  %e2 = add i32 %c, 1
  %e3 = add i32 %d, 2355
  %v0 = insertelement <8 x i32> %vadd, i32 %e0, i32 4
  %v1 = insertelement <8 x i32> %v0, i32 %e1, i32 5
  %v2 = insertelement <8 x i32> %v1, i32 %e2, i32 6
  %v3 = insertelement <8 x i32> %v2, i32 %e3, i32 7
  ret <8 x i32> %v3
}

; Here we can not pull the ashr through into the vector domain due to
; the truncate semantics of the build_vector.  Doing so would
; truncate before the ashr instead of after it, so if %a or %b
; is e.g. UINT32_MAX+1 we get different result.
define <2 x i32> @build_vec_of_trunc_op(i64 %a, i64 %b) {
; RV32-LABEL: build_vec_of_trunc_op:
; RV32:       # %bb.0: # %entry
; RV32-NEXT:    slli a1, a1, 31
; RV32-NEXT:    srli a0, a0, 1
; RV32-NEXT:    slli a3, a3, 31
; RV32-NEXT:    srli a2, a2, 1
; RV32-NEXT:    or a0, a0, a1
; RV32-NEXT:    or a2, a2, a3
; RV32-NEXT:    vsetivli zero, 2, e32, mf2, ta, ma
; RV32-NEXT:    vmv.v.x v8, a0
; RV32-NEXT:    vslide1down.vx v8, v8, a2
; RV32-NEXT:    ret
;
; RV64-LABEL: build_vec_of_trunc_op:
; RV64:       # %bb.0: # %entry
; RV64-NEXT:    srli a0, a0, 1
; RV64-NEXT:    srli a1, a1, 1
; RV64-NEXT:    vsetivli zero, 2, e32, mf2, ta, ma
; RV64-NEXT:    vmv.v.x v8, a0
; RV64-NEXT:    vslide1down.vx v8, v8, a1
; RV64-NEXT:    ret
entry:
  %conv11.i = ashr i64 %a, 1
  %conv11.2 = ashr i64 %b, 1
  %0 = trunc i64 %conv11.i to i32
  %1 = trunc i64 %conv11.2 to i32
  %2 = insertelement <2 x i32> zeroinitializer, i32 %0, i64 0
  %3 = insertelement <2 x i32> %2, i32 %1, i64 1
  ret <2 x i32> %3
}
