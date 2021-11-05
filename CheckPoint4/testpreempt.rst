                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module testpreempt
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _SemaphoreCreate_PARM_2
                                     12 	.globl _timer0_ISR
                                     13 	.globl __mcs51_genXRAMCLEAR
                                     14 	.globl __mcs51_genXINIT
                                     15 	.globl __mcs51_genRAMCLEAR
                                     16 	.globl __sdcc_gsinit_startup
                                     17 	.globl _main
                                     18 	.globl _Consumer
                                     19 	.globl _Producer2
                                     20 	.globl _Producer1
                                     21 	.globl _SemaphoreCreate
                                     22 	.globl _ThreadCreate
                                     23 	.globl _CY
                                     24 	.globl _AC
                                     25 	.globl _F0
                                     26 	.globl _RS1
                                     27 	.globl _RS0
                                     28 	.globl _OV
                                     29 	.globl _F1
                                     30 	.globl _P
                                     31 	.globl _PS
                                     32 	.globl _PT1
                                     33 	.globl _PX1
                                     34 	.globl _PT0
                                     35 	.globl _PX0
                                     36 	.globl _RD
                                     37 	.globl _WR
                                     38 	.globl _T1
                                     39 	.globl _T0
                                     40 	.globl _INT1
                                     41 	.globl _INT0
                                     42 	.globl _TXD
                                     43 	.globl _RXD
                                     44 	.globl _P3_7
                                     45 	.globl _P3_6
                                     46 	.globl _P3_5
                                     47 	.globl _P3_4
                                     48 	.globl _P3_3
                                     49 	.globl _P3_2
                                     50 	.globl _P3_1
                                     51 	.globl _P3_0
                                     52 	.globl _EA
                                     53 	.globl _ES
                                     54 	.globl _ET1
                                     55 	.globl _EX1
                                     56 	.globl _ET0
                                     57 	.globl _EX0
                                     58 	.globl _P2_7
                                     59 	.globl _P2_6
                                     60 	.globl _P2_5
                                     61 	.globl _P2_4
                                     62 	.globl _P2_3
                                     63 	.globl _P2_2
                                     64 	.globl _P2_1
                                     65 	.globl _P2_0
                                     66 	.globl _SM0
                                     67 	.globl _SM1
                                     68 	.globl _SM2
                                     69 	.globl _REN
                                     70 	.globl _TB8
                                     71 	.globl _RB8
                                     72 	.globl _TI
                                     73 	.globl _RI
                                     74 	.globl _P1_7
                                     75 	.globl _P1_6
                                     76 	.globl _P1_5
                                     77 	.globl _P1_4
                                     78 	.globl _P1_3
                                     79 	.globl _P1_2
                                     80 	.globl _P1_1
                                     81 	.globl _P1_0
                                     82 	.globl _TF1
                                     83 	.globl _TR1
                                     84 	.globl _TF0
                                     85 	.globl _TR0
                                     86 	.globl _IE1
                                     87 	.globl _IT1
                                     88 	.globl _IE0
                                     89 	.globl _IT0
                                     90 	.globl _P0_7
                                     91 	.globl _P0_6
                                     92 	.globl _P0_5
                                     93 	.globl _P0_4
                                     94 	.globl _P0_3
                                     95 	.globl _P0_2
                                     96 	.globl _P0_1
                                     97 	.globl _P0_0
                                     98 	.globl _B
                                     99 	.globl _ACC
                                    100 	.globl _PSW
                                    101 	.globl _IP
                                    102 	.globl _P3
                                    103 	.globl _IE
                                    104 	.globl _P2
                                    105 	.globl _SBUF
                                    106 	.globl _SCON
                                    107 	.globl _P1
                                    108 	.globl _TH1
                                    109 	.globl _TH0
                                    110 	.globl _TL1
                                    111 	.globl _TL0
                                    112 	.globl _TMOD
                                    113 	.globl _TCON
                                    114 	.globl _PCON
                                    115 	.globl _DPH
                                    116 	.globl _DPL
                                    117 	.globl _SP
                                    118 	.globl _P0
                                    119 	.globl _sharedBuffer
                                    120 	.globl _nextNum
                                    121 	.globl _nextChar
                                    122 	.globl _comsume
                                    123 	.globl _produce
                                    124 	.globl _empty
                                    125 	.globl _full
                                    126 	.globl _mutex
                                    127 ;--------------------------------------------------------
                                    128 ; special function registers
                                    129 ;--------------------------------------------------------
                                    130 	.area RSEG    (ABS,DATA)
      000000                        131 	.org 0x0000
                           000080   132 _P0	=	0x0080
                           000081   133 _SP	=	0x0081
                           000082   134 _DPL	=	0x0082
                           000083   135 _DPH	=	0x0083
                           000087   136 _PCON	=	0x0087
                           000088   137 _TCON	=	0x0088
                           000089   138 _TMOD	=	0x0089
                           00008A   139 _TL0	=	0x008a
                           00008B   140 _TL1	=	0x008b
                           00008C   141 _TH0	=	0x008c
                           00008D   142 _TH1	=	0x008d
                           000090   143 _P1	=	0x0090
                           000098   144 _SCON	=	0x0098
                           000099   145 _SBUF	=	0x0099
                           0000A0   146 _P2	=	0x00a0
                           0000A8   147 _IE	=	0x00a8
                           0000B0   148 _P3	=	0x00b0
                           0000B8   149 _IP	=	0x00b8
                           0000D0   150 _PSW	=	0x00d0
                           0000E0   151 _ACC	=	0x00e0
                           0000F0   152 _B	=	0x00f0
                                    153 ;--------------------------------------------------------
                                    154 ; special function bits
                                    155 ;--------------------------------------------------------
                                    156 	.area RSEG    (ABS,DATA)
      000000                        157 	.org 0x0000
                           000080   158 _P0_0	=	0x0080
                           000081   159 _P0_1	=	0x0081
                           000082   160 _P0_2	=	0x0082
                           000083   161 _P0_3	=	0x0083
                           000084   162 _P0_4	=	0x0084
                           000085   163 _P0_5	=	0x0085
                           000086   164 _P0_6	=	0x0086
                           000087   165 _P0_7	=	0x0087
                           000088   166 _IT0	=	0x0088
                           000089   167 _IE0	=	0x0089
                           00008A   168 _IT1	=	0x008a
                           00008B   169 _IE1	=	0x008b
                           00008C   170 _TR0	=	0x008c
                           00008D   171 _TF0	=	0x008d
                           00008E   172 _TR1	=	0x008e
                           00008F   173 _TF1	=	0x008f
                           000090   174 _P1_0	=	0x0090
                           000091   175 _P1_1	=	0x0091
                           000092   176 _P1_2	=	0x0092
                           000093   177 _P1_3	=	0x0093
                           000094   178 _P1_4	=	0x0094
                           000095   179 _P1_5	=	0x0095
                           000096   180 _P1_6	=	0x0096
                           000097   181 _P1_7	=	0x0097
                           000098   182 _RI	=	0x0098
                           000099   183 _TI	=	0x0099
                           00009A   184 _RB8	=	0x009a
                           00009B   185 _TB8	=	0x009b
                           00009C   186 _REN	=	0x009c
                           00009D   187 _SM2	=	0x009d
                           00009E   188 _SM1	=	0x009e
                           00009F   189 _SM0	=	0x009f
                           0000A0   190 _P2_0	=	0x00a0
                           0000A1   191 _P2_1	=	0x00a1
                           0000A2   192 _P2_2	=	0x00a2
                           0000A3   193 _P2_3	=	0x00a3
                           0000A4   194 _P2_4	=	0x00a4
                           0000A5   195 _P2_5	=	0x00a5
                           0000A6   196 _P2_6	=	0x00a6
                           0000A7   197 _P2_7	=	0x00a7
                           0000A8   198 _EX0	=	0x00a8
                           0000A9   199 _ET0	=	0x00a9
                           0000AA   200 _EX1	=	0x00aa
                           0000AB   201 _ET1	=	0x00ab
                           0000AC   202 _ES	=	0x00ac
                           0000AF   203 _EA	=	0x00af
                           0000B0   204 _P3_0	=	0x00b0
                           0000B1   205 _P3_1	=	0x00b1
                           0000B2   206 _P3_2	=	0x00b2
                           0000B3   207 _P3_3	=	0x00b3
                           0000B4   208 _P3_4	=	0x00b4
                           0000B5   209 _P3_5	=	0x00b5
                           0000B6   210 _P3_6	=	0x00b6
                           0000B7   211 _P3_7	=	0x00b7
                           0000B0   212 _RXD	=	0x00b0
                           0000B1   213 _TXD	=	0x00b1
                           0000B2   214 _INT0	=	0x00b2
                           0000B3   215 _INT1	=	0x00b3
                           0000B4   216 _T0	=	0x00b4
                           0000B5   217 _T1	=	0x00b5
                           0000B6   218 _WR	=	0x00b6
                           0000B7   219 _RD	=	0x00b7
                           0000B8   220 _PX0	=	0x00b8
                           0000B9   221 _PT0	=	0x00b9
                           0000BA   222 _PX1	=	0x00ba
                           0000BB   223 _PT1	=	0x00bb
                           0000BC   224 _PS	=	0x00bc
                           0000D0   225 _P	=	0x00d0
                           0000D1   226 _F1	=	0x00d1
                           0000D2   227 _OV	=	0x00d2
                           0000D3   228 _RS0	=	0x00d3
                           0000D4   229 _RS1	=	0x00d4
                           0000D5   230 _F0	=	0x00d5
                           0000D6   231 _AC	=	0x00d6
                           0000D7   232 _CY	=	0x00d7
                                    233 ;--------------------------------------------------------
                                    234 ; overlayable register banks
                                    235 ;--------------------------------------------------------
                                    236 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        237 	.ds 8
                                    238 ;--------------------------------------------------------
                                    239 ; internal ram data
                                    240 ;--------------------------------------------------------
                                    241 	.area DSEG    (DATA)
                           00002E   242 _mutex	=	0x002e
                           00003A   243 _full	=	0x003a
                           00003B   244 _empty	=	0x003b
                           00003F   245 _produce	=	0x003f
                           00002F   246 _comsume	=	0x002f
                           000032   247 _nextChar	=	0x0032
                           000029   248 _nextNum	=	0x0029
                                    249 ;--------------------------------------------------------
                                    250 ; overlayable items in internal ram 
                                    251 ;--------------------------------------------------------
                                    252 	.area	OSEG    (OVR,DATA)
      000008                        253 _SemaphoreCreate_PARM_2:
      000008                        254 	.ds 1
                                    255 ;--------------------------------------------------------
                                    256 ; Stack segment in internal ram 
                                    257 ;--------------------------------------------------------
                                    258 	.area	SSEG
      00003F                        259 __start__stack:
      00003F                        260 	.ds	1
                                    261 
                                    262 ;--------------------------------------------------------
                                    263 ; indirectly addressable internal ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area ISEG    (DATA)
                                    266 ;--------------------------------------------------------
                                    267 ; absolute internal ram data
                                    268 ;--------------------------------------------------------
                                    269 	.area IABS    (ABS,DATA)
      00003C                        270 	.org 0x003C
      00003C                        271 _sharedBuffer::
      00003C                        272 	.ds 3
                                    273 	.area IABS    (ABS,DATA)
                                    274 ;--------------------------------------------------------
                                    275 ; bit data
                                    276 ;--------------------------------------------------------
                                    277 	.area BSEG    (BIT)
                                    278 ;--------------------------------------------------------
                                    279 ; paged external ram data
                                    280 ;--------------------------------------------------------
                                    281 	.area PSEG    (PAG,XDATA)
                                    282 ;--------------------------------------------------------
                                    283 ; external ram data
                                    284 ;--------------------------------------------------------
                                    285 	.area XSEG    (XDATA)
                                    286 ;--------------------------------------------------------
                                    287 ; absolute external ram data
                                    288 ;--------------------------------------------------------
                                    289 	.area XABS    (ABS,XDATA)
                                    290 ;--------------------------------------------------------
                                    291 ; external initialized ram data
                                    292 ;--------------------------------------------------------
                                    293 	.area XISEG   (XDATA)
                                    294 	.area HOME    (CODE)
                                    295 	.area GSINIT0 (CODE)
                                    296 	.area GSINIT1 (CODE)
                                    297 	.area GSINIT2 (CODE)
                                    298 	.area GSINIT3 (CODE)
                                    299 	.area GSINIT4 (CODE)
                                    300 	.area GSINIT5 (CODE)
                                    301 	.area GSINIT  (CODE)
                                    302 	.area GSFINAL (CODE)
                                    303 	.area CSEG    (CODE)
                                    304 ;--------------------------------------------------------
                                    305 ; interrupt vector 
                                    306 ;--------------------------------------------------------
                                    307 	.area HOME    (CODE)
      000000                        308 __interrupt_vect:
      000000 02 01 45         [24]  309 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  310 	reti
      000004                        311 	.ds	7
      00000B 02 01 4C         [24]  312 	ljmp	_timer0_ISR
                                    313 ;--------------------------------------------------------
                                    314 ; global & static initialisations
                                    315 ;--------------------------------------------------------
                                    316 	.area HOME    (CODE)
                                    317 	.area GSINIT  (CODE)
                                    318 	.area GSFINAL (CODE)
                                    319 	.area GSINIT  (CODE)
                                    320 	.globl __sdcc_gsinit_startup
                                    321 	.globl __sdcc_program_startup
                                    322 	.globl __start__stack
                                    323 	.globl __mcs51_genXINIT
                                    324 	.globl __mcs51_genXRAMCLEAR
                                    325 	.globl __mcs51_genRAMCLEAR
                                    326 ;	testpreempt.c:18: __data __at(0x3C) char sharedBuffer[3] = {' ', ' ', ' '};
      000011 75 3C 20         [24]  327 	mov	_sharedBuffer,#0x20
      000014 75 3D 20         [24]  328 	mov	(_sharedBuffer + 0x0001),#0x20
      000017 75 3E 20         [24]  329 	mov	(_sharedBuffer + 0x0002),#0x20
                                    330 	.area GSFINAL (CODE)
      00001A 02 00 0E         [24]  331 	ljmp	__sdcc_program_startup
                                    332 ;--------------------------------------------------------
                                    333 ; Home
                                    334 ;--------------------------------------------------------
                                    335 	.area HOME    (CODE)
                                    336 	.area HOME    (CODE)
      00000E                        337 __sdcc_program_startup:
      00000E 02 01 06         [24]  338 	ljmp	_main
                                    339 ;	return from main will return to caller
                                    340 ;--------------------------------------------------------
                                    341 ; code
                                    342 ;--------------------------------------------------------
                                    343 	.area CSEG    (CODE)
                                    344 ;------------------------------------------------------------
                                    345 ;Allocation info for local variables in function 'SemaphoreCreate'
                                    346 ;------------------------------------------------------------
                                    347 ;n                         Allocated with name '_SemaphoreCreate_PARM_2'
                                    348 ;s                         Allocated to registers r5 r6 r7 
                                    349 ;------------------------------------------------------------
                                    350 ;	testpreempt.c:32: void SemaphoreCreate(char *s, char n) {
                                    351 ;	-----------------------------------------
                                    352 ;	 function SemaphoreCreate
                                    353 ;	-----------------------------------------
      00001D                        354 _SemaphoreCreate:
                           000007   355 	ar7 = 0x07
                           000006   356 	ar6 = 0x06
                           000005   357 	ar5 = 0x05
                           000004   358 	ar4 = 0x04
                           000003   359 	ar3 = 0x03
                           000002   360 	ar2 = 0x02
                           000001   361 	ar1 = 0x01
                           000000   362 	ar0 = 0x00
      00001D AD 82            [24]  363 	mov	r5,dpl
      00001F AE 83            [24]  364 	mov	r6,dph
      000021 AF F0            [24]  365 	mov	r7,b
                                    366 ;	testpreempt.c:33: EA=0;
                                    367 ;	assignBit
      000023 C2 AF            [12]  368 	clr	_EA
                                    369 ;	testpreempt.c:34: *s = n;
      000025 8D 82            [24]  370 	mov	dpl,r5
      000027 8E 83            [24]  371 	mov	dph,r6
      000029 8F F0            [24]  372 	mov	b,r7
      00002B E5 08            [12]  373 	mov	a,_SemaphoreCreate_PARM_2
      00002D 12 04 14         [24]  374 	lcall	__gptrput
                                    375 ;	testpreempt.c:35: EA= 1;
                                    376 ;	assignBit
      000030 D2 AF            [12]  377 	setb	_EA
                                    378 ;	testpreempt.c:36: return;
                                    379 ;	testpreempt.c:37: }
      000032 22               [24]  380 	ret
                                    381 ;------------------------------------------------------------
                                    382 ;Allocation info for local variables in function 'Producer1'
                                    383 ;------------------------------------------------------------
                                    384 ;	testpreempt.c:38: void Producer1(void) {
                                    385 ;	-----------------------------------------
                                    386 ;	 function Producer1
                                    387 ;	-----------------------------------------
      000033                        388 _Producer1:
                                    389 ;	testpreempt.c:46: __endasm;
      000033 75 32 40         [24]  390 	MOV	0X32,#0X40
                                    391 ;	testpreempt.c:47: while(1){
      000036                        392 00106$:
                                    393 ;	testpreempt.c:48: SemaphoreWait(empty);//number 0f empty block
      000036                        394 		0$:
      000036 D2 AF            [12]  395 	SETB IE.7 
      000038 C2 AF            [12]  396 	CLR IE.7 
      00003A 85 3B E0         [24]  397 	MOV ACC,_empty 
      00003D 60 F7            [24]  398 	JZ 0$ 
      00003F 15 3B            [12]  399 	DEC _empty 
      000041 D2 AF            [12]  400 	SETB IE.7 
                                    401 ;	testpreempt.c:49: SemaphoreWait(mutex);
      000043                        402 		1$:
      000043 D2 AF            [12]  403 	SETB IE.7 
      000045 C2 AF            [12]  404 	CLR IE.7 
      000047 85 2E E0         [24]  405 	MOV ACC,_mutex 
      00004A 60 F7            [24]  406 	JZ 1$ 
      00004C 15 2E            [12]  407 	DEC _mutex 
      00004E D2 AF            [12]  408 	SETB IE.7 
                                    409 ;	testpreempt.c:50: nextChar +=1;
      000050 E5 32            [12]  410 	mov	a,_nextChar
      000052 04               [12]  411 	inc	a
      000053 F5 32            [12]  412 	mov	_nextChar,a
                                    413 ;	testpreempt.c:51: sharedBuffer[produce] = nextChar;
      000055 E5 3F            [12]  414 	mov	a,_produce
      000057 24 3C            [12]  415 	add	a,#_sharedBuffer
      000059 F8               [12]  416 	mov	r0,a
      00005A A6 32            [24]  417 	mov	@r0,_nextChar
                                    418 ;	testpreempt.c:52: produce+=1;
      00005C E5 3F            [12]  419 	mov	a,_produce
      00005E FF               [12]  420 	mov	r7,a
      00005F 04               [12]  421 	inc	a
      000060 F5 3F            [12]  422 	mov	_produce,a
                                    423 ;	testpreempt.c:53: if(nextChar >  'Z'){
      000062 E5 32            [12]  424 	mov	a,_nextChar
      000064 24 A5            [12]  425 	add	a,#0xff - 0x5a
      000066 50 03            [24]  426 	jnc	00102$
                                    427 ;	testpreempt.c:54: nextChar = 'A';
      000068 75 32 41         [24]  428 	mov	_nextChar,#0x41
      00006B                        429 00102$:
                                    430 ;	testpreempt.c:56: if(produce==3){
      00006B 74 03            [12]  431 	mov	a,#0x03
      00006D B5 3F 03         [24]  432 	cjne	a,_produce,00104$
                                    433 ;	testpreempt.c:57: produce = 0 ;
      000070 75 3F 00         [24]  434 	mov	_produce,#0x00
      000073                        435 00104$:
                                    436 ;	testpreempt.c:59: SemaphoreSignal(mutex);
      000073 05 2E            [12]  437 	INC _mutex 
                                    438 ;	testpreempt.c:60: SemaphoreSignal(full);
      000075 05 3A            [12]  439 	INC _full 
                                    440 ;	testpreempt.c:63: }
      000077 80 BD            [24]  441 	sjmp	00106$
                                    442 ;------------------------------------------------------------
                                    443 ;Allocation info for local variables in function 'Producer2'
                                    444 ;------------------------------------------------------------
                                    445 ;	testpreempt.c:65: void Producer2(void){
                                    446 ;	-----------------------------------------
                                    447 ;	 function Producer2
                                    448 ;	-----------------------------------------
      000079                        449 _Producer2:
                                    450 ;	testpreempt.c:66: nextNum = '0';
      000079 75 29 30         [24]  451 	mov	_nextNum,#0x30
                                    452 ;	testpreempt.c:67: while(1){
      00007C                        453 00106$:
                                    454 ;	testpreempt.c:68: SemaphoreWait(empty);//number 0f empty block
      00007C                        455 		2$:
      00007C D2 AF            [12]  456 	SETB IE.7 
      00007E C2 AF            [12]  457 	CLR IE.7 
      000080 85 3B E0         [24]  458 	MOV ACC,_empty 
      000083 60 F7            [24]  459 	JZ 2$ 
      000085 15 3B            [12]  460 	DEC _empty 
      000087 D2 AF            [12]  461 	SETB IE.7 
                                    462 ;	testpreempt.c:69: SemaphoreWait(mutex);
      000089                        463 		3$:
      000089 D2 AF            [12]  464 	SETB IE.7 
      00008B C2 AF            [12]  465 	CLR IE.7 
      00008D 85 2E E0         [24]  466 	MOV ACC,_mutex 
      000090 60 F7            [24]  467 	JZ 3$ 
      000092 15 2E            [12]  468 	DEC _mutex 
      000094 D2 AF            [12]  469 	SETB IE.7 
                                    470 ;	testpreempt.c:70: sharedBuffer[produce] = nextNum;
      000096 E5 3F            [12]  471 	mov	a,_produce
      000098 24 3C            [12]  472 	add	a,#_sharedBuffer
      00009A F8               [12]  473 	mov	r0,a
      00009B A6 29            [24]  474 	mov	@r0,_nextNum
                                    475 ;	testpreempt.c:71: produce+=1;
      00009D E5 3F            [12]  476 	mov	a,_produce
      00009F 04               [12]  477 	inc	a
      0000A0 F5 3F            [12]  478 	mov	_produce,a
                                    479 ;	testpreempt.c:72: nextNum +=1;
      0000A2 E5 29            [12]  480 	mov	a,_nextNum
      0000A4 FF               [12]  481 	mov	r7,a
      0000A5 04               [12]  482 	inc	a
      0000A6 F5 29            [12]  483 	mov	_nextNum,a
                                    484 ;	testpreempt.c:73: if(nextNum >  '9'){
      0000A8 E5 29            [12]  485 	mov	a,_nextNum
      0000AA 24 C6            [12]  486 	add	a,#0xff - 0x39
      0000AC 50 03            [24]  487 	jnc	00102$
                                    488 ;	testpreempt.c:74: nextNum = '0';
      0000AE 75 29 30         [24]  489 	mov	_nextNum,#0x30
      0000B1                        490 00102$:
                                    491 ;	testpreempt.c:76: if(produce==3){
      0000B1 74 03            [12]  492 	mov	a,#0x03
      0000B3 B5 3F 03         [24]  493 	cjne	a,_produce,00104$
                                    494 ;	testpreempt.c:77: produce = 0 ;
      0000B6 75 3F 00         [24]  495 	mov	_produce,#0x00
      0000B9                        496 00104$:
                                    497 ;	testpreempt.c:79: SemaphoreSignal(mutex);
      0000B9 05 2E            [12]  498 	INC _mutex 
                                    499 ;	testpreempt.c:80: SemaphoreSignal(full);
      0000BB 05 3A            [12]  500 	INC _full 
                                    501 ;	testpreempt.c:82: }
      0000BD 80 BD            [24]  502 	sjmp	00106$
                                    503 ;------------------------------------------------------------
                                    504 ;Allocation info for local variables in function 'Consumer'
                                    505 ;------------------------------------------------------------
                                    506 ;	testpreempt.c:88: void Consumer(void) {
                                    507 ;	-----------------------------------------
                                    508 ;	 function Consumer
                                    509 ;	-----------------------------------------
      0000BF                        510 _Consumer:
                                    511 ;	testpreempt.c:92: __endasm;
      0000BF 43 89 20         [24]  512 	ORL	0X89 , #0X20
                                    513 ;	testpreempt.c:93: TH1 = (char)-6;
      0000C2 75 8D FA         [24]  514 	mov	_TH1,#0xfa
                                    515 ;	testpreempt.c:94: SCON = 0x50;
      0000C5 75 98 50         [24]  516 	mov	_SCON,#0x50
                                    517 ;	testpreempt.c:95: TR1 = 1;
                                    518 ;	assignBit
      0000C8 D2 8E            [12]  519 	setb	_TR1
                                    520 ;	testpreempt.c:96: TI = 1;
                                    521 ;	assignBit
      0000CA D2 99            [12]  522 	setb	_TI
                                    523 ;	testpreempt.c:97: while (1) {
      0000CC                        524 00107$:
                                    525 ;	testpreempt.c:103: SemaphoreWait(full);
      0000CC                        526 		4$:
      0000CC D2 AF            [12]  527 	SETB IE.7 
      0000CE C2 AF            [12]  528 	CLR IE.7 
      0000D0 85 3A E0         [24]  529 	MOV ACC,_full 
      0000D3 60 F7            [24]  530 	JZ 4$ 
      0000D5 15 3A            [12]  531 	DEC _full 
      0000D7 D2 AF            [12]  532 	SETB IE.7 
                                    533 ;	testpreempt.c:104: SemaphoreWait(mutex);
      0000D9                        534 		5$:
      0000D9 D2 AF            [12]  535 	SETB IE.7 
      0000DB C2 AF            [12]  536 	CLR IE.7 
      0000DD 85 2E E0         [24]  537 	MOV ACC,_mutex 
      0000E0 60 F7            [24]  538 	JZ 5$ 
      0000E2 15 2E            [12]  539 	DEC _mutex 
      0000E4 D2 AF            [12]  540 	SETB IE.7 
                                    541 ;	testpreempt.c:105: while(!TI){}              	
      0000E6                        542 00101$:
      0000E6 30 99 FD         [24]  543 	jnb	_TI,00101$
                                    544 ;	testpreempt.c:106: SBUF = sharedBuffer[comsume];
      0000E9 E5 2F            [12]  545 	mov	a,_comsume
      0000EB 24 3C            [12]  546 	add	a,#_sharedBuffer
      0000ED F9               [12]  547 	mov	r1,a
      0000EE 87 99            [24]  548 	mov	_SBUF,@r1
                                    549 ;	testpreempt.c:107: comsume +=1;
      0000F0 E5 2F            [12]  550 	mov	a,_comsume
      0000F2 FF               [12]  551 	mov	r7,a
      0000F3 04               [12]  552 	inc	a
      0000F4 F5 2F            [12]  553 	mov	_comsume,a
                                    554 ;	testpreempt.c:108: if(comsume==3)comsume = 0;
      0000F6 74 03            [12]  555 	mov	a,#0x03
      0000F8 B5 2F 03         [24]  556 	cjne	a,_comsume,00105$
      0000FB 75 2F 00         [24]  557 	mov	_comsume,#0x00
      0000FE                        558 00105$:
                                    559 ;	testpreempt.c:109: TI = 0 ;
                                    560 ;	assignBit
      0000FE C2 99            [12]  561 	clr	_TI
                                    562 ;	testpreempt.c:110: SemaphoreSignal(mutex);
      000100 05 2E            [12]  563 	INC _mutex 
                                    564 ;	testpreempt.c:111: SemaphoreSignal(empty);
      000102 05 3B            [12]  565 	INC _empty 
                                    566 ;	testpreempt.c:113: }
      000104 80 C6            [24]  567 	sjmp	00107$
                                    568 ;------------------------------------------------------------
                                    569 ;Allocation info for local variables in function 'main'
                                    570 ;------------------------------------------------------------
                                    571 ;	testpreempt.c:120: void main(void) {
                                    572 ;	-----------------------------------------
                                    573 ;	 function main
                                    574 ;	-----------------------------------------
      000106                        575 _main:
                                    576 ;	testpreempt.c:128: SemaphoreCreate(&mutex, 1);
      000106 75 08 01         [24]  577 	mov	_SemaphoreCreate_PARM_2,#0x01
      000109 90 00 2E         [24]  578 	mov	dptr,#_mutex
      00010C 75 F0 40         [24]  579 	mov	b,#0x40
      00010F 12 00 1D         [24]  580 	lcall	_SemaphoreCreate
                                    581 ;	testpreempt.c:129: SemaphoreCreate(&full, 0);
      000112 75 08 00         [24]  582 	mov	_SemaphoreCreate_PARM_2,#0x00
      000115 90 00 3A         [24]  583 	mov	dptr,#_full
      000118 75 F0 40         [24]  584 	mov	b,#0x40
      00011B 12 00 1D         [24]  585 	lcall	_SemaphoreCreate
                                    586 ;	testpreempt.c:130: SemaphoreCreate(&empty, 3);
      00011E 75 08 03         [24]  587 	mov	_SemaphoreCreate_PARM_2,#0x03
      000121 90 00 3B         [24]  588 	mov	dptr,#_empty
      000124 75 F0 40         [24]  589 	mov	b,#0x40
      000127 12 00 1D         [24]  590 	lcall	_SemaphoreCreate
                                    591 ;	testpreempt.c:131: produce = 0;
      00012A 75 3F 00         [24]  592 	mov	_produce,#0x00
                                    593 ;	testpreempt.c:132: comsume = 0;
      00012D 75 2F 00         [24]  594 	mov	_comsume,#0x00
                                    595 ;	testpreempt.c:133: ThreadCreate(Producer1);
      000130 90 00 33         [24]  596 	mov	dptr,#_Producer1
      000133 12 01 98         [24]  597 	lcall	_ThreadCreate
                                    598 ;	testpreempt.c:134: ThreadCreate(Producer2);
      000136 90 00 79         [24]  599 	mov	dptr,#_Producer2
      000139 12 01 98         [24]  600 	lcall	_ThreadCreate
                                    601 ;	testpreempt.c:138: __endasm;
      00013C 85 34 81         [24]  602 	MOV	SP,0x34
      00013F 75 2C 01         [24]  603 	MOV	0x2c,#0x01;
                                    604 ;	testpreempt.c:139: Consumer();         
                                    605 ;	testpreempt.c:140: }
      000142 02 00 BF         [24]  606 	ljmp	_Consumer
                                    607 ;------------------------------------------------------------
                                    608 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    609 ;------------------------------------------------------------
                                    610 ;	testpreempt.c:142: void _sdcc_gsinit_startup(void) {
                                    611 ;	-----------------------------------------
                                    612 ;	 function _sdcc_gsinit_startup
                                    613 ;	-----------------------------------------
      000145                        614 __sdcc_gsinit_startup:
                                    615 ;	testpreempt.c:145: __endasm;
      000145 02 01 50         [24]  616 	ljmp	_Bootstrap
                                    617 ;	testpreempt.c:146: }
      000148 22               [24]  618 	ret
                                    619 ;------------------------------------------------------------
                                    620 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    621 ;------------------------------------------------------------
                                    622 ;	testpreempt.c:148: void _mcs51_genRAMCLEAR(void) {}
                                    623 ;	-----------------------------------------
                                    624 ;	 function _mcs51_genRAMCLEAR
                                    625 ;	-----------------------------------------
      000149                        626 __mcs51_genRAMCLEAR:
      000149 22               [24]  627 	ret
                                    628 ;------------------------------------------------------------
                                    629 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    630 ;------------------------------------------------------------
                                    631 ;	testpreempt.c:149: void _mcs51_genXINIT(void) {}
                                    632 ;	-----------------------------------------
                                    633 ;	 function _mcs51_genXINIT
                                    634 ;	-----------------------------------------
      00014A                        635 __mcs51_genXINIT:
      00014A 22               [24]  636 	ret
                                    637 ;------------------------------------------------------------
                                    638 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    639 ;------------------------------------------------------------
                                    640 ;	testpreempt.c:150: void _mcs51_genXRAMCLEAR(void) {}
                                    641 ;	-----------------------------------------
                                    642 ;	 function _mcs51_genXRAMCLEAR
                                    643 ;	-----------------------------------------
      00014B                        644 __mcs51_genXRAMCLEAR:
      00014B 22               [24]  645 	ret
                                    646 ;------------------------------------------------------------
                                    647 ;Allocation info for local variables in function 'timer0_ISR'
                                    648 ;------------------------------------------------------------
                                    649 ;	testpreempt.c:151: void timer0_ISR(void) __interrupt(1) {
                                    650 ;	-----------------------------------------
                                    651 ;	 function timer0_ISR
                                    652 ;	-----------------------------------------
      00014C                        653 _timer0_ISR:
                                    654 ;	testpreempt.c:154: __endasm;
      00014C 02 02 58         [24]  655 	ljmp	_myTimer0Handler
                                    656 ;	testpreempt.c:155: }
      00014F 32               [24]  657 	reti
                                    658 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    659 ;	eliminated unneeded push/pop psw
                                    660 ;	eliminated unneeded push/pop dpl
                                    661 ;	eliminated unneeded push/pop dph
                                    662 ;	eliminated unneeded push/pop b
                                    663 ;	eliminated unneeded push/pop acc
                                    664 	.area CSEG    (CODE)
                                    665 	.area CONST   (CODE)
                                    666 	.area XINIT   (CODE)
                                    667 	.area CABS    (ABS,CODE)
