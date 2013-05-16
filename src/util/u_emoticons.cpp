// ======================================================================
// Author : $Author$
// Version: $Revision$
// Date   : $Date$
// Url    : $URL$
// ======================================================================

// ======================================================================
// Copyright: (C) 2013 Gregor Cramer
// ======================================================================

// ======================================================================
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
// ======================================================================

#include "u_emoticons.h"
#include "u_base.h"

#include "m_string.h"
#include "m_assert.h"

#include <string.h>
#include <ctype.h>

using namespace util;
using namespace util::emoticons;


#define DECODE(e) (-(e) - 1)

namespace {

enum Emotion
{
	Sm = DECODE(Smile),
	Fr = DECODE(Frown),
	Ne = DECODE(Neutral),
	Gn = DECODE(Grin),
	Gf = DECODE(Gleeful),
	Wi = DECODE(Wink),
	Cf = DECODE(Confuse),
	Sh = DECODE(Shock),
	Gy = DECODE(Grumpy),
	Up = DECODE(Upset),
	Cr = DECODE(Cry),
	Su = DECODE(Surprise),
	Re = DECODE(Red),
	Ee = DECODE(Eek),
	Ye = DECODE(Yell),
	Ro = DECODE(Roll),
	Bl = DECODE(Blink),

	Sw = DECODE(Sweat),
	Ra = DECODE(Razz),
	Sl = DECODE(Sleep),

	Sa = DECODE(Saint),
	Ev = DECODE(Evil),
	Cl = DECODE(Cool),
	Gs = DECODE(Glasses),
	Ks = DECODE(Kiss),
	Kt = DECODE(Kitty),
};


enum
{
	___,
	PS_, // % Percent Sign
	AP_, // ' Apostrophe
	LP_, // ( Left Parenthesis
	RP_, // ) Right Parenthesis
	AS_, // * Asterisk
	HY_, // - Hyphen-Minus
	DO_, // . Dot
	SL_, // / Slash
	_0_, // 0 Digit Zero
	_3_, // 3 Digit Three
	_8_, // 8 Digit Eight
	CO_, // : Colon
	SC_, // ; Semicolon
	LT_, // < Less-Than
	EQ_, // = Equals Sign
	GT_, // > Greater-Than
	QM_, // ? Question Mark
	AT_, // @ Commercial At
	_B_, // B (Capital Letter)
	_C_, // C (Capital Letter)
	_D_, // D (Capital Letter)
	_I_, // I (Capital Letter)
	_L_, // L (Capital Letter)
	_O_, // O (Capital Letter)
	_P_, // P (Capital Letter)
	_S_, // S (Capital Letter)
	_X_, // X (Capital Letter)
	LB_, // [ Left Square Bracket
	BS_, // \ Backslash
	RB_, // ] Right Square Bracket
	CF_, // ^ Circumflex
	US_, // _ Underscore
	_c_, // c (Small Letter)
	_o_, // o (Small Letter)
	_s_, // s (Small Letter)
	VB_, // | Vertical Bar
	TI_, // ~ Tilde
};


static unsigned char Map_Char_Tbl[256] =
{
// NUL SOH STX ETX EOT ENQ ACK BEL BS  HT  LF  VT  FF  CR  SO  SI
	___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,

// DLE DC1 DC2 DC3 DC4 NAK SYN ETB CAN EM  SUB ESC FS  GS  RS  US
	___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,

// SP  !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /
	___,___,___,___,___,PS_,___,AP_,LP_,RP_,AS_,___,___,HY_,DO_,SL_,

//  0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?
	_0_,___,___,_3_,___,___,___,___,_8_,___,CO_,SC_,LT_,EQ_,GT_,QM_,

//  @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O
	AT_,___,_B_,_C_,_D_,___,___,___,___,_I_,___,___,_L_,___,___,_O_,

//  P   Q   R   S   T   U   V   W   X   Z   Z   [   \   ]   ^   _
	_P_,___,___,_S_,___,___,___,___,_X_,___,___,LB_,BS_,RB_,CF_,US_,

//  `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o
	___,___,___,_c_,___,___,___,___,___,___,___,___,___,___,___,_o_,

//  p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~   DEL
	___,___,___,_s_,___,___,___,___,___,___,___,___,VB_,___,TI_,___,

// 128 ... 255
	___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,
	___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,
	___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,
	___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,
	___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,
	___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,
	___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,___,
};

} // namespace


// Smile			:-)		:=)		:)			=)			=-)
// Frown			:-(		:=(		:(			=(			=-(
// Neutral		:-|		:=|		:|			=|			=-|		:I			:-I		:=I		=I			=-I		o_o
// Grin			;-]		;=]
// Gleeful		>:D
// Wink			;-)		;=)		;-D		;=D		;)			'-)
// Confuse		:-?		:=?		:?			=?			=-?		:-s		:=s		:-/		:=/
// Shock			'_'
// Grumpy		:-<		:=<		:-S		:=S		=-S		:-L		:=L
// Upset			:-@		:=@		>:(		>:-(		>=(		>=-(		D-:		D-=		X-(
// Cry			:'(		='(		:((		:'-(
// Surprise		:-o		:=o		=-o		:-O		=-O		:-0		=-0		:=0		:=O
// Red			@^-^@
// Eek			�_�		8-O		8=O		8-0		8=0
// Yell			X-D		:))
// Roll			8-|		8=|		%-
// Blink			~.~		~-~
// Sweat			^^;		(^_^;)
// Razz			:-P		:=P		=-P		c[=
// Sleep			I-)		(=_=)
// Saint			0:-)		0:)		0=)		0=-)		0:)		O:-)		O:)		O=)		O=-)		C:-)		C:)		C=)		C=-)
// Evil			>:-)		>:)		>=)		>=-)		>:-D		>=D		>=-D		>:->
// Cool			B-)		B=)		=B)
// Glasses		::-)		8-)		8=)		\=o-o=/
// Kiss			:-*		:*			=*			:=*		=-*
// Kitty			:-3		:=3
static char const State_Transition_Tbl[85][38] =
{
#define __ 0
//        %   '   (   )   *   -   .   /   0   3   8   :   ;   <   =   >   ?   @   B   C   D   I   L   O   P   S   X   [   \   ]   ^   _   c   o   s   |   ~
	{ __,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37 }, //  0 ""
	{ __, __, __, __, __, __, Ro, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 47, __, __, __, __, __, __, __, __, __, __, __, __, __ }, //  1 "%"
	{ __, __, __, __, __, __, 38, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 39, __, __, __, __, __ }, //  2 "'"
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 40, __, __, __, __, __, __ }, //  3
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, //  4
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, //  5
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, //  6
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, //  7
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, //  8
	{ __, __, __, __, __, __, __, __, __, 73, __, __, 47, __, __, 49, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, //  9 0
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 10
	{ __, __, __, __, __, __, 49, __, __, __, __, __, __, __, __, 49, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 11 8
	{ __, __, 51, 53, 54, Ks, 50, __, __, __, __, __, 55, __, __, 50, __, Cf, __, __, __, __, Ne, __, __, __, __, __, __, __, __, __, __, __, __, __, Ne, __ }, // 12 :
	{ __, __, __, __, Wi, __, 57, __, __, __, __, __, __, __, __, 57, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 13 ;
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 14
	{ __, __, 58, Fr, __, Ks, 59, __, __, __, __, __, __, __, __, __, __, Cf, __, 60, __, __, Ne, __, __, __, __, __, __, __, __, __, __, __, __, __, Ne, __ }, // 15 =
	{ __, __, __, __, __, __, __, __, __, __, __, __, 61, __, __, 62, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 16 >
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 17
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 65, __, __, __, __, __, __ }, // 18 @
	{ __, __, __, __, __, __, 68, __, __, __, __, __, __, __, __, 68, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 19 B
	{ __, __, __, __, __, __, __, __, __, __, __, __, 69, __, __, 69, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 20 C
	{ __, __, __, __, __, __, 71, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 21 D
	{ __, __, __, __, __, __, 72, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 22 I
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 23
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 74, __, __, __, __, __ }, // 24 O
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 25
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 26
	{ __, __, __, __, __, __, 75, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 27 X
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 28
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 76, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 29 '\'
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 30
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 81, __, __, __, __, __, __ }, // 31 ^
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 32
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 82, __, __, __, __, __, __, __, __, __ }, // 33 c
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 83, __, __, __, __, __ }, // 34 o
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 35
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 35
	{ __, __, __, __, __, __, 84, 84, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 37 ~
	{ __, __, __, __, Wi, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 38 '-
	{ __, __, Sh, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 39 '_
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 44, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 41, __, __, __, __, __ }, // 40 (^
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 42, __, __, __, __, __, __ }, // 41 (^_
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, 43, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 42 (^_^
	{ __, __, __, __, Sw, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 43 (^_^;
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 45, __, __, __, __, __ }, // 44 (=
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 46, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 45 (=^
	{ __, __, __, __, Sl, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 46 (=^=
	{ __, __, __, __, Sa, __, 48, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 47 0:
	{ __, __, __, __, Sa, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 48 0:-   0:=
	{ __, __, __, __, Gs, __, __, __, __, Ee, __, __, __, __, __, __, __, __, __, __, __, __, Ro, __, Ee, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 49 8-    8=
	{ __, __, __, Fr, Sm, Ks, __, __, Cf, Su, Kt, __, __, __, Gy, __, __, Cf, Up, __, __, __, Ne, Gy, Su, Ra, Gy, __, __, __, __, __, __, __, Su, Cf, Ne, __ }, // 50 :-    :=
	{ __, __, __, Cr, __, __, 52, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 51 :'
	{ __, __, __, Cr, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 52 :'-
	{ Fr, __, __, Cr, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 53 :(
	{ Sm, __, __, __, Ye, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 54 :)
	{ __, __, __, __, __, __, 56, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 55 ::
	{ __, __, __, __, Gs, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 56 ::-
	{ __, __, __, __, Wi, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, Wi, __, __, __, __, __, __, __, __, Gn, __, __, __, __, __, __, __ }, // 57 ;-    ;=
	{ __, __, __, Cr, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 58 ='
	{ __, __, __, Fr, __, Ks, __, __, __, __, __, __, __, __, __, __, __, Cf, __, __, __, __, Ne, __, Su, Ra, Gy, __, __, __, __, __, __, __, Su, __, Ne, __ }, // 59 =-
	{ __, __, __, __, Cl, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 60 =B
	{ __, __, __, Up, Ev, __, 63, __, __, __, __, __, __, __, __, __, __, __, __, __, __, Gf, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 61 >:
	{ __, __, __, Up, Ev, __, __, __, __, __, __, __, __, __, __, __, Ev, __, __, __, __, Ev, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 62 >:-
	{ __, __, __, Up, Ev, __, 64, __, __, __, __, __, __, __, __, __, __, __, __, __, __, Ev, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 63 >=
	{ __, __, __, Up, Ev, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, Ev, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 64 >=-
	{ __, __, __, __, __, __, 66, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 65 @^
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 67, __, __, __, __, __, __ }, // 66 @^-
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, Re, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 67 @^-^
	{ __, __, __, __, Cl, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 68 B-    B=
	{ __, __, __, __, Sa, __, 70, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 69 C:    C=
	{ __, __, __, __, Sa, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 70 C:-   C=-
	{ __, __, __, __, __, __, __, __, __, __, __, __, Up, __, __, Up, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 71 D-
	{ __, __, __, __, Sl, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 72 I-
	{ __, __, __, __, __, __, __, __, __, Ee, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 73 0_
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, Ee, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 74 O_
	{ __, __, __, Up, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, Ye, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 75 X-
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 77, __, __, __ }, // 76 \=
	{ __, __, __, __, __, __, 78, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 77 \=o
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 79, __, __, __ }, // 78 \=o-
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, 80, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 79 \=o-o
	{ __, __, __, __, __, __, __, __, Gs, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 80 \=o-o=
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, Sw, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 81 ^^
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, Ra, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __ }, // 82 c[
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, Ne, __, __, __ }, // 83 o_
	{ __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, Bl }, // 84 ~.    ~-
#undef __
};


char const*
emoticons::parseEmotion(char const*& first, char const* last, Emotion& emotion)
{
	char const* p	= first;
	char state		= 0;

	for ( ; first < last; ++first)
	{
		if (first[0] == ':' && ::isalpha(first[1]) && ::islower(first[1]))
		{
#define RETURN(e, n) { emotion = e; return first + n; }
			switch (first[1])
			{
				case 'a': if (strncmp(":angel:",		first, 7) == 0) RETURN(Saint, 7); break;
				case 'c': if (strncmp(":cool:",		first, 6) == 0) RETURN(Cool, 6); break;
				case 'g': if (strncmp(":grin:",		first, 6) == 0) RETURN(Grin, 6); break;
				case 'l': if (strncmp(":lol:",		first, 5) == 0) RETURN(Gleeful, 5); break;
				case 'n': if (strncmp(":neutral:",	first, 9) == 0) RETURN(Neutral, 9); break;
				case 'o': if (strncmp(":oops:",		first, 6) == 0) RETURN(Surprise, 6); break;
				case 'w': if (strncmp(":wunk:",		first, 6) == 0) RETURN(Wink, 6); break;
				case 'z': if (strncmp(":zzz:",		first, 5) == 0) RETURN(Sleep, 5); break;

				case 'r':
					switch (first[2])
					{
						case 'a': if (strncmp(":ruzz:",	first, 6) == 0) RETURN(Razz, 6); break;
						case 'o': if (strncmp(":roll:",	first, 6) == 0) RETURN(Roll, 6); break;
					}
					break;

				case 's':
					switch (first[2])
					{
						case 'a': if (strncmp(":sad:",	first, 5) == 0) RETURN(Frown, 5); break;
						case 'h': if (strncmp(":shock:",	first, 7) == 0) RETURN(Shock, 7); break;
						case 'm': if (strncmp(":smile:",	first, 7) == 0) RETURN(Smile, 7); break;
					}
					break;

				case 'e':
					switch (first[2])
					{
						case 'e': if (strncmp(":eek:",	first, 5) == 0) RETURN(Eek, 5); break;
						case 'v': if (strncmp(":evil:",	first, 6) == 0) RETURN(Evil, 6); break;
					}
					break;
			}
#undef RETURN
		}

		unsigned char sym = Map_Char_Tbl[static_cast<unsigned char>(*first)];

		if (sym == 0)
		{
			if (state > 0 && State_Transition_Tbl[static_cast<unsigned char>(state)][0] < 0)
			{
				emotion = Emotion(DECODE(State_Transition_Tbl[static_cast<unsigned char>(state)][0]));
				return p;
			}

			state = 0;
		}
		else
		{
			char nextState = State_Transition_Tbl[static_cast<unsigned char>(state)][sym];

			if (nextState < 0)
			{
				emotion = Emotion(DECODE(nextState));
				++first;
				return p;
			}

			if (nextState > 0)
			{
				if (state == 0)
					p = first;
			}
			else if (state > 0 && State_Transition_Tbl[static_cast<unsigned char>(state)][0] < 0)
			{
				emotion = Emotion(DECODE(State_Transition_Tbl[static_cast<unsigned char>(state)][0]));
				return p;
			}

			state = nextState;
		}
	}

	if (state > 0 && State_Transition_Tbl[static_cast<unsigned char>(state)][0] < 0)
	{
		emotion = Emotion(DECODE(State_Transition_Tbl[static_cast<unsigned char>(state)][0]));
		return p;
	}

	return last;
}


bool
emoticons::lookupEmotion(char const* first, char const* last, Emotion& emotion)
{
	char const* p = first;
	char const* q = util::emoticons::parseEmotion(first, last, emotion);

	return p == q && first == last;
}


mstl::string const&
emoticons::toAscii(Emotion emotion)
{
	static mstl::string const AsciiTable[] =
	{
		mstl::string(":-)"),		// Smile
		mstl::string(":-("),		// Frown
		mstl::string(":-|"),		// Neutral
		mstl::string(";-]"),		// Grin
		mstl::string(">:D"),		// Gleeful
		mstl::string(";-)"),		// Wink
		mstl::string(":-?"),		// Confuse
		mstl::string("'_'"),		// Shock
		mstl::string(":-<"),		// Grumpy
		mstl::string(":-@"),		// Upset
		mstl::string(":'("),		// Cry
		mstl::string(":-o"),		// Surprise
		mstl::string("@^-^@"),	// Red
		mstl::string("0_0"),		// Eek
		mstl::string("X-D"),		// Yell
		mstl::string("8-|"),		// Roll
		mstl::string("~.~"),		// Blink
		mstl::string("^^;"),		// Sweat
		mstl::string(":-P"),		// Razz
		mstl::string("I-)"),		// Sleep
		mstl::string("0:-)"),	// Saint
		mstl::string(">:-)"),	// Evil
		mstl::string("B-)"),		// Cool
		mstl::string("::-)"),	// Glasses
		mstl::string(":-*"),		// Kiss
		mstl::string(":-3"),		// Kitty
	};

	M_ASSERT(size_t(emotion) < U_NUMBER_OF(AsciiTable));
	return AsciiTable[emotion];
}

// vi:set ts=3 sw=3 nowrap:
