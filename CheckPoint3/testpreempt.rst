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
                                     19 	.globl _Producer
                                     20 	.globl _SemaphoreCreate
                                     21 	.globl _ThreadCreate
                                     22 	.globl _CY
                                     23 	.globl _AC
                                     24 	.globl _F0
                                     25 	.globl _RS1
                                     26 	.globl _RS0
                                     27 	.globl _OV
                                     28 	.globl _F1
                                     29 	.globl _P
                                     30 	.globl _PS
                                     31 	.globl _PT1
                                     32 	.globl _PX1
                                     33 	.globl _PT0
                                     34 	.globl _PX0
                                     35 	.globl _RD
                                     36 	.globl _WR
                                     37 	.globl _T1
                                     38 	.globl _T0
                                     39 	.globl _INT1
                                     40 	.globl _INT0
                                     41 	.globl _TXD
                                     42 	.globl _RXD
                                     43 	.globl _P3_7
                                     44 	.globl _P3_6
                                     45 	.globl _P3_5
                                     46 	.globl _P3_4
                                     47 	.globl _P3_3
                                     48 	.globl _P3_2
                                     49 	.globl _P3_1
                                     50 	.globl _P3_0
                                     51 	.globl _EA
                                     52 	.globl _ES
                                     53 	.globl _ET1
                                     54 	.globl _EX1
                                     55 	.globl _ET0
                                     56 	.globl _EX0
                                     57 	.globl _P2_7
                                     58 	.globl _P2_6
                                     59 	.globl _P2_5
                                     60 	.globl _P2_4
                                     61 	.globl _P2_3
                                     62 	.globl _P2_2
                                     63 	.globl _P2_1
                                     64 	.globl _P2_0
                                     65 	.globl _SM0
                                     66 	.globl _SM1
                                     67 	.globl _SM2
                                     68 	.globl _REN
                                     69 	.globl _TB8
                                     70 	.globl _RB8
                                     71 	.globl _TI
                                     72 	.globl _RI
                                     73 	.globl _P1_7
                                     74 	.globl _P1_6
                                     75 	.globl _P1_5
                                     76 	.globl _P1_4
                                     77 	.globl _P1_3
                                     78 	.globl _P1_2
                                     79 	.globl _P1_1
                                     80 	.globl _P1_0
                                     81 	.globl _TF1
                                     82 	.globl _TR1
                                     83 	.globl _TF0
                                     84 	.globl _TR0
                                     85 	.globl _IE1
                                     86 	.globl _IT1
                                     87 	.globl _IE0
                                     88 	.globl _IT0
                                     89 	.globl _P0_7
                                     90 	.globl _P0_6
                                     91 	.globl _P0_5
                                     92 	.globl _P0_4
                                     93 	.globl _P0_3
                                     94 	.globl _P0_2
                                     95 	.globl _P0_1
                                     96 	.globl _P0_0
                                     97 	.globl _B
                                     98 	.globl _ACC
                                     99 	.globl _PSW
                                    100 	.globl _IP
                                    101 	.globl _P3
                                    102 	.globl _IE
                                    103 	.globl _P2
                                    104 	.globl _SBUF
                                    105 	.globl _SCON
                                    106 	.globl _P1
                                    107 	.globl _TH1
                                    108 	.globl _TH0
                                    109 	.globl _TL1
                                    110 	.globl _TL0
                                    111 	.globl _TMOD
                                    112 	.globl _TCON
                                    113 	.globl _PCON
                                    114 	.globl _DPH
                                    115 	.globl _DPL
                                    116 	.globl _SP
                                    117 	.globl _P0
                                    118 	.globl _sharedBuffer
                                    119 	.globl _nextChar
                                    120 	.globl _comsume
                                    121 	.globl _produce
                                    122 	.globl _empty
                                    123 	.globl _full
                                    124 	.globl _mutex
                                    125 ;--------------------------------------------------------
                                    126 ; special function registers
                                    127 ;--------------------------------------------------------
                                    128 	.area RSEG    (ABS,DATA)
      000000                        129 	.org 0x0000
                           000080   130 _P0	=	0x0080
                           000081   131 _SP	=	0x0081
                           000082   132 _DPL	=	0x0082
                           000083   133 _DPH	=	0x0083
                           000087   134 _PCON	=	0x0087
                           000088   135 _TCON	=	0x0088
                           000089   136 _TMOD	=	0x0089
                           00008A   137 _TL0	=	0x008a
                           00008B   138 _TL1	=	0x008b
                           00008C   139 _TH0	=	0x008c
                           00008D   140 _TH1	=	0x008d
                           000090   141 _P1	=	0x0090
                           000098   142 _SCON	=	0x0098
                           000099   143 _SBUF	=	0x0099
                           0000A0   144 _P2	=	0x00a0
                           0000A8   145 _IE	=	0x00a8
                           0000B0   146 _P3	=	0x00b0
                           0000B8   147 _IP	=	0x00b8
                           0000D0   148 _PSW	=	0x00d0
                           0000E0   149 _ACC	=	0x00e0
                           0000F0   150 _B	=	0x00f0
                                    151 ;--------------------------------------------------------
                                    152 ; special function bits
                                    153 ;--------------------------------------------------------
                                    154 	.area RSEG    (ABS,DATA)
      000000                        155 	.org 0x0000
                           000080   156 _P0_0	=	0x0080
                           000081   157 _P0_1	=	0x0081
                           000082   158 _P0_2	=	0x0082
                           000083   159 _P0_3	=	0x0083
                           000084   160 _P0_4	=	0x0084
                           000085   161 _P0_5	=	0x0085
                           000086   162 _P0_6	=	0x0086
                           000087   163 _P0_7	=	0x0087
                           000088   164 _IT0	=	0x0088
                           000089   165 _IE0	=	0x0089
                           00008A   166 _IT1	=	0x008a
                           00008B   167 _IE1	=	0x008b
                           00008C   168 _TR0	=	0x008c
                           00008D   169 _TF0	=	0x008d
                           00008E   170 _TR1	=	0x008e
                           00008F   171 _TF1	=	0x008f
                           000090   172 _P1_0	=	0x0090
                           000091   173 _P1_1	=	0x0091
                           000092   174 _P1_2	=	0x0092
                           000093   175 _P1_3	=	0x0093
                           000094   176 _P1_4	=	0x0094
                           000095   177 _P1_5	=	0x0095
                           000096   178 _P1_6	=	0x0096
                           000097   179 _P1_7	=	0x0097
                           000098   180 _RI	=	0x0098
                           000099   181 _TI	=	0x0099
                           00009A   182 _RB8	=	0x009a
                           00009B   183 _TB8	=	0x009b
                           00009C   184 _REN	=	0x009c
                           00009D   185 _SM2	=	0x009d
                           00009E   186 _SM1	=	0x009e
                           00009F   187 _SM0	=	0x009f
                           0000A0   188 _P2_0	=	0x00a0
                           0000A1   189 _P2_1	=	0x00a1
                           0000A2   190 _P2_2	=	0x00a2
                           0000A3   191 _P2_3	=	0x00a3
                           0000A4   192 _P2_4	=	0x00a4
                           0000A5   193 _P2_5	=	0x00a5
                           0000A6   194 _P2_6	=	0x00a6
                           0000A7   195 _P2_7	=	0x00a7
                           0000A8   196 _EX0	=	0x00a8
                           0000A9   197 _ET0	=	0x00a9
                           0000AA   198 _EX1	=	0x00aa
                           0000AB   199 _ET1	=	0x00ab
                           0000AC   200 _ES	=	0x00ac
                           0000AF   201 _EA	=	0x00af
                           0000B0   202 _P3_0	=	0x00b0
                           0000B1   203 _P3_1	=	0x00b1
                           0000B2   204 _P3_2	=	0x00b2
                           0000B3   205 _P3_3	=	0x00b3
                           0000B4   206 _P3_4	=	0x00b4
                           0000B5   207 _P3_5	=	0x00b5
                           0000B6   208 _P3_6	=	0x00b6
                           0000B7   209 _P3_7	=	0x00b7
                           0000B0   210 _RXD	=	0x00b0
                           0000B1   211 _TXD	=	0x00b1
                           0000B2   212 _INT0	=	0x00b2
                           0000B3   213 _INT1	=	0x00b3
                           0000B4   214 _T0	=	0x00b4
                           0000B5   215 _T1	=	0x00b5
                           0000B6   216 _WR	=	0x00b6
                           0000B7   217 _RD	=	0x00b7
                           0000B8   218 _PX0	=	0x00b8
                           0000B9   219 _PT0	=	0x00b9
                           0000BA   220 _PX1	=	0x00ba
                           0000BB   221 _PT1	=	0x00bb
                           0000BC   222 _PS	=	0x00bc
                           0000D0   223 _P	=	0x00d0
                           0000D1   224 _F1	=	0x00d1
                           0000D2   225 _OV	=	0x00d2
                           0000D3   226 _RS0	=	0x00d3
                           0000D4   227 _RS1	=	0x00d4
                           0000D5   228 _F0	=	0x00d5
                           0000D6   229 _AC	=	0x00d6
                           0000D7   230 _CY	=	0x00d7
                                    231 ;--------------------------------------------------------
                                    232 ; overlayable register banks
                                    233 ;--------------------------------------------------------
                                    234 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        235 	.ds 8
                                    236 ;--------------------------------------------------------
                                    237 ; internal ram data
                                    238 ;--------------------------------------------------------
                                    239 	.area DSEG    (DATA)
                           00002E   240 _mutex	=	0x002e
                           00003A   241 _full	=	0x003a
                           00003B   242 _empty	=	0x003b
                           00003F   243 _produce	=	0x003f
                           00002F   244 _comsume	=	0x002f
                           000032   245 _nextChar	=	0x0032
                                    246 ;--------------------------------------------------------
                                    247 ; overlayable items in internal ram 
                                    248 ;--------------------------------------------------------
                                    249 	.area	OSEG    (OVR,DATA)
      000008                        250 _SemaphoreCreate_PARM_2:
      000008                        251 	.ds 1
                                    252 ;--------------------------------------------------------
                                    253 ; Stack segment in internal ram 
                                    254 ;--------------------------------------------------------
                                    255 	.area	SSEG
      00003F                        256 __start__stack:
      00003F                        257 	.ds	1
                                    258 
                                    259 ;--------------------------------------------------------
                                    260 ; indirectly addressable internal ram data
                                    261 ;--------------------------------------------------------
                                    262 	.area ISEG    (DATA)
                                    263 ;--------------------------------------------------------
                                    264 ; absolute internal ram data
                                    265 ;--------------------------------------------------------
                                    266 	.area IABS    (ABS,DATA)
      00003C                        267 	.org 0x003C
      00003C                        268 _sharedBuffer::
      00003C                        269 	.ds 3
                                    270 	.area IABS    (ABS,DATA)
                                    271 ;--------------------------------------------------------
                                    272 ; bit data
                                    273 ;--------------------------------------------------------
                                    274 	.area BSEG    (BIT)
                                    275 ;--------------------------------------------------------
                                    276 ; paged external ram data
                                    277 ;--------------------------------------------------------
                                    278 	.area PSEG    (PAG,XDATA)
                                    279 ;--------------------------------------------------------
                                    280 ; external ram data
                                    281 ;--------------------------------------------------------
                                    282 	.area XSEG    (XDATA)
                                    283 ;--------------------------------------------------------
                                    284 ; absolute external ram data
                                    285 ;--------------------------------------------------------
                                    286 	.area XABS    (ABS,XDATA)
                                    287 ;--------------------------------------------------------
                                    288 ; external initialized ram data
                                    289 ;--------------------------------------------------------
                                    290 	.area XISEG   (XDATA)
                                    291 	.area HOME    (CODE)
                                    292 	.area GSINIT0 (CODE)
                                    293 	.area GSINIT1 (CODE)
                                    294 	.area GSINIT2 (CODE)
                                    295 	.area GSINIT3 (CODE)
                                    296 	.area GSINIT4 (CODE)
                                    297 	.area GSINIT5 (CODE)
                                    298 	.area GSINIT  (CODE)
                                    299 	.area GSFINAL (CODE)
                                    300 	.area CSEG    (CODE)
                                    301 ;--------------------------------------------------------
                                    302 ; interrupt vector 
                                    303 ;--------------------------------------------------------
                                    304 	.area HOME    (CODE)
      000000                        305 __interrupt_vect:
      000000 02 00 F6         [24]  306 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  307 	reti
      000004                        308 	.ds	7
      00000B 02 00 FD         [24]  309 	ljmp	_timer0_ISR
                                    310 ;--------------------------------------------------------
                                    311 ; global & static initialisations
                                    312 ;--------------------------------------------------------
                                    313 	.area HOME    (CODE)
                                    314 	.area GSINIT  (CODE)
                                    315 	.area GSFINAL (CODE)
                                    316 	.area GSINIT  (CODE)
                                    317 	.globl __sdcc_gsinit_startup
                                    318 	.globl __sdcc_program_startup
                                    319 	.globl __start__stack
                                    320 	.globl __mcs51_genXINIT
                                    321 	.globl __mcs51_genXRAMCLEAR
                                    322 	.globl __mcs51_genRAMCLEAR
                                    323 ;	testpreempt.c:18: __data __at(0x3C) char sharedBuffer[3] = {' ', ' ', ' '};
      000011 75 3C 20         [24]  324 	mov	_sharedBuffer,#0x20
      000014 75 3D 20         [24]  325 	mov	(_sharedBuffer + 0x0001),#0x20
      000017 75 3E 20         [24]  326 	mov	(_sharedBuffer + 0x0002),#0x20
                                    327 	.area GSFINAL (CODE)
      00001A 02 00 0E         [24]  328 	ljmp	__sdcc_program_startup
                                    329 ;--------------------------------------------------------
                                    330 ; Home
                                    331 ;--------------------------------------------------------
                                    332 	.area HOME    (CODE)
                                    333 	.area HOME    (CODE)
      00000E                        334 __sdcc_program_startup:
      00000E 02 00 C0         [24]  335 	ljmp	_main
                                    336 ;	return from main will return to caller
                                    337 ;--------------------------------------------------------
                                    338 ; code
                                    339 ;--------------------------------------------------------
                                    340 	.area CSEG    (CODE)
                                    341 ;------------------------------------------------------------
                                    342 ;Allocation info for local variables in function 'SemaphoreCreate'
                                    343 ;------------------------------------------------------------
                                    344 ;n                         Allocated with name '_SemaphoreCreate_PARM_2'
                                    345 ;s                         Allocated to registers r5 r6 r7 
                                    346 ;------------------------------------------------------------
                                    347 ;	testpreempt.c:31: void SemaphoreCreate(char *s, char n) {
                                    348 ;	-----------------------------------------
                                    349 ;	 function SemaphoreCreate
                                    350 ;	-----------------------------------------
      00001D                        351 _SemaphoreCreate:
                           000007   352 	ar7 = 0x07
                           000006   353 	ar6 = 0x06
                           000005   354 	ar5 = 0x05
                           000004   355 	ar4 = 0x04
                           000003   356 	ar3 = 0x03
                           000002   357 	ar2 = 0x02
                           000001   358 	ar1 = 0x01
                           000000   359 	ar0 = 0x00
      00001D AD 82            [24]  360 	mov	r5,dpl
      00001F AE 83            [24]  361 	mov	r6,dph
      000021 AF F0            [24]  362 	mov	r7,b
                                    363 ;	testpreempt.c:32: EA=0;
                                    364 ;	assignBit
      000023 C2 AF            [12]  365 	clr	_EA
                                    366 ;	testpreempt.c:33: *s = n;
      000025 8D 82            [24]  367 	mov	dpl,r5
      000027 8E 83            [24]  368 	mov	dph,r6
      000029 8F F0            [24]  369 	mov	b,r7
      00002B E5 08            [12]  370 	mov	a,_SemaphoreCreate_PARM_2
      00002D 12 04 12         [24]  371 	lcall	__gptrput
                                    372 ;	testpreempt.c:34: EA= 1;
                                    373 ;	assignBit
      000030 D2 AF            [12]  374 	setb	_EA
                                    375 ;	testpreempt.c:35: return;
                                    376 ;	testpreempt.c:36: }
      000032 22               [24]  377 	ret
                                    378 ;------------------------------------------------------------
                                    379 ;Allocation info for local variables in function 'Producer'
                                    380 ;------------------------------------------------------------
                                    381 ;	testpreempt.c:37: void Producer(void) {
                                    382 ;	-----------------------------------------
                                    383 ;	 function Producer
                                    384 ;	-----------------------------------------
      000033                        385 _Producer:
                                    386 ;	testpreempt.c:45: __endasm;
      000033 75 32 40         [24]  387 	MOV	0X32,#0X40
                                    388 ;	testpreempt.c:46: while(1){
      000036                        389 00106$:
                                    390 ;	testpreempt.c:47: SemaphoreWait(empty);//number 0f empty block
      000036                        391 		0$:
      000036 D2 AF            [12]  392 	SETB IE.7 
      000038 C2 AF            [12]  393 	CLR IE.7 
      00003A 85 3B E0         [24]  394 	MOV ACC,_empty 
      00003D 60 F7            [24]  395 	JZ 0$ 
      00003F 15 3B            [12]  396 	DEC _empty 
      000041 D2 AF            [12]  397 	SETB IE.7 
                                    398 ;	testpreempt.c:48: SemaphoreWait(mutex);
      000043                        399 		1$:
      000043 D2 AF            [12]  400 	SETB IE.7 
      000045 C2 AF            [12]  401 	CLR IE.7 
      000047 85 2E E0         [24]  402 	MOV ACC,_mutex 
      00004A 60 F7            [24]  403 	JZ 1$ 
      00004C 15 2E            [12]  404 	DEC _mutex 
      00004E D2 AF            [12]  405 	SETB IE.7 
                                    406 ;	testpreempt.c:49: nextChar +=1;
      000050 E5 32            [12]  407 	mov	a,_nextChar
      000052 04               [12]  408 	inc	a
      000053 F5 32            [12]  409 	mov	_nextChar,a
                                    410 ;	testpreempt.c:50: sharedBuffer[produce] = nextChar;
      000055 E5 3F            [12]  411 	mov	a,_produce
      000057 24 3C            [12]  412 	add	a,#_sharedBuffer
      000059 F8               [12]  413 	mov	r0,a
      00005A A6 32            [24]  414 	mov	@r0,_nextChar
                                    415 ;	testpreempt.c:51: produce+=1;
      00005C E5 3F            [12]  416 	mov	a,_produce
      00005E FF               [12]  417 	mov	r7,a
      00005F 04               [12]  418 	inc	a
      000060 F5 3F            [12]  419 	mov	_produce,a
                                    420 ;	testpreempt.c:52: if(nextChar >  'Z'){
      000062 E5 32            [12]  421 	mov	a,_nextChar
      000064 24 A5            [12]  422 	add	a,#0xff - 0x5a
      000066 50 03            [24]  423 	jnc	00102$
                                    424 ;	testpreempt.c:53: nextChar = 'A';
      000068 75 32 41         [24]  425 	mov	_nextChar,#0x41
      00006B                        426 00102$:
                                    427 ;	testpreempt.c:55: if(produce==3){
      00006B 74 03            [12]  428 	mov	a,#0x03
      00006D B5 3F 03         [24]  429 	cjne	a,_produce,00104$
                                    430 ;	testpreempt.c:56: produce = 0 ;
      000070 75 3F 00         [24]  431 	mov	_produce,#0x00
      000073                        432 00104$:
                                    433 ;	testpreempt.c:58: SemaphoreSignal(mutex);
      000073 05 2E            [12]  434 	INC _mutex 
                                    435 ;	testpreempt.c:59: SemaphoreSignal(full);
      000075 05 3A            [12]  436 	INC _full 
                                    437 ;	testpreempt.c:62: }
      000077 80 BD            [24]  438 	sjmp	00106$
                                    439 ;------------------------------------------------------------
                                    440 ;Allocation info for local variables in function 'Consumer'
                                    441 ;------------------------------------------------------------
                                    442 ;	testpreempt.c:70: void Consumer(void) {
                                    443 ;	-----------------------------------------
                                    444 ;	 function Consumer
                                    445 ;	-----------------------------------------
      000079                        446 _Consumer:
                                    447 ;	testpreempt.c:74: __endasm;
      000079 43 89 20         [24]  448 	ORL	0X89 , #0X20
                                    449 ;	testpreempt.c:75: TH1 = (char)-6;
      00007C 75 8D FA         [24]  450 	mov	_TH1,#0xfa
                                    451 ;	testpreempt.c:76: SCON = 0x50;
      00007F 75 98 50         [24]  452 	mov	_SCON,#0x50
                                    453 ;	testpreempt.c:77: TR1 = 1;
                                    454 ;	assignBit
      000082 D2 8E            [12]  455 	setb	_TR1
                                    456 ;	testpreempt.c:78: TI = 1;
                                    457 ;	assignBit
      000084 D2 99            [12]  458 	setb	_TI
                                    459 ;	testpreempt.c:79: while (1) {
      000086                        460 00107$:
                                    461 ;	testpreempt.c:85: SemaphoreWait(full);
      000086                        462 		2$:
      000086 D2 AF            [12]  463 	SETB IE.7 
      000088 C2 AF            [12]  464 	CLR IE.7 
      00008A 85 3A E0         [24]  465 	MOV ACC,_full 
      00008D 60 F7            [24]  466 	JZ 2$ 
      00008F 15 3A            [12]  467 	DEC _full 
      000091 D2 AF            [12]  468 	SETB IE.7 
                                    469 ;	testpreempt.c:86: SemaphoreWait(mutex);
      000093                        470 		3$:
      000093 D2 AF            [12]  471 	SETB IE.7 
      000095 C2 AF            [12]  472 	CLR IE.7 
      000097 85 2E E0         [24]  473 	MOV ACC,_mutex 
      00009A 60 F7            [24]  474 	JZ 3$ 
      00009C 15 2E            [12]  475 	DEC _mutex 
      00009E D2 AF            [12]  476 	SETB IE.7 
                                    477 ;	testpreempt.c:87: while(!TI){}              	
      0000A0                        478 00101$:
      0000A0 30 99 FD         [24]  479 	jnb	_TI,00101$
                                    480 ;	testpreempt.c:88: SBUF = sharedBuffer[comsume];
      0000A3 E5 2F            [12]  481 	mov	a,_comsume
      0000A5 24 3C            [12]  482 	add	a,#_sharedBuffer
      0000A7 F9               [12]  483 	mov	r1,a
      0000A8 87 99            [24]  484 	mov	_SBUF,@r1
                                    485 ;	testpreempt.c:89: comsume +=1;
      0000AA E5 2F            [12]  486 	mov	a,_comsume
      0000AC FF               [12]  487 	mov	r7,a
      0000AD 04               [12]  488 	inc	a
      0000AE F5 2F            [12]  489 	mov	_comsume,a
                                    490 ;	testpreempt.c:90: if(comsume==3)comsume = 0;
      0000B0 74 03            [12]  491 	mov	a,#0x03
      0000B2 B5 2F 03         [24]  492 	cjne	a,_comsume,00105$
      0000B5 75 2F 00         [24]  493 	mov	_comsume,#0x00
      0000B8                        494 00105$:
                                    495 ;	testpreempt.c:91: TI = 0 ;
                                    496 ;	assignBit
      0000B8 C2 99            [12]  497 	clr	_TI
                                    498 ;	testpreempt.c:92: SemaphoreSignal(mutex);
      0000BA 05 2E            [12]  499 	INC _mutex 
                                    500 ;	testpreempt.c:93: SemaphoreSignal(empty);
      0000BC 05 3B            [12]  501 	INC _empty 
                                    502 ;	testpreempt.c:95: }
      0000BE 80 C6            [24]  503 	sjmp	00107$
                                    504 ;------------------------------------------------------------
                                    505 ;Allocation info for local variables in function 'main'
                                    506 ;------------------------------------------------------------
                                    507 ;	testpreempt.c:102: void main(void) {
                                    508 ;	-----------------------------------------
                                    509 ;	 function main
                                    510 ;	-----------------------------------------
      0000C0                        511 _main:
                                    512 ;	testpreempt.c:110: SemaphoreCreate(&mutex, 1);
      0000C0 75 08 01         [24]  513 	mov	_SemaphoreCreate_PARM_2,#0x01
      0000C3 90 00 2E         [24]  514 	mov	dptr,#_mutex
      0000C6 75 F0 40         [24]  515 	mov	b,#0x40
      0000C9 12 00 1D         [24]  516 	lcall	_SemaphoreCreate
                                    517 ;	testpreempt.c:111: SemaphoreCreate(&full, 0);
      0000CC 75 08 00         [24]  518 	mov	_SemaphoreCreate_PARM_2,#0x00
      0000CF 90 00 3A         [24]  519 	mov	dptr,#_full
      0000D2 75 F0 40         [24]  520 	mov	b,#0x40
      0000D5 12 00 1D         [24]  521 	lcall	_SemaphoreCreate
                                    522 ;	testpreempt.c:112: SemaphoreCreate(&empty, 3);
      0000D8 75 08 03         [24]  523 	mov	_SemaphoreCreate_PARM_2,#0x03
      0000DB 90 00 3B         [24]  524 	mov	dptr,#_empty
      0000DE 75 F0 40         [24]  525 	mov	b,#0x40
      0000E1 12 00 1D         [24]  526 	lcall	_SemaphoreCreate
                                    527 ;	testpreempt.c:113: produce = 0;
      0000E4 75 3F 00         [24]  528 	mov	_produce,#0x00
                                    529 ;	testpreempt.c:114: comsume = 0;
      0000E7 75 2F 00         [24]  530 	mov	_comsume,#0x00
                                    531 ;	testpreempt.c:115: ThreadCreate(Producer);
      0000EA 90 00 33         [24]  532 	mov	dptr,#_Producer
      0000ED 12 01 49         [24]  533 	lcall	_ThreadCreate
                                    534 ;	testpreempt.c:118: __endasm;
      0000F0 85 34 81         [24]  535 	MOV	SP,0x34
                                    536 ;	testpreempt.c:119: Consumer();         
                                    537 ;	testpreempt.c:120: }
      0000F3 02 00 79         [24]  538 	ljmp	_Consumer
                                    539 ;------------------------------------------------------------
                                    540 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    541 ;------------------------------------------------------------
                                    542 ;	testpreempt.c:122: void _sdcc_gsinit_startup(void) {
                                    543 ;	-----------------------------------------
                                    544 ;	 function _sdcc_gsinit_startup
                                    545 ;	-----------------------------------------
      0000F6                        546 __sdcc_gsinit_startup:
                                    547 ;	testpreempt.c:125: __endasm;
      0000F6 02 01 01         [24]  548 	ljmp	_Bootstrap
                                    549 ;	testpreempt.c:126: }
      0000F9 22               [24]  550 	ret
                                    551 ;------------------------------------------------------------
                                    552 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    553 ;------------------------------------------------------------
                                    554 ;	testpreempt.c:128: void _mcs51_genRAMCLEAR(void) {}
                                    555 ;	-----------------------------------------
                                    556 ;	 function _mcs51_genRAMCLEAR
                                    557 ;	-----------------------------------------
      0000FA                        558 __mcs51_genRAMCLEAR:
      0000FA 22               [24]  559 	ret
                                    560 ;------------------------------------------------------------
                                    561 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    562 ;------------------------------------------------------------
                                    563 ;	testpreempt.c:129: void _mcs51_genXINIT(void) {}
                                    564 ;	-----------------------------------------
                                    565 ;	 function _mcs51_genXINIT
                                    566 ;	-----------------------------------------
      0000FB                        567 __mcs51_genXINIT:
      0000FB 22               [24]  568 	ret
                                    569 ;------------------------------------------------------------
                                    570 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    571 ;------------------------------------------------------------
                                    572 ;	testpreempt.c:130: void _mcs51_genXRAMCLEAR(void) {}
                                    573 ;	-----------------------------------------
                                    574 ;	 function _mcs51_genXRAMCLEAR
                                    575 ;	-----------------------------------------
      0000FC                        576 __mcs51_genXRAMCLEAR:
      0000FC 22               [24]  577 	ret
                                    578 ;------------------------------------------------------------
                                    579 ;Allocation info for local variables in function 'timer0_ISR'
                                    580 ;------------------------------------------------------------
                                    581 ;	testpreempt.c:131: void timer0_ISR(void) __interrupt(1) {
                                    582 ;	-----------------------------------------
                                    583 ;	 function timer0_ISR
                                    584 ;	-----------------------------------------
      0000FD                        585 _timer0_ISR:
                                    586 ;	testpreempt.c:134: __endasm;
      0000FD 02 02 09         [24]  587 	ljmp	_myTimer0Handler
                                    588 ;	testpreempt.c:135: }
      000100 32               [24]  589 	reti
                                    590 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    591 ;	eliminated unneeded push/pop psw
                                    592 ;	eliminated unneeded push/pop dpl
                                    593 ;	eliminated unneeded push/pop dph
                                    594 ;	eliminated unneeded push/pop b
                                    595 ;	eliminated unneeded push/pop acc
                                    596 	.area CSEG    (CODE)
                                    597 	.area CONST   (CODE)
                                    598 	.area XINIT   (CODE)
                                    599 	.area CABS    (ABS,CODE)
