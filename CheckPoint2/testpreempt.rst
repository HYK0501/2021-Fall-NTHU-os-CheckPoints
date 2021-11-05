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
                                     11 	.globl _timer0_ISR
                                     12 	.globl __mcs51_genXRAMCLEAR
                                     13 	.globl __mcs51_genXINIT
                                     14 	.globl __mcs51_genRAMCLEAR
                                     15 	.globl __sdcc_gsinit_startup
                                     16 	.globl _main
                                     17 	.globl _Consumer
                                     18 	.globl _Producer
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
      000000 02 00 76         [24]  289 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  290 	reti
      000004                        291 	.ds	7
      00000B 02 00 7D         [24]  292 	ljmp	_timer0_ISR
                                    293 ;--------------------------------------------------------
                                    294 ; global & static initialisations
                                    295 ;--------------------------------------------------------
                                    296 	.area HOME    (CODE)
                                    297 	.area GSINIT  (CODE)
                                    298 	.area GSFINAL (CODE)
                                    299 	.area GSINIT  (CODE)
                                    300 	.globl __sdcc_gsinit_startup
                                    301 	.globl __sdcc_program_startup
                                    302 	.globl __start__stack
                                    303 	.globl __mcs51_genXINIT
                                    304 	.globl __mcs51_genXRAMCLEAR
                                    305 	.globl __mcs51_genRAMCLEAR
                                    306 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  307 	ljmp	__sdcc_program_startup
                                    308 ;--------------------------------------------------------
                                    309 ; Home
                                    310 ;--------------------------------------------------------
                                    311 	.area HOME    (CODE)
                                    312 	.area HOME    (CODE)
      00000E                        313 __sdcc_program_startup:
      00000E 02 00 62         [24]  314 	ljmp	_main
                                    315 ;	return from main will return to caller
                                    316 ;--------------------------------------------------------
                                    317 ; code
                                    318 ;--------------------------------------------------------
                                    319 	.area CSEG    (CODE)
                                    320 ;------------------------------------------------------------
                                    321 ;Allocation info for local variables in function 'Producer'
                                    322 ;------------------------------------------------------------
                                    323 ;	testpreempt.c:25: void Producer(void) {
                                    324 ;	-----------------------------------------
                                    325 ;	 function Producer
                                    326 ;	-----------------------------------------
      000014                        327 _Producer:
                           000007   328 	ar7 = 0x07
                           000006   329 	ar6 = 0x06
                           000005   330 	ar5 = 0x05
                           000004   331 	ar4 = 0x04
                           000003   332 	ar3 = 0x03
                           000002   333 	ar2 = 0x02
                           000001   334 	ar1 = 0x01
                           000000   335 	ar0 = 0x00
                                    336 ;	testpreempt.c:33: __endasm;
      000014 75 3E 40         [24]  337 	MOV	0X3E,#0X40
                                    338 ;	testpreempt.c:34: while (1) {
      000017                        339 00107$:
                                    340 ;	testpreempt.c:38: if(BufferFull==1){
      000017 74 01            [12]  341 	mov	a,#0x01
      000019 B5 3F 06         [24]  342 	cjne	a,_BufferFull,00123$
      00001C 14               [12]  343 	dec	a
      00001D B5 40 02         [24]  344 	cjne	a,(_BufferFull + 1),00123$
      000020 80 F5            [24]  345 	sjmp	00107$
      000022                        346 00123$:
                                    347 ;	testpreempt.c:41: SharedBuffer +=1;
      000022 E5 3E            [12]  348 	mov	a,_SharedBuffer
      000024 FF               [12]  349 	mov	r7,a
      000025 04               [12]  350 	inc	a
      000026 F5 3E            [12]  351 	mov	_SharedBuffer,a
                                    352 ;	testpreempt.c:42: if(SharedBuffer >  'Z'){
      000028 E5 3E            [12]  353 	mov	a,_SharedBuffer
      00002A 24 A5            [12]  354 	add	a,#0xff - 0x5a
      00002C 50 03            [24]  355 	jnc	00102$
                                    356 ;	testpreempt.c:43: SharedBuffer = 'A';
      00002E 75 3E 41         [24]  357 	mov	_SharedBuffer,#0x41
      000031                        358 00102$:
                                    359 ;	testpreempt.c:45: BufferFull = 1;
      000031 75 3F 01         [24]  360 	mov	_BufferFull,#0x01
      000034 75 40 00         [24]  361 	mov	(_BufferFull + 1),#0x00
                                    362 ;	testpreempt.c:49: }
      000037 80 DE            [24]  363 	sjmp	00107$
                                    364 ;------------------------------------------------------------
                                    365 ;Allocation info for local variables in function 'Consumer'
                                    366 ;------------------------------------------------------------
                                    367 ;	testpreempt.c:57: void Consumer(void) {
                                    368 ;	-----------------------------------------
                                    369 ;	 function Consumer
                                    370 ;	-----------------------------------------
      000039                        371 _Consumer:
                                    372 ;	testpreempt.c:61: __endasm;
      000039 43 89 20         [24]  373 	ORL	0X89 , #0X20
                                    374 ;	testpreempt.c:62: TH1 = (char)-6;
      00003C 75 8D FA         [24]  375 	mov	_TH1,#0xfa
                                    376 ;	testpreempt.c:63: SCON = 0x50;
      00003F 75 98 50         [24]  377 	mov	_SCON,#0x50
                                    378 ;	testpreempt.c:64: TR1 = 1;
                                    379 ;	assignBit
      000042 D2 8E            [12]  380 	setb	_TR1
                                    381 ;	testpreempt.c:65: TI = 1;
                                    382 ;	assignBit
      000044 D2 99            [12]  383 	setb	_TI
                                    384 ;	testpreempt.c:66: while (1) {
      000046                        385 00107$:
                                    386 ;	testpreempt.c:73: if(BufferFull==1){
      000046 74 01            [12]  387 	mov	a,#0x01
      000048 B5 3F 06         [24]  388 	cjne	a,_BufferFull,00123$
      00004B 14               [12]  389 	dec	a
      00004C B5 40 02         [24]  390 	cjne	a,(_BufferFull + 1),00123$
      00004F 80 02            [24]  391 	sjmp	00124$
      000051                        392 00123$:
      000051 80 F3            [24]  393 	sjmp	00107$
      000053                        394 00124$:
                                    395 ;	testpreempt.c:75: while(!TI){}
      000053                        396 00101$:
      000053 30 99 FD         [24]  397 	jnb	_TI,00101$
                                    398 ;	testpreempt.c:77: SBUF = SharedBuffer;
      000056 85 3E 99         [24]  399 	mov	_SBUF,_SharedBuffer
                                    400 ;	testpreempt.c:78: BufferFull = 0;
      000059 E4               [12]  401 	clr	a
      00005A F5 3F            [12]  402 	mov	_BufferFull,a
      00005C F5 40            [12]  403 	mov	(_BufferFull + 1),a
                                    404 ;	testpreempt.c:79: TI = 0 ;
                                    405 ;	assignBit
      00005E C2 99            [12]  406 	clr	_TI
                                    407 ;	testpreempt.c:82: }
      000060 80 E4            [24]  408 	sjmp	00107$
                                    409 ;------------------------------------------------------------
                                    410 ;Allocation info for local variables in function 'main'
                                    411 ;------------------------------------------------------------
                                    412 ;	testpreempt.c:89: void main(void) {
                                    413 ;	-----------------------------------------
                                    414 ;	 function main
                                    415 ;	-----------------------------------------
      000062                        416 _main:
                                    417 ;	testpreempt.c:97: SharedBuffer = ' ';
      000062 75 3E 20         [24]  418 	mov	_SharedBuffer,#0x20
                                    419 ;	testpreempt.c:98: BufferFull = 0 ;
      000065 E4               [12]  420 	clr	a
      000066 F5 3F            [12]  421 	mov	_BufferFull,a
      000068 F5 40            [12]  422 	mov	(_BufferFull + 1),a
                                    423 ;	testpreempt.c:99: ThreadCreate(Producer);
      00006A 90 00 14         [24]  424 	mov	dptr,#_Producer
      00006D 12 00 C9         [24]  425 	lcall	_ThreadCreate
                                    426 ;	testpreempt.c:102: __endasm;
      000070 85 34 81         [24]  427 	MOV	SP,0x34
                                    428 ;	testpreempt.c:103: Consumer();         
                                    429 ;	testpreempt.c:104: }
      000073 02 00 39         [24]  430 	ljmp	_Consumer
                                    431 ;------------------------------------------------------------
                                    432 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    433 ;------------------------------------------------------------
                                    434 ;	testpreempt.c:106: void _sdcc_gsinit_startup(void) {
                                    435 ;	-----------------------------------------
                                    436 ;	 function _sdcc_gsinit_startup
                                    437 ;	-----------------------------------------
      000076                        438 __sdcc_gsinit_startup:
                                    439 ;	testpreempt.c:109: __endasm;
      000076 02 00 81         [24]  440 	ljmp	_Bootstrap
                                    441 ;	testpreempt.c:110: }
      000079 22               [24]  442 	ret
                                    443 ;------------------------------------------------------------
                                    444 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    445 ;------------------------------------------------------------
                                    446 ;	testpreempt.c:112: void _mcs51_genRAMCLEAR(void) {}
                                    447 ;	-----------------------------------------
                                    448 ;	 function _mcs51_genRAMCLEAR
                                    449 ;	-----------------------------------------
      00007A                        450 __mcs51_genRAMCLEAR:
      00007A 22               [24]  451 	ret
                                    452 ;------------------------------------------------------------
                                    453 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    454 ;------------------------------------------------------------
                                    455 ;	testpreempt.c:113: void _mcs51_genXINIT(void) {}
                                    456 ;	-----------------------------------------
                                    457 ;	 function _mcs51_genXINIT
                                    458 ;	-----------------------------------------
      00007B                        459 __mcs51_genXINIT:
      00007B 22               [24]  460 	ret
                                    461 ;------------------------------------------------------------
                                    462 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    463 ;------------------------------------------------------------
                                    464 ;	testpreempt.c:114: void _mcs51_genXRAMCLEAR(void) {}
                                    465 ;	-----------------------------------------
                                    466 ;	 function _mcs51_genXRAMCLEAR
                                    467 ;	-----------------------------------------
      00007C                        468 __mcs51_genXRAMCLEAR:
      00007C 22               [24]  469 	ret
                                    470 ;------------------------------------------------------------
                                    471 ;Allocation info for local variables in function 'timer0_ISR'
                                    472 ;------------------------------------------------------------
                                    473 ;	testpreempt.c:115: void timer0_ISR(void) __interrupt(1) {
                                    474 ;	-----------------------------------------
                                    475 ;	 function timer0_ISR
                                    476 ;	-----------------------------------------
      00007D                        477 _timer0_ISR:
                                    478 ;	testpreempt.c:118: __endasm;
      00007D 02 01 89         [24]  479 	ljmp	_myTimer0Handler
                                    480 ;	testpreempt.c:119: }
      000080 32               [24]  481 	reti
                                    482 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    483 ;	eliminated unneeded push/pop psw
                                    484 ;	eliminated unneeded push/pop dpl
                                    485 ;	eliminated unneeded push/pop dph
                                    486 ;	eliminated unneeded push/pop b
                                    487 ;	eliminated unneeded push/pop acc
                                    488 	.area CSEG    (CODE)
                                    489 	.area CONST   (CODE)
                                    490 	.area XINIT   (CODE)
                                    491 	.area CABS    (ABS,CODE)
