                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module testcoop
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl __mcs51_genXRAMCLEAR
                                     12 	.globl __mcs51_genXINIT
                                     13 	.globl __mcs51_genRAMCLEAR
                                     14 	.globl __sdcc_gsinit_startup
                                     15 	.globl _main
                                     16 	.globl _Consumer
                                     17 	.globl _Producer
                                     18 	.globl _ThreadYield
                                     19 	.globl _ThreadCreate
                                     20 	.globl _CY
                                     21 	.globl _AC
                                     22 	.globl _F0
                                     23 	.globl _RS1
                                     24 	.globl _RS0
                                     25 	.globl _OV
                                     26 	.globl _F1
                                     27 	.globl _P
                                     28 	.globl _PS
                                     29 	.globl _PT1
                                     30 	.globl _PX1
                                     31 	.globl _PT0
                                     32 	.globl _PX0
                                     33 	.globl _RD
                                     34 	.globl _WR
                                     35 	.globl _T1
                                     36 	.globl _T0
                                     37 	.globl _INT1
                                     38 	.globl _INT0
                                     39 	.globl _TXD
                                     40 	.globl _RXD
                                     41 	.globl _P3_7
                                     42 	.globl _P3_6
                                     43 	.globl _P3_5
                                     44 	.globl _P3_4
                                     45 	.globl _P3_3
                                     46 	.globl _P3_2
                                     47 	.globl _P3_1
                                     48 	.globl _P3_0
                                     49 	.globl _EA
                                     50 	.globl _ES
                                     51 	.globl _ET1
                                     52 	.globl _EX1
                                     53 	.globl _ET0
                                     54 	.globl _EX0
                                     55 	.globl _P2_7
                                     56 	.globl _P2_6
                                     57 	.globl _P2_5
                                     58 	.globl _P2_4
                                     59 	.globl _P2_3
                                     60 	.globl _P2_2
                                     61 	.globl _P2_1
                                     62 	.globl _P2_0
                                     63 	.globl _SM0
                                     64 	.globl _SM1
                                     65 	.globl _SM2
                                     66 	.globl _REN
                                     67 	.globl _TB8
                                     68 	.globl _RB8
                                     69 	.globl _TI
                                     70 	.globl _RI
                                     71 	.globl _P1_7
                                     72 	.globl _P1_6
                                     73 	.globl _P1_5
                                     74 	.globl _P1_4
                                     75 	.globl _P1_3
                                     76 	.globl _P1_2
                                     77 	.globl _P1_1
                                     78 	.globl _P1_0
                                     79 	.globl _TF1
                                     80 	.globl _TR1
                                     81 	.globl _TF0
                                     82 	.globl _TR0
                                     83 	.globl _IE1
                                     84 	.globl _IT1
                                     85 	.globl _IE0
                                     86 	.globl _IT0
                                     87 	.globl _P0_7
                                     88 	.globl _P0_6
                                     89 	.globl _P0_5
                                     90 	.globl _P0_4
                                     91 	.globl _P0_3
                                     92 	.globl _P0_2
                                     93 	.globl _P0_1
                                     94 	.globl _P0_0
                                     95 	.globl _B
                                     96 	.globl _ACC
                                     97 	.globl _PSW
                                     98 	.globl _IP
                                     99 	.globl _P3
                                    100 	.globl _IE
                                    101 	.globl _P2
                                    102 	.globl _SBUF
                                    103 	.globl _SCON
                                    104 	.globl _P1
                                    105 	.globl _TH1
                                    106 	.globl _TH0
                                    107 	.globl _TL1
                                    108 	.globl _TL0
                                    109 	.globl _TMOD
                                    110 	.globl _TCON
                                    111 	.globl _PCON
                                    112 	.globl _DPH
                                    113 	.globl _DPL
                                    114 	.globl _SP
                                    115 	.globl _P0
                                    116 	.globl _BufferFull
                                    117 	.globl _SharedBuffer
                                    118 ;--------------------------------------------------------
                                    119 ; special function registers
                                    120 ;--------------------------------------------------------
                                    121 	.area RSEG    (ABS,DATA)
      000000                        122 	.org 0x0000
                           000080   123 _P0	=	0x0080
                           000081   124 _SP	=	0x0081
                           000082   125 _DPL	=	0x0082
                           000083   126 _DPH	=	0x0083
                           000087   127 _PCON	=	0x0087
                           000088   128 _TCON	=	0x0088
                           000089   129 _TMOD	=	0x0089
                           00008A   130 _TL0	=	0x008a
                           00008B   131 _TL1	=	0x008b
                           00008C   132 _TH0	=	0x008c
                           00008D   133 _TH1	=	0x008d
                           000090   134 _P1	=	0x0090
                           000098   135 _SCON	=	0x0098
                           000099   136 _SBUF	=	0x0099
                           0000A0   137 _P2	=	0x00a0
                           0000A8   138 _IE	=	0x00a8
                           0000B0   139 _P3	=	0x00b0
                           0000B8   140 _IP	=	0x00b8
                           0000D0   141 _PSW	=	0x00d0
                           0000E0   142 _ACC	=	0x00e0
                           0000F0   143 _B	=	0x00f0
                                    144 ;--------------------------------------------------------
                                    145 ; special function bits
                                    146 ;--------------------------------------------------------
                                    147 	.area RSEG    (ABS,DATA)
      000000                        148 	.org 0x0000
                           000080   149 _P0_0	=	0x0080
                           000081   150 _P0_1	=	0x0081
                           000082   151 _P0_2	=	0x0082
                           000083   152 _P0_3	=	0x0083
                           000084   153 _P0_4	=	0x0084
                           000085   154 _P0_5	=	0x0085
                           000086   155 _P0_6	=	0x0086
                           000087   156 _P0_7	=	0x0087
                           000088   157 _IT0	=	0x0088
                           000089   158 _IE0	=	0x0089
                           00008A   159 _IT1	=	0x008a
                           00008B   160 _IE1	=	0x008b
                           00008C   161 _TR0	=	0x008c
                           00008D   162 _TF0	=	0x008d
                           00008E   163 _TR1	=	0x008e
                           00008F   164 _TF1	=	0x008f
                           000090   165 _P1_0	=	0x0090
                           000091   166 _P1_1	=	0x0091
                           000092   167 _P1_2	=	0x0092
                           000093   168 _P1_3	=	0x0093
                           000094   169 _P1_4	=	0x0094
                           000095   170 _P1_5	=	0x0095
                           000096   171 _P1_6	=	0x0096
                           000097   172 _P1_7	=	0x0097
                           000098   173 _RI	=	0x0098
                           000099   174 _TI	=	0x0099
                           00009A   175 _RB8	=	0x009a
                           00009B   176 _TB8	=	0x009b
                           00009C   177 _REN	=	0x009c
                           00009D   178 _SM2	=	0x009d
                           00009E   179 _SM1	=	0x009e
                           00009F   180 _SM0	=	0x009f
                           0000A0   181 _P2_0	=	0x00a0
                           0000A1   182 _P2_1	=	0x00a1
                           0000A2   183 _P2_2	=	0x00a2
                           0000A3   184 _P2_3	=	0x00a3
                           0000A4   185 _P2_4	=	0x00a4
                           0000A5   186 _P2_5	=	0x00a5
                           0000A6   187 _P2_6	=	0x00a6
                           0000A7   188 _P2_7	=	0x00a7
                           0000A8   189 _EX0	=	0x00a8
                           0000A9   190 _ET0	=	0x00a9
                           0000AA   191 _EX1	=	0x00aa
                           0000AB   192 _ET1	=	0x00ab
                           0000AC   193 _ES	=	0x00ac
                           0000AF   194 _EA	=	0x00af
                           0000B0   195 _P3_0	=	0x00b0
                           0000B1   196 _P3_1	=	0x00b1
                           0000B2   197 _P3_2	=	0x00b2
                           0000B3   198 _P3_3	=	0x00b3
                           0000B4   199 _P3_4	=	0x00b4
                           0000B5   200 _P3_5	=	0x00b5
                           0000B6   201 _P3_6	=	0x00b6
                           0000B7   202 _P3_7	=	0x00b7
                           0000B0   203 _RXD	=	0x00b0
                           0000B1   204 _TXD	=	0x00b1
                           0000B2   205 _INT0	=	0x00b2
                           0000B3   206 _INT1	=	0x00b3
                           0000B4   207 _T0	=	0x00b4
                           0000B5   208 _T1	=	0x00b5
                           0000B6   209 _WR	=	0x00b6
                           0000B7   210 _RD	=	0x00b7
                           0000B8   211 _PX0	=	0x00b8
                           0000B9   212 _PT0	=	0x00b9
                           0000BA   213 _PX1	=	0x00ba
                           0000BB   214 _PT1	=	0x00bb
                           0000BC   215 _PS	=	0x00bc
                           0000D0   216 _P	=	0x00d0
                           0000D1   217 _F1	=	0x00d1
                           0000D2   218 _OV	=	0x00d2
                           0000D3   219 _RS0	=	0x00d3
                           0000D4   220 _RS1	=	0x00d4
                           0000D5   221 _F0	=	0x00d5
                           0000D6   222 _AC	=	0x00d6
                           0000D7   223 _CY	=	0x00d7
                                    224 ;--------------------------------------------------------
                                    225 ; overlayable register banks
                                    226 ;--------------------------------------------------------
                                    227 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        228 	.ds 8
                                    229 ;--------------------------------------------------------
                                    230 ; internal ram data
                                    231 ;--------------------------------------------------------
                                    232 	.area DSEG    (DATA)
                           00003E   233 _SharedBuffer	=	0x003e
                           00003F   234 _BufferFull	=	0x003f
                                    235 ;--------------------------------------------------------
                                    236 ; overlayable items in internal ram 
                                    237 ;--------------------------------------------------------
                                    238 ;--------------------------------------------------------
                                    239 ; Stack segment in internal ram 
                                    240 ;--------------------------------------------------------
                                    241 	.area	SSEG
      000008                        242 __start__stack:
      000008                        243 	.ds	1
                                    244 
                                    245 ;--------------------------------------------------------
                                    246 ; indirectly addressable internal ram data
                                    247 ;--------------------------------------------------------
                                    248 	.area ISEG    (DATA)
                                    249 ;--------------------------------------------------------
                                    250 ; absolute internal ram data
                                    251 ;--------------------------------------------------------
                                    252 	.area IABS    (ABS,DATA)
                                    253 	.area IABS    (ABS,DATA)
                                    254 ;--------------------------------------------------------
                                    255 ; bit data
                                    256 ;--------------------------------------------------------
                                    257 	.area BSEG    (BIT)
                                    258 ;--------------------------------------------------------
                                    259 ; paged external ram data
                                    260 ;--------------------------------------------------------
                                    261 	.area PSEG    (PAG,XDATA)
                                    262 ;--------------------------------------------------------
                                    263 ; external ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area XSEG    (XDATA)
                                    266 ;--------------------------------------------------------
                                    267 ; absolute external ram data
                                    268 ;--------------------------------------------------------
                                    269 	.area XABS    (ABS,XDATA)
                                    270 ;--------------------------------------------------------
                                    271 ; external initialized ram data
                                    272 ;--------------------------------------------------------
                                    273 	.area XISEG   (XDATA)
                                    274 	.area HOME    (CODE)
                                    275 	.area GSINIT0 (CODE)
                                    276 	.area GSINIT1 (CODE)
                                    277 	.area GSINIT2 (CODE)
                                    278 	.area GSINIT3 (CODE)
                                    279 	.area GSINIT4 (CODE)
                                    280 	.area GSINIT5 (CODE)
                                    281 	.area GSINIT  (CODE)
                                    282 	.area GSFINAL (CODE)
                                    283 	.area CSEG    (CODE)
                                    284 ;--------------------------------------------------------
                                    285 ; interrupt vector 
                                    286 ;--------------------------------------------------------
                                    287 	.area HOME    (CODE)
      000000                        288 __interrupt_vect:
      000000 02 00 78         [24]  289 	ljmp	__sdcc_gsinit_startup
                                    290 ;--------------------------------------------------------
                                    291 ; global & static initialisations
                                    292 ;--------------------------------------------------------
                                    293 	.area HOME    (CODE)
                                    294 	.area GSINIT  (CODE)
                                    295 	.area GSFINAL (CODE)
                                    296 	.area GSINIT  (CODE)
                                    297 	.globl __sdcc_gsinit_startup
                                    298 	.globl __sdcc_program_startup
                                    299 	.globl __start__stack
                                    300 	.globl __mcs51_genXINIT
                                    301 	.globl __mcs51_genXRAMCLEAR
                                    302 	.globl __mcs51_genRAMCLEAR
                                    303 	.area GSFINAL (CODE)
      000006 02 00 03         [24]  304 	ljmp	__sdcc_program_startup
                                    305 ;--------------------------------------------------------
                                    306 ; Home
                                    307 ;--------------------------------------------------------
                                    308 	.area HOME    (CODE)
                                    309 	.area HOME    (CODE)
      000003                        310 __sdcc_program_startup:
      000003 02 00 64         [24]  311 	ljmp	_main
                                    312 ;	return from main will return to caller
                                    313 ;--------------------------------------------------------
                                    314 ; code
                                    315 ;--------------------------------------------------------
                                    316 	.area CSEG    (CODE)
                                    317 ;------------------------------------------------------------
                                    318 ;Allocation info for local variables in function 'Producer'
                                    319 ;------------------------------------------------------------
                                    320 ;	testcoop.c:25: void Producer(void) {
                                    321 ;	-----------------------------------------
                                    322 ;	 function Producer
                                    323 ;	-----------------------------------------
      000009                        324 _Producer:
                           000007   325 	ar7 = 0x07
                           000006   326 	ar6 = 0x06
                           000005   327 	ar5 = 0x05
                           000004   328 	ar4 = 0x04
                           000003   329 	ar3 = 0x03
                           000002   330 	ar2 = 0x02
                           000001   331 	ar1 = 0x01
                           000000   332 	ar0 = 0x00
                                    333 ;	testcoop.c:31: SharedBuffer = 'A';
      000009 75 3E 41         [24]  334 	mov	_SharedBuffer,#0x41
                                    335 ;	testcoop.c:32: while (1) {
      00000C                        336 00107$:
                                    337 ;	testcoop.c:36: if(BufferFull==1){
      00000C 74 01            [12]  338 	mov	a,#0x01
      00000E B5 3F 06         [24]  339 	cjne	a,_BufferFull,00123$
      000011 14               [12]  340 	dec	a
      000012 B5 40 02         [24]  341 	cjne	a,(_BufferFull + 1),00123$
      000015 80 02            [24]  342 	sjmp	00124$
      000017                        343 00123$:
      000017 80 05            [24]  344 	sjmp	00104$
      000019                        345 00124$:
                                    346 ;	testcoop.c:37: ThreadYield();
      000019 12 01 7B         [24]  347 	lcall	_ThreadYield
      00001C 80 EE            [24]  348 	sjmp	00107$
      00001E                        349 00104$:
                                    350 ;	testcoop.c:42: if(SharedBuffer >  'Z'){
      00001E E5 3E            [12]  351 	mov	a,_SharedBuffer
      000020 24 A5            [12]  352 	add	a,#0xff - 0x5a
      000022 50 03            [24]  353 	jnc	00102$
                                    354 ;	testcoop.c:43: SharedBuffer = 'A';
      000024 75 3E 41         [24]  355 	mov	_SharedBuffer,#0x41
      000027                        356 00102$:
                                    357 ;	testcoop.c:45: BufferFull = 1;
      000027 75 3F 01         [24]  358 	mov	_BufferFull,#0x01
      00002A 75 40 00         [24]  359 	mov	(_BufferFull + 1),#0x00
                                    360 ;	testcoop.c:46: ThreadYield();
      00002D 12 01 7B         [24]  361 	lcall	_ThreadYield
                                    362 ;	testcoop.c:47: SharedBuffer +=1;
      000030 E5 3E            [12]  363 	mov	a,_SharedBuffer
      000032 FF               [12]  364 	mov	r7,a
      000033 04               [12]  365 	inc	a
      000034 F5 3E            [12]  366 	mov	_SharedBuffer,a
                                    367 ;	testcoop.c:50: }
      000036 80 D4            [24]  368 	sjmp	00107$
                                    369 ;------------------------------------------------------------
                                    370 ;Allocation info for local variables in function 'Consumer'
                                    371 ;------------------------------------------------------------
                                    372 ;	testcoop.c:58: void Consumer(void) {
                                    373 ;	-----------------------------------------
                                    374 ;	 function Consumer
                                    375 ;	-----------------------------------------
      000038                        376 _Consumer:
                                    377 ;	testcoop.c:60: TMOD = 0x20;
      000038 75 89 20         [24]  378 	mov	_TMOD,#0x20
                                    379 ;	testcoop.c:61: TH1 = (char)-6;
      00003B 75 8D FA         [24]  380 	mov	_TH1,#0xfa
                                    381 ;	testcoop.c:62: SCON = 0x50;
      00003E 75 98 50         [24]  382 	mov	_SCON,#0x50
                                    383 ;	testcoop.c:63: TR1 = 1;
                                    384 ;	assignBit
      000041 D2 8E            [12]  385 	setb	_TR1
                                    386 ;	testcoop.c:64: TI = 1;
                                    387 ;	assignBit
      000043 D2 99            [12]  388 	setb	_TI
                                    389 ;	testcoop.c:65: while (1) {
      000045                        390 00107$:
                                    391 ;	testcoop.c:72: if(BufferFull==1){
      000045 74 01            [12]  392 	mov	a,#0x01
      000047 B5 3F 06         [24]  393 	cjne	a,_BufferFull,00123$
      00004A 14               [12]  394 	dec	a
      00004B B5 40 02         [24]  395 	cjne	a,(_BufferFull + 1),00123$
      00004E 80 02            [24]  396 	sjmp	00124$
      000050                        397 00123$:
      000050 80 0D            [24]  398 	sjmp	00105$
      000052                        399 00124$:
                                    400 ;	testcoop.c:74: while(!TI){}
      000052                        401 00101$:
      000052 30 99 FD         [24]  402 	jnb	_TI,00101$
                                    403 ;	testcoop.c:76: SBUF = SharedBuffer;
      000055 85 3E 99         [24]  404 	mov	_SBUF,_SharedBuffer
                                    405 ;	testcoop.c:77: BufferFull = 0;
      000058 E4               [12]  406 	clr	a
      000059 F5 3F            [12]  407 	mov	_BufferFull,a
      00005B F5 40            [12]  408 	mov	(_BufferFull + 1),a
                                    409 ;	testcoop.c:78: TI = 0 ;
                                    410 ;	assignBit
      00005D C2 99            [12]  411 	clr	_TI
      00005F                        412 00105$:
                                    413 ;	testcoop.c:80: ThreadYield();
      00005F 12 01 7B         [24]  414 	lcall	_ThreadYield
                                    415 ;	testcoop.c:82: }
      000062 80 E1            [24]  416 	sjmp	00107$
                                    417 ;------------------------------------------------------------
                                    418 ;Allocation info for local variables in function 'main'
                                    419 ;------------------------------------------------------------
                                    420 ;	testcoop.c:89: void main(void) {
                                    421 ;	-----------------------------------------
                                    422 ;	 function main
                                    423 ;	-----------------------------------------
      000064                        424 _main:
                                    425 ;	testcoop.c:97: SharedBuffer = ' ';
      000064 75 3E 20         [24]  426 	mov	_SharedBuffer,#0x20
                                    427 ;	testcoop.c:98: BufferFull = 0 ;
      000067 E4               [12]  428 	clr	a
      000068 F5 3F            [12]  429 	mov	_BufferFull,a
      00006A F5 40            [12]  430 	mov	(_BufferFull + 1),a
                                    431 ;	testcoop.c:99: ThreadCreate(Producer);
      00006C 90 00 09         [24]  432 	mov	dptr,#_Producer
      00006F 12 00 BF         [24]  433 	lcall	_ThreadCreate
                                    434 ;	testcoop.c:102: __endasm;
      000072 85 34 81         [24]  435 	MOV	SP,0x34
                                    436 ;	testcoop.c:103: Consumer();         
                                    437 ;	testcoop.c:104: }
      000075 02 00 38         [24]  438 	ljmp	_Consumer
                                    439 ;------------------------------------------------------------
                                    440 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    441 ;------------------------------------------------------------
                                    442 ;	testcoop.c:106: void _sdcc_gsinit_startup(void) {
                                    443 ;	-----------------------------------------
                                    444 ;	 function _sdcc_gsinit_startup
                                    445 ;	-----------------------------------------
      000078                        446 __sdcc_gsinit_startup:
                                    447 ;	testcoop.c:109: __endasm;
      000078 02 00 7F         [24]  448 	ljmp	_Bootstrap
                                    449 ;	testcoop.c:110: }
      00007B 22               [24]  450 	ret
                                    451 ;------------------------------------------------------------
                                    452 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    453 ;------------------------------------------------------------
                                    454 ;	testcoop.c:112: void _mcs51_genRAMCLEAR(void) {}
                                    455 ;	-----------------------------------------
                                    456 ;	 function _mcs51_genRAMCLEAR
                                    457 ;	-----------------------------------------
      00007C                        458 __mcs51_genRAMCLEAR:
      00007C 22               [24]  459 	ret
                                    460 ;------------------------------------------------------------
                                    461 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    462 ;------------------------------------------------------------
                                    463 ;	testcoop.c:113: void _mcs51_genXINIT(void) {}
                                    464 ;	-----------------------------------------
                                    465 ;	 function _mcs51_genXINIT
                                    466 ;	-----------------------------------------
      00007D                        467 __mcs51_genXINIT:
      00007D 22               [24]  468 	ret
                                    469 ;------------------------------------------------------------
                                    470 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    471 ;------------------------------------------------------------
                                    472 ;	testcoop.c:114: void _mcs51_genXRAMCLEAR(void) {}
                                    473 ;	-----------------------------------------
                                    474 ;	 function _mcs51_genXRAMCLEAR
                                    475 ;	-----------------------------------------
      00007E                        476 __mcs51_genXRAMCLEAR:
      00007E 22               [24]  477 	ret
                                    478 	.area CSEG    (CODE)
                                    479 	.area CONST   (CODE)
                                    480 	.area XINIT   (CODE)
                                    481 	.area CABS    (ABS,CODE)
