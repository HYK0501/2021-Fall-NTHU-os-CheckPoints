;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module preemtive
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _myTimer0Handler
	.globl _Bootstrap
	.globl _main
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
	.globl _LastProducerId
	.globl _TempSP
	.globl _Thread3SP
	.globl _Thread2SP
	.globl _Thread1SP
	.globl _Thread0SP
	.globl _bitmap
	.globl _currentThreadId
	.globl _createdThreadId
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
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
_createdThreadId	=	0x0030
_currentThreadId	=	0x0031
_bitmap	=	0x0033
_Thread0SP	=	0x0034
_Thread1SP	=	0x0035
_Thread2SP	=	0x0036
_Thread3SP	=	0x0037
_TempSP	=	0x0038
_LastProducerId	=	0x002c
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	preemtive.c:126: void Bootstrap(void) {
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	preemtive.c:139: TMOD = 0;  // timer 0 mode 0
	mov	_TMOD,#0x00
;	preemtive.c:140: IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
	mov	_IE,#0x82
;	preemtive.c:142: TR0 = 1; // set bit TR0 to start running timer 0
;	assignBit
	setb	_TR0
;	preemtive.c:143: bitmap = 0x00;
	clr	a
	mov	_bitmap,a
	mov	(_bitmap + 1),a
;	preemtive.c:144: currentThreadId = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_currentThreadId,dpl
;	preemtive.c:145: RESTORESTATE;
	mov	a,_currentThreadId
	mov	r7,a
	add	a,#0xff - 0x03
	jc	00106$
	mov	a,r7
	add	a,r7
	mov	dptr,#00114$
	jmp	@a+dptr
00114$:
	sjmp	00101$
	sjmp	00102$
	sjmp	00103$
	sjmp	00104$
00101$:
	MOV SP, 0x34 
	sjmp	00106$
00102$:
	MOV SP, 0x35 
	sjmp	00106$
00103$:
	MOV SP, 0x36 
	sjmp	00106$
00104$:
	MOV SP, 0x37 
00106$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemtive.c:146: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp                        Allocated to registers 
;------------------------------------------------------------
;	preemtive.c:155: ThreadId ThreadCreate(FunctionPtr fp) {
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	preemtive.c:200: EA = 0;
;	assignBit
	clr	_EA
;	preemtive.c:201: if((bitmap & 0xFF)==0xFF){
	mov	r6,_bitmap
	mov	a,(_bitmap + 1)
	mov	r7,#0x00
	cjne	r6,#0xff,00102$
	cjne	r7,#0x00,00102$
;	preemtive.c:202: return -1;
	mov	dpl,#0xff
	ret
00102$:
;	preemtive.c:204: TempSP = SP; 
	mov	_TempSP,_SP
	mov	(_TempSP + 1),#0x00
;	preemtive.c:205: if((bitmap & 0x01) == 0x00){
	mov	a,_bitmap
	jb	acc.0,00112$
;	preemtive.c:209: __endasm;
	MOV	0x34 , #0x3F
	ORL	0X33 ,#0X01
;	preemtive.c:210: createdThreadId = 0;
	mov	_createdThreadId,#0x00
;	preemtive.c:211: SP = Thread0SP;
	mov	_SP,_Thread0SP
	sjmp	00113$
00112$:
;	preemtive.c:213: else if((bitmap & 0x02) ==0x00){
	mov	a,_bitmap
	jb	acc.1,00109$
;	preemtive.c:217: __endasm;
	MOV	0x35 , #0x4F
	ORL	0X33 ,#0X02
;	preemtive.c:218: createdThreadId = 1;
	mov	_createdThreadId,#0x01
;	preemtive.c:219: SP = Thread1SP;
	mov	_SP,_Thread1SP
	sjmp	00113$
00109$:
;	preemtive.c:221: else if((bitmap & 0x04) ==0x00){
	mov	a,_bitmap
	jb	acc.2,00106$
;	preemtive.c:225: __endasm;
	MOV	0x36 , #0x5F
	ORL	0X33 ,#0X04
;	preemtive.c:226: createdThreadId = 2;
	mov	_createdThreadId,#0x02
;	preemtive.c:227: SP = Thread2SP;
	mov	_SP,_Thread2SP
	sjmp	00113$
00106$:
;	preemtive.c:229: else if((bitmap & 0x08) ==0x00){
	mov	a,_bitmap
	jb	acc.3,00113$
;	preemtive.c:233: __endasm;
	MOV	0x37 , #0x6F
	ORL	0X33 ,#0X08
;	preemtive.c:234: createdThreadId = 3;
	mov	_createdThreadId,#0x03
;	preemtive.c:235: SP = Thread3SP ;
	mov	_SP,_Thread3SP
00113$:
;	preemtive.c:245: __endasm;
	PUSH	DPL
	PUSH	DPH
	MOV	A , 0X00
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
;	preemtive.c:246: switch(createdThreadId ){
	mov	a,_createdThreadId
	mov	r7,a
	add	a,#0xff - 0x03
	jc	00119$
	mov	a,r7
	add	a,r7
;	preemtive.c:247: case 0:
	mov	dptr,#00153$
	jmp	@a+dptr
00153$:
	sjmp	00114$
	sjmp	00115$
	sjmp	00116$
	sjmp	00117$
00114$:
;	preemtive.c:251: __endasm;
	MOV	PSW ,#0X00
	PUSH	PSW
;	preemtive.c:252: Thread0SP=SP; 	
	mov	_Thread0SP,_SP
	mov	(_Thread0SP + 1),#0x00
;	preemtive.c:253: break;
;	preemtive.c:254: case 1:
	sjmp	00119$
00115$:
;	preemtive.c:258: __endasm;
	MOV	PSW ,#0X08
	PUSH	PSW
;	preemtive.c:259: Thread1SP=SP; 	
	mov	_Thread1SP,_SP
	mov	(_Thread1SP + 1),#0x00
;	preemtive.c:260: break;
;	preemtive.c:261: case 2:
	sjmp	00119$
00116$:
;	preemtive.c:265: __endasm;
	MOV	PSW ,#0X10
	PUSH	PSW
;	preemtive.c:266: Thread2SP=SP; 	
	mov	_Thread2SP,_SP
	mov	(_Thread2SP + 1),#0x00
;	preemtive.c:267: break;
;	preemtive.c:268: case 3:
	sjmp	00119$
00117$:
;	preemtive.c:272: __endasm;
	MOV	PSW ,#0X18
	PUSH	PSW
;	preemtive.c:273: Thread3SP=SP;
	mov	_Thread3SP,_SP
	mov	(_Thread3SP + 1),#0x00
;	preemtive.c:277: }
00119$:
;	preemtive.c:278: SP = TempSP;
	mov	_SP,_TempSP
;	preemtive.c:279: EA=1;
;	assignBit
	setb	_EA
;	preemtive.c:280: return createdThreadId;
	mov	dpl,_createdThreadId
;	preemtive.c:282: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'myTimer0Handler'
;------------------------------------------------------------
;	preemtive.c:292: void myTimer0Handler(void){
;	-----------------------------------------
;	 function myTimer0Handler
;	-----------------------------------------
_myTimer0Handler:
;	preemtive.c:293: EA = 0;
;	assignBit
	clr	_EA
;	preemtive.c:294: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	a,_currentThreadId
	mov	r7,a
	add	a,#0xff - 0x03
	jc	00106$
	mov	a,r7
	add	a,r7
	mov	dptr,#00154$
	jmp	@a+dptr
00154$:
	sjmp	00101$
	sjmp	00102$
	sjmp	00103$
	sjmp	00104$
00101$:
	MOV 0x34, SP 
	sjmp	00106$
00102$:
	MOV 0x35, SP 
	sjmp	00106$
00103$:
	MOV 0x36, SP 
	sjmp	00106$
00104$:
	MOV 0x37, SP 
00106$:
;	preemtive.c:295: if(currentThreadId==0 && LastProducerId==1){
	mov	a,_currentThreadId
	jnz	00114$
	mov	a,#0x01
	cjne	a,_LastProducerId,00156$
	dec	a
	cjne	a,(_LastProducerId + 1),00156$
	sjmp	00157$
00156$:
	sjmp	00114$
00157$:
;	preemtive.c:296: currentThreadId = 2;
	mov	_currentThreadId,#0x02
	sjmp	00115$
00114$:
;	preemtive.c:298: else if(currentThreadId==0 && LastProducerId==2){
	mov	a,_currentThreadId
	jnz	00110$
	mov	a,#0x02
	cjne	a,_LastProducerId,00159$
	clr	a
	cjne	a,(_LastProducerId + 1),00159$
	sjmp	00160$
00159$:
	sjmp	00110$
00160$:
;	preemtive.c:299: currentThreadId = 1;
	mov	_currentThreadId,#0x01
	sjmp	00115$
00110$:
;	preemtive.c:301: else if(currentThreadId!=0){
	mov	a,_currentThreadId
	jz	00115$
;	preemtive.c:302: LastProducerId = currentThreadId;
	mov	_LastProducerId,_currentThreadId
	mov	(_LastProducerId + 1),#0x00
;	preemtive.c:303: currentThreadId = 0;
	mov	_currentThreadId,#0x00
00115$:
;	preemtive.c:305: RESTORESTATE;
	mov	a,_currentThreadId
	mov	r7,a
	add	a,#0xff - 0x03
	jc	00122$
	mov	a,r7
	add	a,r7
	mov	dptr,#00163$
	jmp	@a+dptr
00163$:
	sjmp	00117$
	sjmp	00118$
	sjmp	00119$
	sjmp	00120$
00117$:
	MOV SP, 0x34 
	sjmp	00122$
00118$:
	MOV SP, 0x35 
	sjmp	00122$
00119$:
	MOV SP, 0x36 
	sjmp	00122$
00120$:
	MOV SP, 0x37 
00122$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemtive.c:306: EA = 1;//after restore psw set ea=1
;	assignBit
	setb	_EA
;	preemtive.c:309: __endasm;       
	RETI
;	preemtive.c:310: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	preemtive.c:311: void ThreadYield(void) {
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	preemtive.c:312: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	a,_currentThreadId
	mov	r7,a
	add	a,#0xff - 0x03
	jc	00128$
	mov	a,r7
	add	a,r7
	mov	dptr,#00172$
	jmp	@a+dptr
00172$:
	sjmp	00101$
	sjmp	00102$
	sjmp	00103$
	sjmp	00104$
00101$:
	MOV 0x34, SP 
	sjmp	00128$
00102$:
	MOV 0x35, SP 
	sjmp	00128$
00103$:
	MOV 0x36, SP 
	sjmp	00128$
00104$:
	MOV 0x37, SP 
;	preemtive.c:313: do {
00128$:
;	preemtive.c:323: switch (currentThreadId) {
	mov	a,_currentThreadId
	mov	r7,a
	add	a,#0xff - 0x03
	jc	00112$
	mov	a,r7
	add	a,r7
;	preemtive.c:324: case 0:
	mov	dptr,#00174$
	jmp	@a+dptr
00174$:
	sjmp	00107$
	sjmp	00108$
	sjmp	00109$
	sjmp	00110$
00107$:
;	preemtive.c:325: currentThreadId = 1;
	mov	_currentThreadId,#0x01
;	preemtive.c:326: break;
;	preemtive.c:327: case 1:
	sjmp	00112$
00108$:
;	preemtive.c:328: currentThreadId = 2;
	mov	_currentThreadId,#0x02
;	preemtive.c:329: break;
;	preemtive.c:330: case 2:
	sjmp	00112$
00109$:
;	preemtive.c:331: currentThreadId = 3;
	mov	_currentThreadId,#0x03
;	preemtive.c:332: break;
;	preemtive.c:333: case 3:
	sjmp	00112$
00110$:
;	preemtive.c:334: currentThreadId = 0;
	mov	_currentThreadId,#0x00
;	preemtive.c:338: }
00112$:
;	preemtive.c:339: if( (currentThreadId==0) &&  ((bitmap & 0x01)==0x01) ){
	mov	a,_currentThreadId
	jnz	00125$
	mov	a,#0x01
	anl	a,_bitmap
	mov	r6,a
	mov	a,(_bitmap + 1)
	mov	r7,#0x00
	cjne	r6,#0x01,00176$
	cjne	r7,#0x00,00176$
	sjmp	00130$
00176$:
;	preemtive.c:340: break;
00125$:
;	preemtive.c:342: else if((currentThreadId==1) &&  ((bitmap & 0x02)==0x02)){
	mov	a,#0x01
	cjne	a,_currentThreadId,00121$
	mov	a,#0x02
	anl	a,_bitmap
	mov	r6,a
	mov	a,(_bitmap + 1)
	mov	r7,#0x00
	cjne	r6,#0x02,00179$
	cjne	r7,#0x00,00179$
	sjmp	00130$
00179$:
;	preemtive.c:343: break;
00121$:
;	preemtive.c:345: else if((currentThreadId==2) &&  ((bitmap & 0x04)==0x04)){
	mov	a,#0x02
	cjne	a,_currentThreadId,00117$
	mov	a,#0x04
	anl	a,_bitmap
	mov	r6,a
	mov	a,(_bitmap + 1)
	mov	r7,#0x00
	cjne	r6,#0x04,00182$
	cjne	r7,#0x00,00182$
	sjmp	00130$
00182$:
;	preemtive.c:346: break;
00117$:
;	preemtive.c:348: else if( (currentThreadId==3) &&  ((bitmap & 0x08)==0x08) ){
	mov	a,#0x03
	cjne	a,_currentThreadId,00183$
	sjmp	00184$
00183$:
	ljmp	00128$
00184$:
	mov	a,#0x08
	anl	a,_bitmap
	mov	r6,a
	mov	a,(_bitmap + 1)
	mov	r7,#0x00
	cjne	r6,#0x08,00185$
	cjne	r7,#0x00,00185$
	sjmp	00186$
00185$:
	ljmp	00128$
00186$:
;	preemtive.c:352: } while (1);
00130$:
;	preemtive.c:353: RESTORESTATE;
	mov	a,_currentThreadId
	mov	r7,a
	add	a,#0xff - 0x03
	jc	00136$
	mov	a,r7
	add	a,r7
	mov	dptr,#00188$
	jmp	@a+dptr
00188$:
	sjmp	00131$
	sjmp	00132$
	sjmp	00133$
	sjmp	00134$
00131$:
	MOV SP, 0x34 
	sjmp	00136$
00132$:
	MOV SP, 0x35 
	sjmp	00136$
00133$:
	MOV SP, 0x36 
	sjmp	00136$
00134$:
	MOV SP, 0x37 
00136$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemtive.c:354: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	preemtive.c:362: void ThreadExit(void) {
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	preemtive.c:369: RESTORESTATE;
	mov	a,_currentThreadId
	mov	r7,a
	add	a,#0xff - 0x03
	jc	00106$
	mov	a,r7
	add	a,r7
	mov	dptr,#00114$
	jmp	@a+dptr
00114$:
	sjmp	00101$
	sjmp	00102$
	sjmp	00103$
	sjmp	00104$
00101$:
	MOV SP, 0x34 
	sjmp	00106$
00102$:
	MOV SP, 0x35 
	sjmp	00106$
00103$:
	MOV SP, 0x36 
	sjmp	00106$
00104$:
	MOV SP, 0x37 
00106$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemtive.c:370: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
