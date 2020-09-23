#ifdef ___LINKER_INFO
; File: "getlogin.c", produced by Gambit v4.9.3
(
409003
(C)
"getlogin"
(("getlogin"))
(
"char*"
"getlogin"
)
(
)
(
"getlogin"
"getlogin#"
"getlogin#0"
)
(
"main"
)
(
"display"
"newline"
)
 ()
)
#else
#define ___VERSION 409003
#define ___MODULE_NAME "getlogin"
#define ___LINKER_ID ___LNK_getlogin
#define ___MH_PROC ___H_getlogin
#define ___SCRIPT_LINE 0
#define ___SYMCOUNT 2
#define ___GLOCOUNT 6
#define ___SUPCOUNT 4
#define ___CNSCOUNT 1
#define ___SUBCOUNT 1
#define ___LBLCOUNT 11
#define ___MODDESCR ___REF_SUB(0)
#include "gambit.h"

___NEED_SYM(___S_char_2a_)
___NEED_SYM(___S_getlogin)

___NEED_GLO(___G_display)
___NEED_GLO(___G_getlogin)
___NEED_GLO(___G_getlogin_23_)
___NEED_GLO(___G_getlogin_23_0)
___NEED_GLO(___G_main)
___NEED_GLO(___G_newline)

___BEGIN_SYM
___DEF_SYM(0,___S_char_2a_,"char*")
___DEF_SYM(1,___S_getlogin,"getlogin")
___END_SYM

#define ___SYM_char_2a_ ___SYM(0,___S_char_2a_)
#define ___SYM_getlogin ___SYM(1,___S_getlogin)

___BEGIN_GLO
___DEF_GLO(0,"getlogin")
___DEF_GLO(1,"getlogin#")
___DEF_GLO(2,"getlogin#0")
___DEF_GLO(3,"main")
___DEF_GLO(4,"display")
___DEF_GLO(5,"newline")
___END_GLO

#define ___GLO_getlogin ___GLO(0,___G_getlogin)
#define ___PRM_getlogin ___PRM(0,___G_getlogin)
#define ___GLO_getlogin_23_ ___GLO(1,___G_getlogin_23_)
#define ___PRM_getlogin_23_ ___PRM(1,___G_getlogin_23_)
#define ___GLO_getlogin_23_0 ___GLO(2,___G_getlogin_23_0)
#define ___PRM_getlogin_23_0 ___PRM(2,___G_getlogin_23_0)
#define ___GLO_main ___GLO(3,___G_main)
#define ___PRM_main ___PRM(3,___G_main)
#define ___GLO_display ___GLO(4,___G_display)
#define ___PRM_display ___PRM(4,___G_display)
#define ___GLO_newline ___GLO(5,___G_newline)
#define ___PRM_newline ___PRM(5,___G_newline)

___BEGIN_CNS
 ___DEF_CNS(___REF_SYM(0,___S_char_2a_),___REF_NUL)
___END_CNS

___DEF_SUB_VEC(___X0,5UL)
               ___VEC1(___REF_SYM(1,___S_getlogin))
               ___VEC1(___REF_PRC(1))
               ___VEC1(___REF_FIX(1))
               ___VEC1(___REF_NUL)
               ___VEC1(___REF_FAL)
               ___VEC0

___BEGIN_SUB
 ___DEF_SUB(___X0)
___END_SUB



#define ___C_OBJ_0 ___CNS(0)

#undef ___MD_ALL
#define ___MD_ALL ___D_FP ___D_R0 ___D_R1 ___D_R4
#undef ___MR_ALL
#define ___MR_ALL ___R_FP ___R_R0 ___R_R1 ___R_R4
#undef ___MW_ALL
#define ___MW_ALL ___W_FP ___W_R0 ___W_R1 ___W_R4
___BEGIN_M_COD
___BEGIN_M_HLBL
___DEF_M_HLBL_INTRO
___DEF_M_HLBL(___L0_getlogin_23_)
___DEF_M_HLBL_INTRO
___DEF_M_HLBL(___L0_getlogin_23_0)
___DEF_M_HLBL(___L1_getlogin_23_0)
___DEF_M_HLBL_INTRO
___DEF_M_HLBL(___L0_main)
___DEF_M_HLBL(___L1_main)
___DEF_M_HLBL(___L2_main)
___DEF_M_HLBL(___L3_main)
___DEF_M_HLBL(___L4_main)
___END_M_HLBL

___BEGIN_M_SW

#undef ___PH_PROC
#define ___PH_PROC ___H_getlogin_23_
#undef ___PH_LBL0
#define ___PH_LBL0 1
#undef ___PD_ALL
#define ___PD_ALL ___D_R0 ___D_R1
#undef ___PR_ALL
#define ___PR_ALL ___R_R0 ___R_R1
#undef ___PW_ALL
#define ___PW_ALL ___W_R1
___BEGIN_P_COD
___BEGIN_P_HLBL
___DEF_P_HLBL_INTRO
___DEF_P_HLBL(___L0_getlogin_23_)
___END_P_HLBL
___BEGIN_P_SW
___DEF_SLBL(0,___L0_getlogin_23_)
   ___IF_NARGS_EQ(0,___NOTHING)
   ___WRONG_NARGS(0,0,0,0)
___DEF_GLBL(___L_getlogin_23_)
   ___SET_GLO(0,___G_getlogin,___PRC(3))
   ___SET_GLO(3,___G_main,___PRC(6))
   ___SET_R1(___VOID)
   ___JUMPPRM(___NOTHING,___R0)
___END_P_SW
___END_P_COD

#undef ___PH_PROC
#define ___PH_PROC ___H_getlogin_23_0
#undef ___PH_LBL0
#define ___PH_LBL0 3
#undef ___PD_ALL
#define ___PD_ALL ___D_FP ___D_R0
#undef ___PR_ALL
#define ___PR_ALL ___R_FP ___R_R0
#undef ___PW_ALL
#define ___PW_ALL ___W_FP ___W_R0
___BEGIN_P_COD
___BEGIN_P_HLBL
___DEF_P_HLBL_INTRO
___DEF_P_HLBL(___L0_getlogin_23_0)
___DEF_P_HLBL(___L1_getlogin_23_0)
___END_P_HLBL
___BEGIN_P_SW
___DEF_SLBL(0,___L0_getlogin_23_0)
   ___IF_NARGS_EQ(0,___NOTHING)
   ___WRONG_NARGS(0,0,0,0)
___DEF_GLBL(___L_getlogin_23_0)
   ___SET_STK(1,___R0)
   ___SET_R0(___LBL(1))
   ___ADJFP(4)
#define ___NARGS 0
#define ___result ___CFUN_CAST_AND_DEREF(char**,&___result_voidstar)
___BEGIN_CFUN(void* ___result_voidstar)
___BEGIN_CFUN_BODY
#undef ___AT_END
___CFUN_ASSIGN_POINTER(___result_voidstar,getlogin())
#ifndef ___AT_END
#define ___AT_END
#endif
___BEGIN_CFUN_POINTER_TO_SCMOBJ(___result_voidstar,___C_OBJ_0,___RELEASE_POINTER,___CFUN_RESULT)
___CFUN_SET_RESULT
___END_CFUN_POINTER_TO_SCMOBJ(___result_voidstar,___C_OBJ_0,___RELEASE_POINTER,___CFUN_RESULT)
___END_CFUN_BODY
___CFUN_ERROR
___END_CFUN
#undef ___result
#undef ___NARGS
   ___JUMPPRM(___NOTHING,___R0)
___DEF_SLBL(1,___L1_getlogin_23_0)
   ___ADJFP(-4)
   ___JUMPPRM(___NOTHING,___STK(1))
___END_P_SW
___END_P_COD

#undef ___PH_PROC
#define ___PH_PROC ___H_main
#undef ___PH_LBL0
#define ___PH_LBL0 6
#undef ___PD_ALL
#define ___PD_ALL ___D_FP ___D_R0 ___D_R1 ___D_R4
#undef ___PR_ALL
#define ___PR_ALL ___R_FP ___R_R0 ___R_R1 ___R_R4
#undef ___PW_ALL
#define ___PW_ALL ___W_FP ___W_R0 ___W_R1 ___W_R4
___BEGIN_P_COD
___BEGIN_P_HLBL
___DEF_P_HLBL_INTRO
___DEF_P_HLBL(___L0_main)
___DEF_P_HLBL(___L1_main)
___DEF_P_HLBL(___L2_main)
___DEF_P_HLBL(___L3_main)
___DEF_P_HLBL(___L4_main)
___END_P_HLBL
___BEGIN_P_SW
___DEF_SLBL(0,___L0_main)
   ___IF_NARGS_EQ(0,___SET_R1(___NUL))
   ___GET_REST(0,0,0,0)
___DEF_GLBL(___L_main)
   ___SET_STK(1,___R0)
   ___ADJFP(4)
   ___POLL(1)
___DEF_SLBL(1,___L1_main)
   ___SET_R0(___LBL(2))
   ___JUMPGLOSAFE(___SET_NARGS(0),0,___G_getlogin)
___DEF_SLBL(2,___L2_main)
   ___SET_R0(___LBL(3))
   ___JUMPGLOSAFE(___SET_NARGS(1),4,___G_display)
___DEF_SLBL(3,___L3_main)
   ___SET_R0(___STK(-3))
   ___POLL(4)
___DEF_SLBL(4,___L4_main)
   ___ADJFP(-4)
   ___JUMPGLOSAFE(___SET_NARGS(0),5,___G_newline)
___END_P_SW
___END_P_COD

___END_M_SW
___END_M_COD

___BEGIN_LBL
 ___DEF_LBL_INTRO(___H_getlogin_23_,"getlogin#",___REF_FAL,1,0)
,___DEF_LBL_PROC(___H_getlogin_23_,0,-1)
,___DEF_LBL_INTRO(___H_getlogin_23_0,"getlogin#0",___REF_FAL,2,0)
,___DEF_LBL_PROC(___H_getlogin_23_0,0,-1)
,___DEF_LBL_RET(___H_getlogin_23_0,___IFD(___RETN,1,0,0x1L))
,___DEF_LBL_INTRO(___H_main,0,___REF_FAL,5,0)
,___DEF_LBL_PROC(___H_main,1,-1)
,___DEF_LBL_RET(___H_main,___IFD(___RETI,4,0,0x3f1L))
,___DEF_LBL_RET(___H_main,___IFD(___RETN,1,0,0x1L))
,___DEF_LBL_RET(___H_main,___IFD(___RETN,1,0,0x1L))
,___DEF_LBL_RET(___H_main,___IFD(___RETI,4,4,0x3f0L))
___END_LBL

___BEGIN_MOD_PRM
___DEF_MOD_PRM(1,___G_getlogin_23_,1)
___DEF_MOD_PRM(2,___G_getlogin_23_0,3)
___END_MOD_PRM

___BEGIN_MOD_C_INIT
___END_MOD_C_INIT

___BEGIN_MOD_GLO
___DEF_MOD_GLO(1,___G_getlogin_23_,1)
___DEF_MOD_GLO(2,___G_getlogin_23_0,3)
___END_MOD_GLO

___BEGIN_MOD_SYM_KEY
___DEF_MOD_SYM(0,___S_char_2a_,"char*")
___DEF_MOD_SYM(1,___S_getlogin,"getlogin")
___END_MOD_SYM_KEY

#endif
