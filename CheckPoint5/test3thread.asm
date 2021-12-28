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
	.globl _Parking5
	.globl _Parking4
	.globl _Parking3
	.globl _Parking2
	.globl _Parking1
	.globl _SemaphoreCreate
	.globl _setDelay
	.globl _ThreadExit
	.globl _ThreadYield
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
	.globl _leave
	.globl _enter
	.globl _time
	.globl _numOfThreads
	.globl _spot
	.globl _empty
	.globl _i
	.globl _mutex
	.globl _delay
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
_delay	=	0x0000
_mutex	=	0x002e
_i	=	0x003a
_empty	=	0x003b
_spot	=	0x002b
_numOfThreads	=	0x0032
_time	=	0x002a
_enter	=	0x0020
_leave	=	0x0025
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
;	test3thread.c:33: void SemaphoreCreate(char *s, char n) {
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
;	test3thread.c:34: EA=0;
;	assignBit
	clr	_EA
;	test3thread.c:35: *s = n;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,_SemaphoreCreate_PARM_2
	lcall	__gptrput
;	test3thread.c:36: EA= 1;
;	assignBit
	setb	_EA
;	test3thread.c:37: return;
;	test3thread.c:38: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Parking1'
;------------------------------------------------------------
;	test3thread.c:39: void Parking1(void) {
;	-----------------------------------------
;	 function Parking1
;	-----------------------------------------
_Parking1:
;	test3thread.c:46: while (delay[0]!=0) {ThreadYield();}
00101$:
	mov	a,_delay
	jz	00103$
	lcall	_ThreadYield
	sjmp	00101$
00103$:
;	test3thread.c:47: for(i=0 ; i<2 ; i++){
	mov	_i,#0x00
00114$:
	mov	a,#0x100 - 0x02
	add	a,_i
	jc	00101$
;	test3thread.c:48: if(((spot[i]==1) && (delay[0] == 0)) ){
	mov	a,_i
	add	a,#_spot
	mov	r1,a
	mov	ar7,@r1
	cjne	r7,#0x01,00105$
	mov	a,_delay
	jnz	00105$
;	test3thread.c:49: leave[0] = now();
	lcall	_now
	mov	r6,dpl
	mov	r7,dph
	mov	_leave,r6
;	test3thread.c:50: spot[i] = '_';
	mov	a,_i
	add	a,#_spot
	mov	r0,a
	mov	@r0,#0x5f
;	test3thread.c:51: SemaphoreSignal(empty);
	INC _empty 
;	test3thread.c:52: ThreadExit();
	lcall	_ThreadExit
00105$:
;	test3thread.c:54: if((spot[i]=='_')){
	mov	a,_i
	add	a,#_spot
	mov	r1,a
	mov	ar7,@r1
	cjne	r7,#0x5f,00115$
;	test3thread.c:55: SemaphoreWait(empty);
		0$:
	SETB IE.7 
	CLR IE.7 
	MOV ACC,_empty 
	JZ 0$ 
	DEC _empty 
	SETB IE.7 
;	test3thread.c:56: enter[0] = now();
	lcall	_now
	mov	r6,dpl
	mov	_enter,r6
;	test3thread.c:57: spot[i] = 1;
	mov	a,_i
	add	a,#_spot
	mov	r0,a
	mov	@r0,#0x01
;	test3thread.c:58: setDelay(8);
	mov	dpl,#0x08
	lcall	_setDelay
;	test3thread.c:59: break;
	sjmp	00101$
00115$:
;	test3thread.c:47: for(i=0 ; i<2 ; i++){
	inc	_i
;	test3thread.c:66: }
	sjmp	00114$
;------------------------------------------------------------
;Allocation info for local variables in function 'Parking2'
;------------------------------------------------------------
;	test3thread.c:68: void Parking2(void){
;	-----------------------------------------
;	 function Parking2
;	-----------------------------------------
_Parking2:
;	test3thread.c:71: while (delay[1]!=0) {ThreadYield();}
00101$:
	mov	a,(_delay + 0x0001)
	jz	00103$
	lcall	_ThreadYield
	sjmp	00101$
00103$:
;	test3thread.c:72: for(i=0 ; i<2 ; i++){
	mov	_i,#0x00
00115$:
	mov	a,#0x100 - 0x02
	add	a,_i
	jc	00101$
;	test3thread.c:73: if(((spot[i]==2) && (delay[1] == 0)) ){
	mov	a,_i
	add	a,#_spot
	mov	r1,a
	mov	ar7,@r1
	cjne	r7,#0x02,00105$
	mov	a,(_delay + 0x0001)
	jnz	00105$
;	test3thread.c:74: leave[1] = now();
	lcall	_now
	mov	r6,dpl
	mov	r7,dph
	mov	(_leave + 0x0001),r6
;	test3thread.c:75: spot[i] = '_';
	mov	a,_i
	add	a,#_spot
	mov	r0,a
	mov	@r0,#0x5f
;	test3thread.c:76: SemaphoreSignal(empty);
	INC _empty 
;	test3thread.c:77: ThreadExit();
	lcall	_ThreadExit
00105$:
;	test3thread.c:79: if((spot[i]=='_')&&(enter[1]=='_')){
	mov	a,_i
	add	a,#_spot
	mov	r1,a
	mov	ar7,@r1
	cjne	r7,#0x5f,00116$
	mov	a,#0x5f
	cjne	a,(_enter + 0x0001),00116$
;	test3thread.c:80: SemaphoreWait(empty);
		1$:
	SETB IE.7 
	CLR IE.7 
	MOV ACC,_empty 
	JZ 1$ 
	DEC _empty 
	SETB IE.7 
;	test3thread.c:81: enter[1] = now();
	lcall	_now
	mov	r6,dpl
	mov	(_enter + 0x0001),r6
;	test3thread.c:82: spot[i] = 2;
	mov	a,_i
	add	a,#_spot
	mov	r0,a
	mov	@r0,#0x02
;	test3thread.c:83: setDelay(2);
	mov	dpl,#0x02
	lcall	_setDelay
;	test3thread.c:84: break;
	sjmp	00101$
00116$:
;	test3thread.c:72: for(i=0 ; i<2 ; i++){
	inc	_i
;	test3thread.c:89: }
	sjmp	00115$
;------------------------------------------------------------
;Allocation info for local variables in function 'Parking3'
;------------------------------------------------------------
;	test3thread.c:92: void Parking3(void){
;	-----------------------------------------
;	 function Parking3
;	-----------------------------------------
_Parking3:
;	test3thread.c:95: while (delay[2]!=0) {ThreadYield();}
00101$:
	mov	a,(_delay + 0x0002)
	jz	00103$
	lcall	_ThreadYield
	sjmp	00101$
00103$:
;	test3thread.c:96: for(i=0 ; i<2 ; i++){
	mov	_i,#0x00
00114$:
	mov	a,#0x100 - 0x02
	add	a,_i
	jc	00101$
;	test3thread.c:97: if(((spot[i]==3) && (delay[2] == 0)) ){
	mov	a,_i
	add	a,#_spot
	mov	r1,a
	mov	ar7,@r1
	cjne	r7,#0x03,00105$
	mov	a,(_delay + 0x0002)
	jnz	00105$
;	test3thread.c:98: leave[2] = now();
	lcall	_now
	mov	r6,dpl
	mov	r7,dph
	mov	(_leave + 0x0002),r6
;	test3thread.c:99: spot[i] = '_';
	mov	a,_i
	add	a,#_spot
	mov	r0,a
	mov	@r0,#0x5f
;	test3thread.c:100: SemaphoreSignal(empty);
	INC _empty 
;	test3thread.c:101: ThreadExit();
	lcall	_ThreadExit
00105$:
;	test3thread.c:103: if((spot[i]=='_')){
	mov	a,_i
	add	a,#_spot
	mov	r1,a
	mov	ar7,@r1
	cjne	r7,#0x5f,00115$
;	test3thread.c:104: SemaphoreWait(empty);
		2$:
	SETB IE.7 
	CLR IE.7 
	MOV ACC,_empty 
	JZ 2$ 
	DEC _empty 
	SETB IE.7 
;	test3thread.c:105: enter[2] = now();
	lcall	_now
	mov	r6,dpl
	mov	(_enter + 0x0002),r6
;	test3thread.c:106: spot[i] = 3;
	mov	a,_i
	add	a,#_spot
	mov	r0,a
	mov	@r0,#0x03
;	test3thread.c:107: setDelay(4);
	mov	dpl,#0x04
	lcall	_setDelay
;	test3thread.c:108: break;
	sjmp	00101$
00115$:
;	test3thread.c:96: for(i=0 ; i<2 ; i++){
	inc	_i
;	test3thread.c:113: }
	sjmp	00114$
;------------------------------------------------------------
;Allocation info for local variables in function 'Parking4'
;------------------------------------------------------------
;	test3thread.c:116: void Parking4(void){
;	-----------------------------------------
;	 function Parking4
;	-----------------------------------------
_Parking4:
;	test3thread.c:119: while (delay[3]!=0) {ThreadYield();}
00101$:
	mov	a,(_delay + 0x0003)
	jz	00103$
	lcall	_ThreadYield
	sjmp	00101$
00103$:
;	test3thread.c:120: for(i=0 ; i<2 ; i++){
	mov	_i,#0x00
00114$:
	mov	a,#0x100 - 0x02
	add	a,_i
	jc	00101$
;	test3thread.c:121: if(((spot[i]==4) && (delay[3] == 0)) ){
	mov	a,_i
	add	a,#_spot
	mov	r1,a
	mov	ar7,@r1
	cjne	r7,#0x04,00105$
	mov	a,(_delay + 0x0003)
	jnz	00105$
;	test3thread.c:122: leave[3] = now();
	lcall	_now
	mov	r6,dpl
	mov	r7,dph
	mov	(_leave + 0x0003),r6
;	test3thread.c:123: spot[i] = '_';
	mov	a,_i
	add	a,#_spot
	mov	r0,a
	mov	@r0,#0x5f
;	test3thread.c:124: SemaphoreSignal(empty);
	INC _empty 
;	test3thread.c:125: ThreadExit();
	lcall	_ThreadExit
00105$:
;	test3thread.c:127: if((spot[i]=='_')){
	mov	a,_i
	add	a,#_spot
	mov	r1,a
	mov	ar7,@r1
	cjne	r7,#0x5f,00115$
;	test3thread.c:128: SemaphoreWait(empty);
		3$:
	SETB IE.7 
	CLR IE.7 
	MOV ACC,_empty 
	JZ 3$ 
	DEC _empty 
	SETB IE.7 
;	test3thread.c:129: enter[3] = now();
	lcall	_now
	mov	r6,dpl
	mov	(_enter + 0x0003),r6
;	test3thread.c:130: spot[i] = 4;
	mov	a,_i
	add	a,#_spot
	mov	r0,a
	mov	@r0,#0x04
;	test3thread.c:131: setDelay(2);
	mov	dpl,#0x02
	lcall	_setDelay
;	test3thread.c:132: break;
	sjmp	00101$
00115$:
;	test3thread.c:120: for(i=0 ; i<2 ; i++){
	inc	_i
;	test3thread.c:137: }
	sjmp	00114$
;------------------------------------------------------------
;Allocation info for local variables in function 'Parking5'
;------------------------------------------------------------
;	test3thread.c:138: void Parking5(void){
;	-----------------------------------------
;	 function Parking5
;	-----------------------------------------
_Parking5:
;	test3thread.c:141: while (delay[4]!=0) {ThreadYield();}
00101$:
	mov	a,(_delay + 0x0004)
	jz	00103$
	lcall	_ThreadYield
	sjmp	00101$
00103$:
;	test3thread.c:142: for(i=0 ; i<2 ; i++){
	mov	_i,#0x00
00114$:
	mov	a,#0x100 - 0x02
	add	a,_i
	jc	00101$
;	test3thread.c:143: if(((spot[i]==5) && (delay[4] == 0)) ){
	mov	a,_i
	add	a,#_spot
	mov	r1,a
	mov	ar7,@r1
	cjne	r7,#0x05,00105$
	mov	a,(_delay + 0x0004)
	jnz	00105$
;	test3thread.c:144: leave[4] = now();
	lcall	_now
	mov	r6,dpl
	mov	r7,dph
	mov	(_leave + 0x0004),r6
;	test3thread.c:145: spot[i] = '_';
	mov	a,_i
	add	a,#_spot
	mov	r0,a
	mov	@r0,#0x5f
;	test3thread.c:146: SemaphoreSignal(empty);
	INC _empty 
;	test3thread.c:147: ThreadExit();
	lcall	_ThreadExit
00105$:
;	test3thread.c:149: if((spot[i]=='_')){
	mov	a,_i
	add	a,#_spot
	mov	r1,a
	mov	ar7,@r1
	cjne	r7,#0x5f,00115$
;	test3thread.c:150: SemaphoreWait(empty);
		4$:
	SETB IE.7 
	CLR IE.7 
	MOV ACC,_empty 
	JZ 4$ 
	DEC _empty 
	SETB IE.7 
;	test3thread.c:151: enter[4] = now();
	lcall	_now
	mov	r6,dpl
	mov	(_enter + 0x0004),r6
;	test3thread.c:152: spot[i] = 5;
	mov	a,_i
	add	a,#_spot
	mov	r0,a
	mov	@r0,#0x05
;	test3thread.c:153: setDelay(2);
	mov	dpl,#0x02
	lcall	_setDelay
;	test3thread.c:154: break;
	sjmp	00101$
00115$:
;	test3thread.c:142: for(i=0 ; i<2 ; i++){
	inc	_i
;	test3thread.c:159: }
	sjmp	00114$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	test3thread.c:172: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	test3thread.c:180: SemaphoreCreate(&empty, 2);   
	mov	_SemaphoreCreate_PARM_2,#0x02
	mov	dptr,#_empty
	mov	b,#0x40
	lcall	_SemaphoreCreate
;	test3thread.c:181: ThreadCreate(Parking1);
	mov	dptr,#_Parking1
	lcall	_ThreadCreate
;	test3thread.c:182: ThreadCreate(Parking2);
	mov	dptr,#_Parking2
	lcall	_ThreadCreate
;	test3thread.c:183: ThreadCreate(Parking3);
	mov	dptr,#_Parking3
	lcall	_ThreadCreate
;	test3thread.c:185: TMOD |= 0x20;
	mov	r6,_TMOD
	orl	ar6,#0x20
	mov	_TMOD,r6
;	test3thread.c:186: TH1 = (char)-6;
	mov	_TH1,#0xfa
;	test3thread.c:187: SCON = 0x50;
	mov	_SCON,#0x50
;	test3thread.c:188: TR1 = 1;
;	assignBit
	setb	_TR1
;	test3thread.c:189: TI = 1;
;	assignBit
	setb	_TI
;	test3thread.c:191: ThreadYield();  // start parking
	lcall	_ThreadYield
;	test3thread.c:193: while (numOfThreads >= 4) {ThreadYield();}
00101$:
	mov	a,#0x100 - 0x04
	add	a,_numOfThreads
	jnc	00103$
	lcall	_ThreadYield
	sjmp	00101$
00103$:
;	test3thread.c:194: ThreadCreate(Parking4);  // have available thread, create a new one for car 4
	mov	dptr,#_Parking4
	lcall	_ThreadCreate
;	test3thread.c:196: while (numOfThreads >= 4) {ThreadYield();}
00104$:
	mov	a,#0x100 - 0x04
	add	a,_numOfThreads
	jnc	00106$
	lcall	_ThreadYield
	sjmp	00104$
00106$:
;	test3thread.c:197: ThreadCreate(Parking5);  // have available thread, create a new one for car 5
	mov	dptr,#_Parking5
	lcall	_ThreadCreate
;	test3thread.c:199: while (numOfThreads != 1) {ThreadYield();}
00107$:
	mov	a,#0x01
	cjne	a,_numOfThreads,00138$
	sjmp	00109$
00138$:
	lcall	_ThreadYield
	sjmp	00107$
00109$:
;	test3thread.c:201: ThreadExit();  // all parking finished, exit this example
;	test3thread.c:202: }
	ljmp	_ThreadExit
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	test3thread.c:204: void _sdcc_gsinit_startup(void) {
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	test3thread.c:207: __endasm;
	ljmp	_Bootstrap
;	test3thread.c:208: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	test3thread.c:210: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	test3thread.c:211: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	test3thread.c:212: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	test3thread.c:213: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	test3thread.c:216: __endasm;
	ljmp	_myTimer0Handler
;	test3thread.c:217: }
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
