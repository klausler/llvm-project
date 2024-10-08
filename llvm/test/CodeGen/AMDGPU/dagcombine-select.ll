; RUN: llc -mtriple=amdgcn -mcpu=gfx900 -verify-machineinstrs < %s | FileCheck -enable-var-scope -check-prefix=GCN %s

; GCN-LABEL: {{^}}select_and1:
; GCN:     s_cselect_b32 [[SEL:s[0-9]+]], s{{[0-9]+}},
; GCN:     v_mov_b32_e32 [[VSEL:v[0-9]+]], [[SEL]]
; GCN-NOT: v_and_b32
; GCN:     store_dword v{{[0-9]+}}, [[VSEL]], s{{\[[0-9]+:[0-9]+\]}}
define amdgpu_kernel void @select_and1(ptr addrspace(1) %p, i32 %x, i32 %y) {
  %c = icmp slt i32 %x, 11
  %s = select i1 %c, i32 0, i32 -1
  %a = and i32 %y, %s
  store i32 %a, ptr addrspace(1) %p, align 4
  ret void
}

; GCN-LABEL: {{^}}select_and2:
; GCN:     s_cselect_b32 [[SEL:s[0-9]+]], s{{[0-9]+}},
; GCN:     v_mov_b32_e32 [[VSEL:v[0-9]+]], [[SEL]]
; GCN-NOT: v_and_b32
; GCN:     store_dword v{{[0-9]+}}, [[VSEL]], s{{\[[0-9]+:[0-9]+\]}}
define amdgpu_kernel void @select_and2(ptr addrspace(1) %p, i32 %x, i32 %y) {
  %c = icmp slt i32 %x, 11
  %s = select i1 %c, i32 0, i32 -1
  %a = and i32 %s, %y
  store i32 %a, ptr addrspace(1) %p, align 4
  ret void
}

; GCN-LABEL: {{^}}select_and3:
; GCN:     s_cselect_b32 [[SEL:s[0-9]+]], s{{[0-9]+}},
; GCN:     v_mov_b32_e32 [[VSEL:v[0-9]+]], [[SEL]]
; GCN-NOT: v_and_b32
; GCN:     store_dword v{{[0-9]+}}, [[VSEL]], s{{\[[0-9]+:[0-9]+\]}}
define amdgpu_kernel void @select_and3(ptr addrspace(1) %p, i32 %x, i32 %y) {
  %c = icmp slt i32 %x, 11
  %s = select i1 %c, i32 -1, i32 0
  %a = and i32 %y, %s
  store i32 %a, ptr addrspace(1) %p, align 4
  ret void
}

; GCN-LABEL: {{^}}select_and_v4:
; GCN:     s_cselect_b32 s[[SEL0:[0-9]+]], s{{[0-9]+}}, 0
; GCN:     s_cselect_b32 s[[SEL1:[0-9]+]], s{{[0-9]+}}, 0
; GCN:     s_cselect_b32 s[[SEL2:[0-9]+]], s{{[0-9]+}}, 0
; GCN:     s_cselect_b32 s[[SEL3:[0-9]+]], s{{[0-9]+}}, 0
; GCN:     v_mov_b32_e32 v[[V0:[0-9]+]], s[[SEL3]]
; GCN:     v_mov_b32_e32 v[[V1:[0-9]+]], s[[SEL2]]
; GCN:     v_mov_b32_e32 v[[V2:[0-9]+]], s[[SEL1]]
; GCN:     v_mov_b32_e32 v[[V3:[0-9]+]], s[[SEL0]]
; GCN-NOT: v_and_b32
; GCN:     global_store_dwordx4 v{{[0-9]+}}, v[[[V0]]:[[V3]]]
define amdgpu_kernel void @select_and_v4(ptr addrspace(1) %p, i32 %x, <4 x i32> %y) {
  %c = icmp slt i32 %x, 11
  %s = select i1 %c, <4 x i32> zeroinitializer, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>
  %a = and <4 x i32> %s, %y
  store <4 x i32> %a, ptr addrspace(1) %p, align 32
  ret void
}

; GCN-LABEL: {{^}}select_or1:
; GCN:     s_cselect_b32 [[SEL:s[0-9]+]], s{{[0-9]+}},
; GCN:     v_mov_b32_e32 [[VSEL:v[0-9]+]], [[SEL]]
; GCN-NOT: v_or_b32
; GCN:     store_dword v{{[0-9]+}}, [[VSEL]], s{{\[[0-9]+:[0-9]+\]}}
define amdgpu_kernel void @select_or1(ptr addrspace(1) %p, i32 %x, i32 %y) {
  %c = icmp slt i32 %x, 11
  %s = select i1 %c, i32 0, i32 -1
  %a = or i32 %y, %s
  store i32 %a, ptr addrspace(1) %p, align 4
  ret void
}

; GCN-LABEL: {{^}}select_or2:
; GCN:     s_cselect_b32 [[SEL:s[0-9]+]], s{{[0-9]+}},
; GCN:     v_mov_b32_e32 [[VSEL:v[0-9]+]], [[SEL]]
; GCN-NOT: v_or_b32
; GCN:     store_dword v{{[0-9]+}}, [[VSEL]], s{{\[[0-9]+:[0-9]+\]}}
define amdgpu_kernel void @select_or2(ptr addrspace(1) %p, i32 %x, i32 %y) {
  %c = icmp slt i32 %x, 11
  %s = select i1 %c, i32 0, i32 -1
  %a = or i32 %s, %y
  store i32 %a, ptr addrspace(1) %p, align 4
  ret void
}

; GCN-LABEL: {{^}}select_or3:
; GCN:     s_cselect_b32 [[SEL:s[0-9]+]], s{{[0-9]+}},
; GCN:     v_mov_b32_e32 [[VSEL:v[0-9]+]], [[SEL]]
; GCN-NOT: v_or_b32
; GCN:     store_dword v{{[0-9]+}}, [[VSEL]], s{{\[[0-9]+:[0-9]+\]}}
define amdgpu_kernel void @select_or3(ptr addrspace(1) %p, i32 %x, i32 %y) {
  %c = icmp slt i32 %x, 11
  %s = select i1 %c, i32 -1, i32 0
  %a = or i32 %y, %s
  store i32 %a, ptr addrspace(1) %p, align 4
  ret void
}

; GCN-LABEL: {{^}}select_or_v4:
; GCN:     s_cselect_b32 s[[SEL0:[0-9]+]], s{{[0-9]+}}, -1
; GCN:     s_cselect_b32 s[[SEL1:[0-9]+]], s{{[0-9]+}}, -1
; GCN:     s_cselect_b32 s[[SEL2:[0-9]+]], s{{[0-9]+}}, -1
; GCN:     s_cselect_b32 s[[SEL3:[0-9]+]], s{{[0-9]+}}, -1
; GCN-NOT: v_or_b32
; GCN:     v_mov_b32_e32 v[[V0:[0-9]+]], s[[SEL3]]
; GCN:     v_mov_b32_e32 v[[V1:[0-9]+]], s[[SEL2]]
; GCN:     v_mov_b32_e32 v[[V2:[0-9]+]], s[[SEL1]]
; GCN:     v_mov_b32_e32 v[[V3:[0-9]+]], s[[SEL0]]
; GCN:     global_store_dwordx4 v{{[0-9]+}}, v[[[V0]]:[[V3]]]
define amdgpu_kernel void @select_or_v4(ptr addrspace(1) %p, i32 %x, <4 x i32> %y) {
  %c = icmp slt i32 %x, 11
  %s = select i1 %c, <4 x i32> zeroinitializer, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>
  %a = or <4 x i32> %s, %y
  store <4 x i32> %a, ptr addrspace(1) %p, align 32
  ret void
}

; GCN-LABEL: {{^}}sel_constants_sub_constant_sel_constants:
; GCN: s_cselect_b32 s{{[0-9]+}}, 9, 2
define amdgpu_kernel void @sel_constants_sub_constant_sel_constants(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, i32 -4, i32 3
  %bo = sub i32 5, %sel
  store i32 %bo, ptr addrspace(1) %p, align 4
  ret void
}

; GCN-LABEL: {{^}}sel_constants_sub_constant_sel_constants_i16:
; GCN: s_cselect_b32 s{{[0-9]+}}, 9, 2
define amdgpu_kernel void @sel_constants_sub_constant_sel_constants_i16(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, i16 -4, i16 3
  %bo = sub i16 5, %sel
  store i16 %bo, ptr addrspace(1) %p, align 2
  ret void
}

; GCN-LABEL: {{^}}sel_constants_sub_constant_sel_constants_i16_neg:
; GCN: s_cselect_b32 s[[SGPR:[0-9]+]], s[[SGPR]], 0xf449
define amdgpu_kernel void @sel_constants_sub_constant_sel_constants_i16_neg(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, i16 4, i16 3000
  %bo = sub i16 1, %sel
  store i16 %bo, ptr addrspace(1) %p, align 2
  ret void
}

; GCN-LABEL: {{^}}sel_constants_sub_constant_sel_constants_v2i16:
; GCN-DAG: s_mov_b32 [[T:s[0-9]+]], 0x50009
; GCN:     s_cselect_b32 s{{[0-9]+}}, [[T]], 0x60002
define amdgpu_kernel void @sel_constants_sub_constant_sel_constants_v2i16(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, <2 x i16> <i16 -4, i16 2>, <2 x i16> <i16 3, i16 1>
  %bo = sub <2 x i16> <i16 5, i16 7>, %sel
  store <2 x i16> %bo, ptr addrspace(1) %p, align 4
  ret void
}

; GCN-LABEL: {{^}}sel_constants_sub_constant_sel_constants_v4i32:
; GCN:     s_cselect_b32 s[[SEL0:[0-9]+]], 7, 14
; GCN:     s_cselect_b32 s[[SEL1:[0-9]+]], 6, 10
; GCN:     s_cselect_b32 s[[SEL2:[0-9]+]], 5, 6
; GCN:     s_cselect_b32 s[[SEL3:[0-9]+]], 9, 2
; GCN:     v_mov_b32_e32 v[[V0:[0-9]+]], s[[SEL3]]
; GCN:     v_mov_b32_e32 v[[V1:[0-9]+]], s[[SEL2]]
; GCN:     v_mov_b32_e32 v[[V2:[0-9]+]], s[[SEL1]]
; GCN:     v_mov_b32_e32 v[[V3:[0-9]+]], s[[SEL0]]
; GCN:     global_store_dwordx4 v{{[0-9]+}}, v[[[V0]]:[[V3]]]
define amdgpu_kernel void @sel_constants_sub_constant_sel_constants_v4i32(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, <4 x i32> <i32 -4, i32 2, i32 3, i32 4>, <4 x i32> <i32 3, i32 1, i32 -1, i32 -3>
  %bo = sub <4 x i32> <i32 5, i32 7, i32 9, i32 11>, %sel
  store <4 x i32> %bo, ptr addrspace(1) %p, align 32
  ret void
}

; GCN-LABEL: {{^}}sdiv_constant_sel_constants_i64:
; GCN: s_cselect_b32 s{{[0-9]+}}, 0, 5
define amdgpu_kernel void @sdiv_constant_sel_constants_i64(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, i64 121, i64 23
  %bo = sdiv i64 120, %sel
  store i64 %bo, ptr addrspace(1) %p, align 8
  ret void
}

; GCN-LABEL: {{^}}sdiv_constant_sel_constants_i32:
; GCN: s_cselect_b32 s{{[0-9]+}}, 26, 8
define amdgpu_kernel void @sdiv_constant_sel_constants_i32(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, i32 7, i32 23
  %bo = sdiv i32 184, %sel
  store i32 %bo, ptr addrspace(1) %p, align 8
  ret void
}

; GCN-LABEL: {{^}}udiv_constant_sel_constants_i64:
; GCN: s_cselect_b32 s{{[0-9]+}}, 0, 5
define amdgpu_kernel void @udiv_constant_sel_constants_i64(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, i64 -4, i64 23
  %bo = udiv i64 120, %sel
  store i64 %bo, ptr addrspace(1) %p, align 8
  ret void
}

; GCN-LABEL: {{^}}srem_constant_sel_constants:
; GCN: s_cselect_b32 s{{[0-9]+}}, 33, 3
define amdgpu_kernel void @srem_constant_sel_constants(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, i64 34, i64 15
  %bo = srem i64 33, %sel
  store i64 %bo, ptr addrspace(1) %p, align 8
  ret void
}

; GCN-LABEL: {{^}}urem_constant_sel_constants:
; GCN: s_cselect_b32 s{{[0-9]+}}, 33, 3
define amdgpu_kernel void @urem_constant_sel_constants(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, i64 34, i64 15
  %bo = urem i64 33, %sel
  store i64 %bo, ptr addrspace(1) %p, align 8
  ret void
}

; GCN-LABEL: {{^}}shl_constant_sel_constants:
; GCN: s_cselect_b32 s{{[0-9]+}}, 4, 8
define amdgpu_kernel void @shl_constant_sel_constants(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, i32 2, i32 3
  %bo = shl i32 1, %sel
  store i32 %bo, ptr addrspace(1) %p, align 4
  ret void
}

; GCN-LABEL: {{^}}lshr_constant_sel_constants:
; GCN: s_cselect_b32 s{{[0-9]+}}, 16, 8
define amdgpu_kernel void @lshr_constant_sel_constants(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, i32 2, i32 3
  %bo = lshr i32 64, %sel
  store i32 %bo, ptr addrspace(1) %p, align 4
  ret void
}

; GCN-LABEL: {{^}}ashr_constant_sel_constants:
; GCN: s_cselect_b32 s{{[0-9]+}}, 32, 16
define amdgpu_kernel void @ashr_constant_sel_constants(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, i32 2, i32 3
  %bo = ashr i32 128, %sel
  store i32 %bo, ptr addrspace(1) %p, align 4
  ret void
}

; GCN-LABEL: {{^}}fsub_constant_sel_constants:
; GCN: v_cndmask_b32_e64 v{{[0-9]+}}, -4.0, 1.0,
define amdgpu_kernel void @fsub_constant_sel_constants(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, float -2.0, float 3.0
  %bo = fsub float -1.0, %sel
  store float %bo, ptr addrspace(1) %p, align 4
  ret void
}

; GCN-LABEL: {{^}}fsub_constant_sel_constants_f16:
; TODO: it shall be possible to fold constants with OpSel
; GCN-DAG: v_mov_b32_e32 [[T:v[0-9]+]], 0x3c00
; GCN-DAG: v_mov_b32_e32 [[F:v[0-9]+]], 0xc400
; GCN:     v_cndmask_b32_e32 v{{[0-9]+}}, [[F]], [[T]],
define amdgpu_kernel void @fsub_constant_sel_constants_f16(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, half -2.0, half 3.0
  %bo = fsub half -1.0, %sel
  store half %bo, ptr addrspace(1) %p, align 2
  ret void
}

; GCN-LABEL: {{^}}fsub_constant_sel_constants_v2f16:
; GCN:     s_cselect_b32 s{{[0-9]+}}, 0x45003c00, -2.0
define amdgpu_kernel void @fsub_constant_sel_constants_v2f16(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, <2 x half> <half -2.0, half -3.0>, <2 x half> <half -1.0, half 4.0>
  %bo = fsub <2 x half> <half -1.0, half 2.0>, %sel
  store <2 x half> %bo, ptr addrspace(1) %p, align 4
  ret void
}

; GCN-LABEL: {{^}}fsub_constant_sel_constants_v4f32:
; GCN:     s_mov_b32 [[T0:s[0-9]+]], 0x41500000
; GCN:     s_cselect_b32 s[[SEL0:[0-9]+]], [[T0]], 0x40c00000
; GCN:     s_cselect_b32 s[[SEL1:[0-9]+]], 0x41100000, 4.0
; GCN:     s_cselect_b32 s[[SEL2:[0-9]+]], 0x40a00000, 2.0
; GCN:     s_cselect_b32 s[[SEL3:[0-9]+]], 1.0, 0
; GCN:     v_mov_b32_e32 v[[V0:[0-9]+]], s[[SEL3]]
; GCN:     v_mov_b32_e32 v[[V1:[0-9]+]], s[[SEL2]]
; GCN:     v_mov_b32_e32 v[[V2:[0-9]+]], s[[SEL1]]
; GCN:     v_mov_b32_e32 v[[V3:[0-9]+]], s[[SEL0]]
; GCN:     global_store_dwordx4 v{{[0-9]+}}, v[[[V0]]:[[V3]]]
define amdgpu_kernel void @fsub_constant_sel_constants_v4f32(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, <4 x float> <float -2.0, float -3.0, float -4.0, float -5.0>, <4 x float> <float -1.0, float 0.0, float 1.0, float 2.0>
  %bo = fsub <4 x float> <float -1.0, float 2.0, float 5.0, float 8.0>, %sel
  store <4 x float> %bo, ptr addrspace(1) %p, align 32
  ret void
}

; GCN-LABEL: {{^}}fdiv_constant_sel_constants:
; GCN: v_cndmask_b32_e64 v{{[0-9]+}}, 4.0, -2.0,
define amdgpu_kernel void @fdiv_constant_sel_constants(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, float -4.0, float 2.0
  %bo = fdiv float 8.0, %sel
  store float %bo, ptr addrspace(1) %p, align 4
  ret void
}

; GCN-LABEL: {{^}}frem_constant_sel_constants:
; GCN: v_cndmask_b32_e64 v{{[0-9]+}}, 2.0, 1.0,
define amdgpu_kernel void @frem_constant_sel_constants(ptr addrspace(1) %p, i1 %cond) {
  %sel = select i1 %cond, float -4.0, float 3.0
  %bo = frem float 5.0, %sel
  store float %bo, ptr addrspace(1) %p, align 4
  ret void
}
