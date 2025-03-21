; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown-unknown -mattr=+avx2 | FileCheck %s --check-prefixes=CHECK,X86
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx2 | FileCheck %s --check-prefixes=CHECK,X64

define <4 x i64> @test_vpaddq(<4 x i64> %i, <4 x i64> %j) nounwind readnone {
; CHECK-LABEL: test_vpaddq:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpaddq %ymm1, %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %x = add <4 x i64> %i, %j
  ret <4 x i64> %x
}

define <8 x i32> @test_vpaddd(<8 x i32> %i, <8 x i32> %j) nounwind readnone {
; CHECK-LABEL: test_vpaddd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpaddd %ymm1, %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %x = add <8 x i32> %i, %j
  ret <8 x i32> %x
}

define <16 x i16> @test_vpaddw(<16 x i16> %i, <16 x i16> %j) nounwind readnone {
; CHECK-LABEL: test_vpaddw:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpaddw %ymm1, %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %x = add <16 x i16> %i, %j
  ret <16 x i16> %x
}

define <32 x i8> @test_vpaddb(<32 x i8> %i, <32 x i8> %j) nounwind readnone {
; CHECK-LABEL: test_vpaddb:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpaddb %ymm1, %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %x = add <32 x i8> %i, %j
  ret <32 x i8> %x
}

define <4 x i64> @test_vpsubq(<4 x i64> %i, <4 x i64> %j) nounwind readnone {
; CHECK-LABEL: test_vpsubq:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpsubq %ymm1, %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %x = sub <4 x i64> %i, %j
  ret <4 x i64> %x
}

define <8 x i32> @test_vpsubd(<8 x i32> %i, <8 x i32> %j) nounwind readnone {
; CHECK-LABEL: test_vpsubd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpsubd %ymm1, %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %x = sub <8 x i32> %i, %j
  ret <8 x i32> %x
}

define <16 x i16> @test_vpsubw(<16 x i16> %i, <16 x i16> %j) nounwind readnone {
; CHECK-LABEL: test_vpsubw:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpsubw %ymm1, %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %x = sub <16 x i16> %i, %j
  ret <16 x i16> %x
}

define <32 x i8> @test_vpsubb(<32 x i8> %i, <32 x i8> %j) nounwind readnone {
; CHECK-LABEL: test_vpsubb:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpsubb %ymm1, %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %x = sub <32 x i8> %i, %j
  ret <32 x i8> %x
}

define <8 x i32> @test_vpmulld(<8 x i32> %i, <8 x i32> %j) nounwind readnone {
; CHECK-LABEL: test_vpmulld:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpmulld %ymm1, %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %x = mul <8 x i32> %i, %j
  ret <8 x i32> %x
}

define <16 x i16> @test_vpmullw(<16 x i16> %i, <16 x i16> %j) nounwind readnone {
; CHECK-LABEL: test_vpmullw:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpmullw %ymm1, %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %x = mul <16 x i16> %i, %j
  ret <16 x i16> %x
}

define <16 x i8> @mul_v16i8(<16 x i8> %i, <16 x i8> %j) nounwind readnone {
; X86-LABEL: mul_v16i8:
; X86:       # %bb.0:
; X86-NEXT:    vpmovzxbw {{.*#+}} ymm1 = xmm1[0],zero,xmm1[1],zero,xmm1[2],zero,xmm1[3],zero,xmm1[4],zero,xmm1[5],zero,xmm1[6],zero,xmm1[7],zero,xmm1[8],zero,xmm1[9],zero,xmm1[10],zero,xmm1[11],zero,xmm1[12],zero,xmm1[13],zero,xmm1[14],zero,xmm1[15],zero
; X86-NEXT:    vpmovzxbw {{.*#+}} ymm0 = xmm0[0],zero,xmm0[1],zero,xmm0[2],zero,xmm0[3],zero,xmm0[4],zero,xmm0[5],zero,xmm0[6],zero,xmm0[7],zero,xmm0[8],zero,xmm0[9],zero,xmm0[10],zero,xmm0[11],zero,xmm0[12],zero,xmm0[13],zero,xmm0[14],zero,xmm0[15],zero
; X86-NEXT:    vpmullw %ymm1, %ymm0, %ymm0
; X86-NEXT:    vpand {{\.?LCPI[0-9]+_[0-9]+}}, %ymm0, %ymm0
; X86-NEXT:    vextracti128 $1, %ymm0, %xmm1
; X86-NEXT:    vpackuswb %xmm1, %xmm0, %xmm0
; X86-NEXT:    vzeroupper
; X86-NEXT:    retl
;
; X64-LABEL: mul_v16i8:
; X64:       # %bb.0:
; X64-NEXT:    vpmovzxbw {{.*#+}} ymm1 = xmm1[0],zero,xmm1[1],zero,xmm1[2],zero,xmm1[3],zero,xmm1[4],zero,xmm1[5],zero,xmm1[6],zero,xmm1[7],zero,xmm1[8],zero,xmm1[9],zero,xmm1[10],zero,xmm1[11],zero,xmm1[12],zero,xmm1[13],zero,xmm1[14],zero,xmm1[15],zero
; X64-NEXT:    vpmovzxbw {{.*#+}} ymm0 = xmm0[0],zero,xmm0[1],zero,xmm0[2],zero,xmm0[3],zero,xmm0[4],zero,xmm0[5],zero,xmm0[6],zero,xmm0[7],zero,xmm0[8],zero,xmm0[9],zero,xmm0[10],zero,xmm0[11],zero,xmm0[12],zero,xmm0[13],zero,xmm0[14],zero,xmm0[15],zero
; X64-NEXT:    vpmullw %ymm1, %ymm0, %ymm0
; X64-NEXT:    vpand {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %ymm0, %ymm0
; X64-NEXT:    vextracti128 $1, %ymm0, %xmm1
; X64-NEXT:    vpackuswb %xmm1, %xmm0, %xmm0
; X64-NEXT:    vzeroupper
; X64-NEXT:    retq
  %x = mul <16 x i8> %i, %j
  ret <16 x i8> %x
}

define <32 x i8> @mul_v32i8(<32 x i8> %i, <32 x i8> %j) nounwind readnone {
; CHECK-LABEL: mul_v32i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpbroadcastw {{.*#+}} ymm2 = [255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255]
; CHECK-NEXT:    vpand %ymm2, %ymm1, %ymm3
; CHECK-NEXT:    vpmaddubsw %ymm3, %ymm0, %ymm3
; CHECK-NEXT:    vpand %ymm2, %ymm3, %ymm3
; CHECK-NEXT:    vpandn %ymm1, %ymm2, %ymm1
; CHECK-NEXT:    vpmaddubsw %ymm1, %ymm0, %ymm0
; CHECK-NEXT:    vpsllw $8, %ymm0, %ymm0
; CHECK-NEXT:    vpor %ymm0, %ymm3, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %x = mul <32 x i8> %i, %j
  ret <32 x i8> %x
}

define <4 x i64> @mul_v4i64(<4 x i64> %i, <4 x i64> %j) nounwind readnone {
; CHECK-LABEL: mul_v4i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpsrlq $32, %ymm0, %ymm2
; CHECK-NEXT:    vpmuludq %ymm1, %ymm2, %ymm2
; CHECK-NEXT:    vpsrlq $32, %ymm1, %ymm3
; CHECK-NEXT:    vpmuludq %ymm3, %ymm0, %ymm3
; CHECK-NEXT:    vpaddq %ymm2, %ymm3, %ymm2
; CHECK-NEXT:    vpsllq $32, %ymm2, %ymm2
; CHECK-NEXT:    vpmuludq %ymm1, %ymm0, %ymm0
; CHECK-NEXT:    vpaddq %ymm2, %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %x = mul <4 x i64> %i, %j
  ret <4 x i64> %x
}

define <8 x i32> @mul_const1(<8 x i32> %x) {
; CHECK-LABEL: mul_const1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpaddd %ymm0, %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %y = mul <8 x i32> %x, <i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2>
  ret <8 x i32> %y
}

define <4 x i64> @mul_const2(<4 x i64> %x) {
; CHECK-LABEL: mul_const2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpsllq $2, %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %y = mul <4 x i64> %x, <i64 4, i64 4, i64 4, i64 4>
  ret <4 x i64> %y
}

define <16 x i16> @mul_const3(<16 x i16> %x) {
; CHECK-LABEL: mul_const3:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpsllw $3, %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %y = mul <16 x i16> %x, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  ret <16 x i16> %y
}

define <4 x i64> @mul_const4(<4 x i64> %x) {
; CHECK-LABEL: mul_const4:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; CHECK-NEXT:    vpsubq %ymm0, %ymm1, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %y = mul <4 x i64> %x, <i64 -1, i64 -1, i64 -1, i64 -1>
  ret <4 x i64> %y
}

define <8 x i32> @mul_const5(<8 x i32> %x) {
; CHECK-LABEL: mul_const5:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vxorps %xmm0, %xmm0, %xmm0
; CHECK-NEXT:    ret{{[l|q]}}
  %y = mul <8 x i32> %x, <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>
  ret <8 x i32> %y
}

define <8 x i32> @mul_const6(<8 x i32> %x) {
; X86-LABEL: mul_const6:
; X86:       # %bb.0:
; X86-NEXT:    vpmulld {{\.?LCPI[0-9]+_[0-9]+}}, %ymm0, %ymm0
; X86-NEXT:    retl
;
; X64-LABEL: mul_const6:
; X64:       # %bb.0:
; X64-NEXT:    vpmulld {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %ymm0, %ymm0
; X64-NEXT:    retq
  %y = mul <8 x i32> %x, <i32 0, i32 0, i32 0, i32 2, i32 0, i32 2, i32 0, i32 0>
  ret <8 x i32> %y
}

define <8 x i64> @mul_const7(<8 x i64> %x) {
; CHECK-LABEL: mul_const7:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpaddq %ymm0, %ymm0, %ymm0
; CHECK-NEXT:    vpaddq %ymm1, %ymm1, %ymm1
; CHECK-NEXT:    ret{{[l|q]}}
  %y = mul <8 x i64> %x, <i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2>
  ret <8 x i64> %y
}

define <8 x i16> @mul_const8(<8 x i16> %x) {
; CHECK-LABEL: mul_const8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpsllw $3, %xmm0, %xmm0
; CHECK-NEXT:    ret{{[l|q]}}
  %y = mul <8 x i16> %x, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  ret <8 x i16> %y
}

define <8 x i32> @mul_const9(<8 x i32> %x) {
; CHECK-LABEL: mul_const9:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpmovsxbq {{.*#+}} xmm1 = [2,0]
; CHECK-NEXT:    vpmulld %ymm1, %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %y = mul <8 x i32> %x, <i32 2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>
  ret <8 x i32> %y
}

; ptr 0x01010101
define <4 x i32> @mul_const10(<4 x i32> %x) {
; CHECK-LABEL: mul_const10:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpbroadcastd {{.*#+}} xmm1 = [16843009,16843009,16843009,16843009]
; CHECK-NEXT:    vpmulld %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    ret{{[l|q]}}
  %m = mul <4 x i32> %x, <i32 16843009, i32 16843009, i32 16843009, i32 16843009>
  ret <4 x i32> %m
}

; ptr 0x80808080
define <4 x i32> @mul_const11(<4 x i32> %x) {
; CHECK-LABEL: mul_const11:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpbroadcastd {{.*#+}} xmm1 = [2155905152,2155905152,2155905152,2155905152]
; CHECK-NEXT:    vpmulld %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    ret{{[l|q]}}
  %m = mul <4 x i32> %x, <i32 2155905152, i32 2155905152, i32 2155905152, i32 2155905152>
  ret <4 x i32> %m
}

; check we will zero both vectors.
define void @multi_freeze(<2 x double> %x, <2 x double> %y) nounwind {
; X86-LABEL: multi_freeze:
; X86:       # %bb.0:
; X86-NEXT:    vmovaps %xmm0, %xmm0
; X86-NEXT:    vmovaps %xmm1, %xmm1
; X86-NEXT:    calll foo@PLT
; X86-NEXT:    vzeroupper
; X86-NEXT:    retl
;
; X64-LABEL: multi_freeze:
; X64:       # %bb.0:
; X64-NEXT:    pushq %rax
; X64-NEXT:    vmovaps %xmm0, %xmm0
; X64-NEXT:    vmovaps %xmm1, %xmm1
; X64-NEXT:    callq foo@PLT
; X64-NEXT:    popq %rax
; X64-NEXT:    vzeroupper
; X64-NEXT:    retq
  %1 = freeze <2 x double> poison
  %2 = shufflevector <2 x double> %x, <2 x double> %1, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %3 = shufflevector <2 x double> %y, <2 x double> %1, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  call void @foo(<4 x double> %2, <4 x double> %3)
  ret void
}

declare void @foo(<4 x double>, <4 x double>)
