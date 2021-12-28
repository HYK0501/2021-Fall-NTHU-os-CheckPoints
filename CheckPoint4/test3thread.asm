;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module test3thread
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SemaphoreCreate_PARM_2
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _Consumer
	.globl _Producer2
	.globl _Producer1
	.globl _SemaphoreCreate
	.globl _ThreadCreate
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _sharedBuffer
	.globl _nextNum
	.globl _nextChar
	.globl _comsume
	.globl _produce
	.globl _empty
	.globl _full
	.globl _mutex
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_mutex	=	0x002e
_full	=	0x003a
_empty	=	0x003b
_produce	=	0x003f
_comsume	=	0x002f
_nextChar	=	0x0032
_nextNum	=	0x0029
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
_SemaphoreCreate_PARM_2:
	.ds 1
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.org 0x003C
_sharedBuffer::
	.ds 3
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	test3thread.c:18: __data __at(0x3C) char sharedBuffer[3] = {' ', ' ', ' '};
	mov	_sharedBuffer,#0x20
	mov	(_sharedBuffer + 0x0001),#0x20
	mov	(_sharedBuffer + 0x0002),#0x20
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'SemaphoreCreate'
;------------------------------------------------------------
;n                         Allocated with name '_SemaphoreCreate_PARM_2'
;s                         Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	test3thread.c:32: void SemaphoreCreate(char *s, char n) {
;	-----------------------------------------
;	 function SemaphoreCreate
;	-----------------------------------------
_SemaphoreCreate:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	test3thread.c:33: EA=0;
;	assignBit
	clr	_EA
;	test3thread.c:34: *s = n;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,_SemaphoreCreate_PARM_2
	lcall	__gptrput
;	test3thread.c:35: EA= 1;
;	assignBit
	setb	_EA
;	test3thread.c:36: return;
;	test3thread.c:37: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer1'
;------------------------------------------------------------
;	test3thread.c:38: void Producer1(void) {
;	-----------------------------------------
;	 function Producer1
;	-----------------------------------------
_Producer1:
;	test3thread.c:46: __endasm;
	MOV	0X32,#0X40
;	test3thread.c:47: while(1){
00106$:
;	test3thread.c:48: SemaphoreWait(empty);//number 0f empty block
		0$:
	SETB IE.7 
	CLR IE.7 
	MOV ACC,_empty 
	JZ 0$ 
	DEC _empty 
	SETB IE.7 
;	test3thread.c:49: SemaphoreWait(mutex);
		1$:
	SETB IE.7 
	CLR IE.7 
	MOV ACC,_mutex 
	JZ 1$ 
	DEC _mutex 
	SETB IE.7 
;	test3thread.c:50: nextChar +=1;
	mov	a,_nextChar
	inc	a
	mov	_nextChar,a
;	test3thread.c:51: sharedBuffer[produce] = nextChar;
	mov	a,_produce
	add	a,#_sharedBuffer
	mov	r0,a
	mov	@r0,_nextChar
;	test3thread.c:52: produce+=1;
	mov	a,_produce
	mov	r7,a
	inc	a
	mov	_produce,a
;	test3thread.c:53: if(nextChar >  'Z'){
	mov	a,_nextChar
	add	a,#0xff - 0x5a
	jnc	00102$
;	test3thread.c:54: nextChar = 'A';
	mov	_nextChar,#0x41
00102$:
;	test3thread.c:56: if(produce==3){
	mov	a,#0x03
	cjne	a,_produce,00104$
;	test3thread.c:57: produce = 0 ;
	mov	_produce,#0x00
00104$:
;	test3thread.c:59: SemaphoreSignal(mutex);
	INC _mutex 
;	test3thread.c:60: SemaphoreSignal(full);
	INC _full 
;	test3thread.c:63: }
	sjmp	00106$
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer2'
;------------------------------------------------------------
;	test3thread.c:65: void Producer2(void){
;	-----------------------------------------
;	 function Producer2
;	-----------------------------------------
_Producer2:
;	test3thread.c:66: nextNum = '0';
	mov	_nextNum,#0x30
;	test3thread.c:67: while(1){
00106$:
;	test3thread.c:68: SemaphoreWait(empty);//number 0f empty block
		2$:
	SETB IE.7 
	CLR IE.7 
	MOV ACC,_empty 
	JZ 2$ 
	DEC _empty 
	SETB IE.7 
;	test3thread.c:69: SemaphoreWait(mutex);
		3$:
	SETB IE.7 
	CLR IE.7 
	MOV ACC,_mutex 
	JZ 3$ 
	DEC _mutex 
	SETB IE.7 
;	test3thread.c:70: sharedBuffer[produce] = nextNum;
	mov	a,_produce
	add	a,#_sharedBuffer
	mov	r0,a
	mov	@r0,_nextNum
;	test3thread.c:71: produce+=1;
	mov	a,_produce
	inc	a
	mov	_produce,a
;	test3thread.c:72: nextNum +=1;
	mov	a,_nextNum
	mov	r7,a
	inc	a
	mov	_nextNum,a
;	test3thread.c:73: if(nextNum >  '9'){
	mov	a,_nextNum
	add	a,#0xff - 0x39
	jnc	00102$
;	test3thread.c:74: nextNum = '0';
	mov	_nextNum,#0x30
00102$:
;	test3thread.c:76: if(produce==3){
	mov	a,#0x03
	cjne	a,_produce,00104$
;	test3thread.c:77: produce = 0 ;
	mov	_produce,#0x00
00104$:
;	test3thread.c:79: SemaphoreSignal(mutex);
	INC _mutex 
;	test3thread.c:80: SemaphoreSignal(full);
	INC _full 
;	test3thread.c:82: }
	sjmp	00106$
;------------------------------------------------------------
;Allocation info for local variables in function 'Consumer'
;------------------------------------------------------------
;	test3thread.c:88: void Consumer(void) {
;	-----------------------------------------
;	 function Consumer
;	-----------------------------------------
_Consumer:
;	test3thread.c:92: __endasm;
	ORL	0X89 , #0X20
;	test3thread.c:93: TH1 = (char)-6;
	mov	_TH1,#0xfa
;	test3thread.c:94: SCON = 0x50;
	mov	_SCON,#0x50
;	test3thread.c:95: TR1 = 1;
;	assignBit
	setb	_TR1
;	test3thread.c:96: TI = 1;
;	assignBit
	setb	_TI
;	test3thread.c:97: while (1) {
00107$:
;	test3thread.c:103: SemaphoreWait(full);
		4$:
	SETB IE.7 
	CLR IE.7 
	MOV ACC,_full 
	JZ 4$ 
	DEC _full 
	SETB IE.7 
;	test3thread.c:104: SemaphoreWait(mutex);
		5$:
	SETB IE.7 
	CLR IE.7 
	MOV ACC,_mutex 
	JZ 5$ 
	DEC _mutex 
	SETB IE.7 
;	test3thread.c:105: while(!TI){}              	
00101$:
	jnb	_TI,00101$
;	test3thread.c:106: SBUF = sharedBuffer[comsume];
	mov	a,_comsume
	add	a,#_sharedBuffer
	mov	r1,a
	mov	_SBUF,@r1
;	test3thread.c:107: comsume +=1;
	mov	a,_comsume
	mov	r7,a
	inc	a
	mov	_comsume,a
;	test3thread.c:108: if(comsume==3)comsume = 0;
	mov	a,#0x03
	cjne	a,_comsume,00105$
	mov	_comsume,#0x00
00105$:
;	test3thread.c:109: TI = 0 ;
;	assignBit
	clr	_TI
;	test3thread.c:110: SemaphoreSignal(mutex);
	INC _mutex 
;	test3thread.c:111: SemaphoreSignal(empty);
	INC _empty 
;	test3thread.c:113: }
	sjmp	00107$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	test3thread.c:120: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	test3thread.c:128: SemaphoreCreate(&mutex, 1);
	mov	_SemaphoreCreate_PARM_2,#0x01
	mov	dptr,#_mutex
	mov	b,#0x40
	lcall	_SemaphoreCreate
;	test3thread.c:129: SemaphoreCreate(&full, 0);
	mov	_SemaphoreCreate_PARM_2,#0x00
	mov	dptr,#_full
	mov	b,#0x40
	lcall	_SemaphoreCreate
;	test3thread.c:130: SemaphoreCreate(&empty, 3);
	mov	_SemaphoreCreate_PARM_2,#0x03
	mov	dptr,#_empty
	mov	b,#0x40
	lcall	_SemaphoreCreate
;	test3thread.c:131: produce = 0;
	mov	_produce,#0x00
;	test3thread.c:132: comsume = 0;
	mov	_comsume,#0x00
;	test3thread.c:133: ThreadCreate(Producer1);
	mov	dptr,#_Producer1
	lcall	_ThreadCreate
;	test3thread.c:134: ThreadCreate(Producer2);
	mov	dptr,#_Producer2
	lcall	_ThreadCreate
;	test3thread.c:138: __endasm;
	MOV	SP,0x34
	MOV	0x2c,#0x01;
;	test3thread.c:139: Consumer();         
;	test3thread.c:140: }
	ljmp	_Consumer
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	test3thread.c:142: void _sdcc_gsinit_startup(void) {
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	test3thread.c:145: __endasm;
	ljmp	_Bootstrap
;	test3thread.c:146: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	test3thread.c:148: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	test3thread.c:149: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	test3thread.c:150: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	test3thread.c:151: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	test3thread.c:154: __endasm;
	ljmp	_myTimer0Handler
;	test3thread.c:155: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
