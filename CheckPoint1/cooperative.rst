                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module cooperative
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Bootstrap
                                     12 	.globl _main
                                     13 	.globl _CY
                                     14 	.globl _AC
                                     15 	.globl _F0
                                     16 	.globl _RS1
                                     17 	.globl _RS0
                                     18 	.globl _OV
                                     19 	.globl _F1
                                     20 	.globl _P
                                     21 	.globl _PS
                                     22 	.globl _PT1
                                     23 	.globl _PX1
                                     24 	.globl _PT0
                                     25 	.globl _PX0
                                     26 	.globl _RD
                                     27 	.globl _WR
                                     28 	.globl _T1
                                     29 	.globl _T0
                                     30 	.globl _INT1
                                     31 	.globl _INT0
                                     32 	.globl _TXD
                                     33 	.globl _RXD
                                     34 	.globl _P3_7
                                     35 	.globl _P3_6
                                     36 	.globl _P3_5
                                     37 	.globl _P3_4
                                     38 	.globl _P3_3
                                     39 	.globl _P3_2
                                     40 	.globl _P3_1
                                     41 	.globl _P3_0
                                     42 	.globl _EA
                                     43 	.globl _ES
                                     44 	.globl _ET1
                                     45 	.globl _EX1
                                     46 	.globl _ET0
                                     47 	.globl _EX0
                                     48 	.globl _P2_7
                                     49 	.globl _P2_6
                                     50 	.globl _P2_5
                                     51 	.globl _P2_4
                                     52 	.globl _P2_3
                                     53 	.globl _P2_2
                                     54 	.globl _P2_1
                                     55 	.globl _P2_0
                                     56 	.globl _SM0
                                     57 	.globl _SM1
                                     58 	.globl _SM2
                                     59 	.globl _REN
                                     60 	.globl _TB8
                                     61 	.globl _RB8
                                     62 	.globl _TI
                                     63 	.globl _RI
                                     64 	.globl _P1_7
                                     65 	.globl _P1_6
                                     66 	.globl _P1_5
                                     67 	.globl _P1_4
                                     68 	.globl _P1_3
                                     69 	.globl _P1_2
                                     70 	.globl _P1_1
                                     71 	.globl _P1_0
                                     72 	.globl _TF1
                                     73 	.globl _TR1
                                     74 	.globl _TF0
                                     75 	.globl _TR0
                                     76 	.globl _IE1
                                     77 	.globl _IT1
                                     78 	.globl _IE0
                                     79 	.globl _IT0
                                     80 	.globl _P0_7
                                     81 	.globl _P0_6
                                     82 	.globl _P0_5
                                     83 	.globl _P0_4
                                     84 	.globl _P0_3
                                     85 	.globl _P0_2
                                     86 	.globl _P0_1
                                     87 	.globl _P0_0
                                     88 	.globl _B
                                     89 	.globl _ACC
                                     90 	.globl _PSW
                                     91 	.globl _IP
                                     92 	.globl _P3
                                     93 	.globl _IE
                                     94 	.globl _P2
                                     95 	.globl _SBUF
                                     96 	.globl _SCON
                                     97 	.globl _P1
                                     98 	.globl _TH1
                                     99 	.globl _TH0
                                    100 	.globl _TL1
                                    101 	.globl _TL0
                                    102 	.globl _TMOD
                                    103 	.globl _TCON
                                    104 	.globl _PCON
                                    105 	.globl _DPH
                                    106 	.globl _DPL
                                    107 	.globl _SP
                                    108 	.globl _P0
                                    109 	.globl _TempSP
                                    110 	.globl _Thread3SP
                                    111 	.globl _Thread2SP
                                    112 	.globl _Thread1SP
                                    113 	.globl _Thread0SP
                                    114 	.globl _bitmap
                                    115 	.globl _currentThreadId
                                    116 	.globl _createdThreadId
                                    117 	.globl _ThreadCreate
                                    118 	.globl _ThreadYield
                                    119 	.globl _ThreadExit
                                    120 ;--------------------------------------------------------
                                    121 ; special function registers
                                    122 ;--------------------------------------------------------
                                    123 	.area RSEG    (ABS,DATA)
      000000                        124 	.org 0x0000
                           000080   125 _P0	=	0x0080
                           000081   126 _SP	=	0x0081
                           000082   127 _DPL	=	0x0082
                           000083   128 _DPH	=	0x0083
                           000087   129 _PCON	=	0x0087
                           000088   130 _TCON	=	0x0088
                           000089   131 _TMOD	=	0x0089
                           00008A   132 _TL0	=	0x008a
                           00008B   133 _TL1	=	0x008b
                           00008C   134 _TH0	=	0x008c
                           00008D   135 _TH1	=	0x008d
                           000090   136 _P1	=	0x0090
                           000098   137 _SCON	=	0x0098
                           000099   138 _SBUF	=	0x0099
                           0000A0   139 _P2	=	0x00a0
                           0000A8   140 _IE	=	0x00a8
                           0000B0   141 _P3	=	0x00b0
                           0000B8   142 _IP	=	0x00b8
                           0000D0   143 _PSW	=	0x00d0
                           0000E0   144 _ACC	=	0x00e0
                           0000F0   145 _B	=	0x00f0
                                    146 ;--------------------------------------------------------
                                    147 ; special function bits
                                    148 ;--------------------------------------------------------
                                    149 	.area RSEG    (ABS,DATA)
      000000                        150 	.org 0x0000
                           000080   151 _P0_0	=	0x0080
                           000081   152 _P0_1	=	0x0081
                           000082   153 _P0_2	=	0x0082
                           000083   154 _P0_3	=	0x0083
                           000084   155 _P0_4	=	0x0084
                           000085   156 _P0_5	=	0x0085
                           000086   157 _P0_6	=	0x0086
                           000087   158 _P0_7	=	0x0087
                           000088   159 _IT0	=	0x0088
                           000089   160 _IE0	=	0x0089
                           00008A   161 _IT1	=	0x008a
                           00008B   162 _IE1	=	0x008b
                           00008C   163 _TR0	=	0x008c
                           00008D   164 _TF0	=	0x008d
                           00008E   165 _TR1	=	0x008e
                           00008F   166 _TF1	=	0x008f
                           000090   167 _P1_0	=	0x0090
                           000091   168 _P1_1	=	0x0091
                           000092   169 _P1_2	=	0x0092
                           000093   170 _P1_3	=	0x0093
                           000094   171 _P1_4	=	0x0094
                           000095   172 _P1_5	=	0x0095
                           000096   173 _P1_6	=	0x0096
                           000097   174 _P1_7	=	0x0097
                           000098   175 _RI	=	0x0098
                           000099   176 _TI	=	0x0099
                           00009A   177 _RB8	=	0x009a
                           00009B   178 _TB8	=	0x009b
                           00009C   179 _REN	=	0x009c
                           00009D   180 _SM2	=	0x009d
                           00009E   181 _SM1	=	0x009e
                           00009F   182 _SM0	=	0x009f
                           0000A0   183 _P2_0	=	0x00a0
                           0000A1   184 _P2_1	=	0x00a1
                           0000A2   185 _P2_2	=	0x00a2
                           0000A3   186 _P2_3	=	0x00a3
                           0000A4   187 _P2_4	=	0x00a4
                           0000A5   188 _P2_5	=	0x00a5
                           0000A6   189 _P2_6	=	0x00a6
                           0000A7   190 _P2_7	=	0x00a7
                           0000A8   191 _EX0	=	0x00a8
                           0000A9   192 _ET0	=	0x00a9
                           0000AA   193 _EX1	=	0x00aa
                           0000AB   194 _ET1	=	0x00ab
                           0000AC   195 _ES	=	0x00ac
                           0000AF   196 _EA	=	0x00af
                           0000B0   197 _P3_0	=	0x00b0
                           0000B1   198 _P3_1	=	0x00b1
                           0000B2   199 _P3_2	=	0x00b2
                           0000B3   200 _P3_3	=	0x00b3
                           0000B4   201 _P3_4	=	0x00b4
                           0000B5   202 _P3_5	=	0x00b5
                           0000B6   203 _P3_6	=	0x00b6
                           0000B7   204 _P3_7	=	0x00b7
                           0000B0   205 _RXD	=	0x00b0
                           0000B1   206 _TXD	=	0x00b1
                           0000B2   207 _INT0	=	0x00b2
                           0000B3   208 _INT1	=	0x00b3
                           0000B4   209 _T0	=	0x00b4
                           0000B5   210 _T1	=	0x00b5
                           0000B6   211 _WR	=	0x00b6
                           0000B7   212 _RD	=	0x00b7
                           0000B8   213 _PX0	=	0x00b8
                           0000B9   214 _PT0	=	0x00b9
                           0000BA   215 _PX1	=	0x00ba
                           0000BB   216 _PT1	=	0x00bb
                           0000BC   217 _PS	=	0x00bc
                           0000D0   218 _P	=	0x00d0
                           0000D1   219 _F1	=	0x00d1
                           0000D2   220 _OV	=	0x00d2
                           0000D3   221 _RS0	=	0x00d3
                           0000D4   222 _RS1	=	0x00d4
                           0000D5   223 _F0	=	0x00d5
                           0000D6   224 _AC	=	0x00d6
                           0000D7   225 _CY	=	0x00d7
                                    226 ;--------------------------------------------------------
                                    227 ; overlayable register banks
                                    228 ;--------------------------------------------------------
                                    229 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        230 	.ds 8
                                    231 ;--------------------------------------------------------
                                    232 ; internal ram data
                                    233 ;--------------------------------------------------------
                                    234 	.area DSEG    (DATA)
                           000030   235 _createdThreadId	=	0x0030
                           000031   236 _currentThreadId	=	0x0031
                           000033   237 _bitmap	=	0x0033
                           000034   238 _Thread0SP	=	0x0034
                           000035   239 _Thread1SP	=	0x0035
                           000036   240 _Thread2SP	=	0x0036
                           000037   241 _Thread3SP	=	0x0037
                           000038   242 _TempSP	=	0x0038
                                    243 ;--------------------------------------------------------
                                    244 ; overlayable items in internal ram 
                                    245 ;--------------------------------------------------------
                                    246 	.area	OSEG    (OVR,DATA)
                                    247 ;--------------------------------------------------------
                                    248 ; indirectly addressable internal ram data
                                    249 ;--------------------------------------------------------
                                    250 	.area ISEG    (DATA)
                                    251 ;--------------------------------------------------------
                                    252 ; absolute internal ram data
                                    253 ;--------------------------------------------------------
                                    254 	.area IABS    (ABS,DATA)
                                    255 	.area IABS    (ABS,DATA)
                                    256 ;--------------------------------------------------------
                                    257 ; bit data
                                    258 ;--------------------------------------------------------
                                    259 	.area BSEG    (BIT)
                                    260 ;--------------------------------------------------------
                                    261 ; paged external ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area PSEG    (PAG,XDATA)
                                    264 ;--------------------------------------------------------
                                    265 ; external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area XSEG    (XDATA)
                                    268 ;--------------------------------------------------------
                                    269 ; absolute external ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area XABS    (ABS,XDATA)
                                    272 ;--------------------------------------------------------
                                    273 ; external initialized ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area XISEG   (XDATA)
                                    276 	.area HOME    (CODE)
                                    277 	.area GSINIT0 (CODE)
                                    278 	.area GSINIT1 (CODE)
                                    279 	.area GSINIT2 (CODE)
                                    280 	.area GSINIT3 (CODE)
                                    281 	.area GSINIT4 (CODE)
                                    282 	.area GSINIT5 (CODE)
                                    283 	.area GSINIT  (CODE)
                                    284 	.area GSFINAL (CODE)
                                    285 	.area CSEG    (CODE)
                                    286 ;--------------------------------------------------------
                                    287 ; global & static initialisations
                                    288 ;--------------------------------------------------------
                                    289 	.area HOME    (CODE)
                                    290 	.area GSINIT  (CODE)
                                    291 	.area GSFINAL (CODE)
                                    292 	.area GSINIT  (CODE)
                                    293 ;--------------------------------------------------------
                                    294 ; Home
                                    295 ;--------------------------------------------------------
                                    296 	.area HOME    (CODE)
                                    297 	.area HOME    (CODE)
                                    298 ;--------------------------------------------------------
                                    299 ; code
                                    300 ;--------------------------------------------------------
                                    301 	.area CSEG    (CODE)
                                    302 ;------------------------------------------------------------
                                    303 ;Allocation info for local variables in function 'Bootstrap'
                                    304 ;------------------------------------------------------------
                                    305 ;	cooperative.c:125: void Bootstrap(void) {
                                    306 ;	-----------------------------------------
                                    307 ;	 function Bootstrap
                                    308 ;	-----------------------------------------
      00007E                        309 _Bootstrap:
                           000007   310 	ar7 = 0x07
                           000006   311 	ar6 = 0x06
                           000005   312 	ar5 = 0x05
                           000004   313 	ar4 = 0x04
                           000003   314 	ar3 = 0x03
                           000002   315 	ar2 = 0x02
                           000001   316 	ar1 = 0x01
                           000000   317 	ar0 = 0x00
                                    318 ;	cooperative.c:138: bitmap = 0x00;
      00007E E4               [12]  319 	clr	a
      00007F F5 33            [12]  320 	mov	_bitmap,a
      000081 F5 34            [12]  321 	mov	(_bitmap + 1),a
                                    322 ;	cooperative.c:139: currentThreadId = ThreadCreate(main);
      000083 90 00 63         [24]  323 	mov	dptr,#_main
      000086 12 00 BE         [24]  324 	lcall	_ThreadCreate
      000089 85 82 31         [24]  325 	mov	_currentThreadId,dpl
                                    326 ;	cooperative.c:140: RESTORESTATE;
      00008C E5 31            [12]  327 	mov	a,_currentThreadId
      00008E FF               [12]  328 	mov	r7,a
      00008F 24 FC            [12]  329 	add	a,#0xff - 0x03
      000091 40 20            [24]  330 	jc	00106$
      000093 EF               [12]  331 	mov	a,r7
      000094 2F               [12]  332 	add	a,r7
      000095 90 00 99         [24]  333 	mov	dptr,#00114$
      000098 73               [24]  334 	jmp	@a+dptr
      000099                        335 00114$:
      000099 80 06            [24]  336 	sjmp	00101$
      00009B 80 09            [24]  337 	sjmp	00102$
      00009D 80 0C            [24]  338 	sjmp	00103$
      00009F 80 0F            [24]  339 	sjmp	00104$
      0000A1                        340 00101$:
      0000A1 85 34 81         [24]  341 	MOV SP, 0x34 
      0000A4 80 0D            [24]  342 	sjmp	00106$
      0000A6                        343 00102$:
      0000A6 85 35 81         [24]  344 	MOV SP, 0x35 
      0000A9 80 08            [24]  345 	sjmp	00106$
      0000AB                        346 00103$:
      0000AB 85 36 81         [24]  347 	MOV SP, 0x36 
      0000AE 80 03            [24]  348 	sjmp	00106$
      0000B0                        349 00104$:
      0000B0 85 37 81         [24]  350 	MOV SP, 0x37 
      0000B3                        351 00106$:
      0000B3 D0 D0            [24]  352 	POP PSW 
      0000B5 D0 83            [24]  353 	POP DPH 
      0000B7 D0 82            [24]  354 	POP DPL 
      0000B9 D0 F0            [24]  355 	POP B 
      0000BB D0 E0            [24]  356 	POP ACC 
                                    357 ;	cooperative.c:141: }
      0000BD 22               [24]  358 	ret
                                    359 ;------------------------------------------------------------
                                    360 ;Allocation info for local variables in function 'ThreadCreate'
                                    361 ;------------------------------------------------------------
                                    362 ;fp                        Allocated to registers 
                                    363 ;------------------------------------------------------------
                                    364 ;	cooperative.c:149: ThreadId ThreadCreate(FunctionPtr fp) {
                                    365 ;	-----------------------------------------
                                    366 ;	 function ThreadCreate
                                    367 ;	-----------------------------------------
      0000BE                        368 _ThreadCreate:
                                    369 ;	cooperative.c:194: if((bitmap & 0xFF)==0xFF){
      0000BE AE 33            [24]  370 	mov	r6,_bitmap
      0000C0 E5 34            [12]  371 	mov	a,(_bitmap + 1)
      0000C2 7F 00            [12]  372 	mov	r7,#0x00
      0000C4 BE FF 07         [24]  373 	cjne	r6,#0xff,00102$
      0000C7 BF 00 04         [24]  374 	cjne	r7,#0x00,00102$
                                    375 ;	cooperative.c:195: return -1;
      0000CA 75 82 FF         [24]  376 	mov	dpl,#0xff
      0000CD 22               [24]  377 	ret
      0000CE                        378 00102$:
                                    379 ;	cooperative.c:197: TempSP = SP; 
      0000CE 85 81 38         [24]  380 	mov	_TempSP,_SP
      0000D1 75 39 00         [24]  381 	mov	(_TempSP + 1),#0x00
                                    382 ;	cooperative.c:198: if((bitmap & 0x01) == 0x00){
      0000D4 E5 33            [12]  383 	mov	a,_bitmap
      0000D6 20 E0 0E         [24]  384 	jb	acc.0,00112$
                                    385 ;	cooperative.c:202: __endasm;
      0000D9 75 34 3F         [24]  386 	MOV	0x34 , #0x3F
      0000DC 43 33 01         [24]  387 	ORL	0X33 ,#0X01
                                    388 ;	cooperative.c:203: createdThreadId = 0;
      0000DF 75 30 00         [24]  389 	mov	_createdThreadId,#0x00
                                    390 ;	cooperative.c:204: SP = Thread0SP;
      0000E2 85 34 81         [24]  391 	mov	_SP,_Thread0SP
      0000E5 80 37            [24]  392 	sjmp	00113$
      0000E7                        393 00112$:
                                    394 ;	cooperative.c:206: else if((bitmap & 0x02) ==0x00){
      0000E7 E5 33            [12]  395 	mov	a,_bitmap
      0000E9 20 E1 0E         [24]  396 	jb	acc.1,00109$
                                    397 ;	cooperative.c:210: __endasm;
      0000EC 75 35 4F         [24]  398 	MOV	0x35 , #0x4F
      0000EF 43 33 02         [24]  399 	ORL	0X33 ,#0X02
                                    400 ;	cooperative.c:211: createdThreadId = 1;
      0000F2 75 30 01         [24]  401 	mov	_createdThreadId,#0x01
                                    402 ;	cooperative.c:212: SP = Thread1SP;
      0000F5 85 35 81         [24]  403 	mov	_SP,_Thread1SP
      0000F8 80 24            [24]  404 	sjmp	00113$
      0000FA                        405 00109$:
                                    406 ;	cooperative.c:214: else if((bitmap & 0x04) ==0x00){
      0000FA E5 33            [12]  407 	mov	a,_bitmap
      0000FC 20 E2 0E         [24]  408 	jb	acc.2,00106$
                                    409 ;	cooperative.c:218: __endasm;
      0000FF 75 36 5F         [24]  410 	MOV	0x36 , #0x5F
      000102 43 33 04         [24]  411 	ORL	0X33 ,#0X04
                                    412 ;	cooperative.c:219: createdThreadId = 2;
      000105 75 30 02         [24]  413 	mov	_createdThreadId,#0x02
                                    414 ;	cooperative.c:220: SP = Thread2SP;
      000108 85 36 81         [24]  415 	mov	_SP,_Thread2SP
      00010B 80 11            [24]  416 	sjmp	00113$
      00010D                        417 00106$:
                                    418 ;	cooperative.c:222: else if((bitmap & 0x08) ==0x00){
      00010D E5 33            [12]  419 	mov	a,_bitmap
      00010F 20 E3 0C         [24]  420 	jb	acc.3,00113$
                                    421 ;	cooperative.c:226: __endasm;
      000112 75 37 6F         [24]  422 	MOV	0x37 , #0x6F
      000115 43 33 08         [24]  423 	ORL	0X33 ,#0X08
                                    424 ;	cooperative.c:227: createdThreadId = 3;
      000118 75 30 03         [24]  425 	mov	_createdThreadId,#0x03
                                    426 ;	cooperative.c:228: SP = Thread3SP ;
      00011B 85 37 81         [24]  427 	mov	_SP,_Thread3SP
      00011E                        428 00113$:
                                    429 ;	cooperative.c:238: __endasm;
      00011E C0 82            [24]  430 	PUSH	DPL
      000120 C0 83            [24]  431 	PUSH	DPH
      000122 E5 00            [12]  432 	MOV	A , 0X00
      000124 C0 E0            [24]  433 	PUSH	ACC
      000126 C0 E0            [24]  434 	PUSH	ACC
      000128 C0 E0            [24]  435 	PUSH	ACC
      00012A C0 E0            [24]  436 	PUSH	ACC
                                    437 ;	cooperative.c:239: switch(createdThreadId ){
      00012C E5 30            [12]  438 	mov	a,_createdThreadId
      00012E FF               [12]  439 	mov	r7,a
      00012F 24 FC            [12]  440 	add	a,#0xff - 0x03
      000131 40 40            [24]  441 	jc	00119$
      000133 EF               [12]  442 	mov	a,r7
      000134 2F               [12]  443 	add	a,r7
                                    444 ;	cooperative.c:240: case 0:
      000135 90 01 39         [24]  445 	mov	dptr,#00153$
      000138 73               [24]  446 	jmp	@a+dptr
      000139                        447 00153$:
      000139 80 06            [24]  448 	sjmp	00114$
      00013B 80 11            [24]  449 	sjmp	00115$
      00013D 80 1C            [24]  450 	sjmp	00116$
      00013F 80 27            [24]  451 	sjmp	00117$
      000141                        452 00114$:
                                    453 ;	cooperative.c:244: __endasm;
      000141 75 D0 00         [24]  454 	MOV	PSW ,#0X00
      000144 C0 D0            [24]  455 	PUSH	PSW
                                    456 ;	cooperative.c:245: Thread0SP=SP; 	
      000146 85 81 34         [24]  457 	mov	_Thread0SP,_SP
      000149 75 35 00         [24]  458 	mov	(_Thread0SP + 1),#0x00
                                    459 ;	cooperative.c:246: break;
                                    460 ;	cooperative.c:247: case 1:
      00014C 80 25            [24]  461 	sjmp	00119$
      00014E                        462 00115$:
                                    463 ;	cooperative.c:251: __endasm;
      00014E 75 D0 08         [24]  464 	MOV	PSW ,#0X08
      000151 C0 D0            [24]  465 	PUSH	PSW
                                    466 ;	cooperative.c:252: Thread1SP=SP; 	
      000153 85 81 35         [24]  467 	mov	_Thread1SP,_SP
      000156 75 36 00         [24]  468 	mov	(_Thread1SP + 1),#0x00
                                    469 ;	cooperative.c:253: break;
                                    470 ;	cooperative.c:254: case 2:
      000159 80 18            [24]  471 	sjmp	00119$
      00015B                        472 00116$:
                                    473 ;	cooperative.c:258: __endasm;
      00015B 75 D0 10         [24]  474 	MOV	PSW ,#0X10
      00015E C0 D0            [24]  475 	PUSH	PSW
                                    476 ;	cooperative.c:259: Thread2SP=SP; 	
      000160 85 81 36         [24]  477 	mov	_Thread2SP,_SP
      000163 75 37 00         [24]  478 	mov	(_Thread2SP + 1),#0x00
                                    479 ;	cooperative.c:260: break;
                                    480 ;	cooperative.c:261: case 3:
      000166 80 0B            [24]  481 	sjmp	00119$
      000168                        482 00117$:
                                    483 ;	cooperative.c:265: __endasm;
      000168 75 D0 18         [24]  484 	MOV	PSW ,#0X18
      00016B C0 D0            [24]  485 	PUSH	PSW
                                    486 ;	cooperative.c:266: Thread3SP=SP;
      00016D 85 81 37         [24]  487 	mov	_Thread3SP,_SP
      000170 75 38 00         [24]  488 	mov	(_Thread3SP + 1),#0x00
                                    489 ;	cooperative.c:270: }
      000173                        490 00119$:
                                    491 ;	cooperative.c:271: SP = TempSP;
      000173 85 38 81         [24]  492 	mov	_SP,_TempSP
                                    493 ;	cooperative.c:272: return createdThreadId;
      000176 85 30 82         [24]  494 	mov	dpl,_createdThreadId
                                    495 ;	cooperative.c:273: }
      000179 22               [24]  496 	ret
                                    497 ;------------------------------------------------------------
                                    498 ;Allocation info for local variables in function 'ThreadYield'
                                    499 ;------------------------------------------------------------
                                    500 ;	cooperative.c:284: void ThreadYield(void) {
                                    501 ;	-----------------------------------------
                                    502 ;	 function ThreadYield
                                    503 ;	-----------------------------------------
      00017A                        504 _ThreadYield:
                                    505 ;	cooperative.c:285: SAVESTATE;
      00017A C0 E0            [24]  506 	PUSH ACC 
      00017C C0 F0            [24]  507 	PUSH B 
      00017E C0 82            [24]  508 	PUSH DPL 
      000180 C0 83            [24]  509 	PUSH DPH 
      000182 C0 D0            [24]  510 	PUSH PSW 
      000184 E5 31            [12]  511 	mov	a,_currentThreadId
      000186 FF               [12]  512 	mov	r7,a
      000187 24 FC            [12]  513 	add	a,#0xff - 0x03
      000189 40 20            [24]  514 	jc	00128$
      00018B EF               [12]  515 	mov	a,r7
      00018C 2F               [12]  516 	add	a,r7
      00018D 90 01 91         [24]  517 	mov	dptr,#00172$
      000190 73               [24]  518 	jmp	@a+dptr
      000191                        519 00172$:
      000191 80 06            [24]  520 	sjmp	00101$
      000193 80 09            [24]  521 	sjmp	00102$
      000195 80 0C            [24]  522 	sjmp	00103$
      000197 80 0F            [24]  523 	sjmp	00104$
      000199                        524 00101$:
      000199 85 81 34         [24]  525 	MOV 0x34, SP 
      00019C 80 0D            [24]  526 	sjmp	00128$
      00019E                        527 00102$:
      00019E 85 81 35         [24]  528 	MOV 0x35, SP 
      0001A1 80 08            [24]  529 	sjmp	00128$
      0001A3                        530 00103$:
      0001A3 85 81 36         [24]  531 	MOV 0x36, SP 
      0001A6 80 03            [24]  532 	sjmp	00128$
      0001A8                        533 00104$:
      0001A8 85 81 37         [24]  534 	MOV 0x37, SP 
                                    535 ;	cooperative.c:286: do {
      0001AB                        536 00128$:
                                    537 ;	cooperative.c:296: switch (currentThreadId) {
      0001AB E5 31            [12]  538 	mov	a,_currentThreadId
      0001AD FF               [12]  539 	mov	r7,a
      0001AE 24 FC            [12]  540 	add	a,#0xff - 0x03
      0001B0 40 20            [24]  541 	jc	00112$
      0001B2 EF               [12]  542 	mov	a,r7
      0001B3 2F               [12]  543 	add	a,r7
                                    544 ;	cooperative.c:297: case 0:
      0001B4 90 01 B8         [24]  545 	mov	dptr,#00174$
      0001B7 73               [24]  546 	jmp	@a+dptr
      0001B8                        547 00174$:
      0001B8 80 06            [24]  548 	sjmp	00107$
      0001BA 80 09            [24]  549 	sjmp	00108$
      0001BC 80 0C            [24]  550 	sjmp	00109$
      0001BE 80 0F            [24]  551 	sjmp	00110$
      0001C0                        552 00107$:
                                    553 ;	cooperative.c:298: currentThreadId = 1;
      0001C0 75 31 01         [24]  554 	mov	_currentThreadId,#0x01
                                    555 ;	cooperative.c:299: break;
                                    556 ;	cooperative.c:300: case 1:
      0001C3 80 0D            [24]  557 	sjmp	00112$
      0001C5                        558 00108$:
                                    559 ;	cooperative.c:301: currentThreadId = 2;
      0001C5 75 31 02         [24]  560 	mov	_currentThreadId,#0x02
                                    561 ;	cooperative.c:302: break;
                                    562 ;	cooperative.c:303: case 2:
      0001C8 80 08            [24]  563 	sjmp	00112$
      0001CA                        564 00109$:
                                    565 ;	cooperative.c:304: currentThreadId = 3;
      0001CA 75 31 03         [24]  566 	mov	_currentThreadId,#0x03
                                    567 ;	cooperative.c:305: break;
                                    568 ;	cooperative.c:306: case 3:
      0001CD 80 03            [24]  569 	sjmp	00112$
      0001CF                        570 00110$:
                                    571 ;	cooperative.c:307: currentThreadId = 0;
      0001CF 75 31 00         [24]  572 	mov	_currentThreadId,#0x00
                                    573 ;	cooperative.c:311: }
      0001D2                        574 00112$:
                                    575 ;	cooperative.c:312: if( (currentThreadId==0) &&  ((bitmap & 0x01)==0x01) ){
      0001D2 E5 31            [12]  576 	mov	a,_currentThreadId
      0001D4 70 11            [24]  577 	jnz	00125$
      0001D6 74 01            [12]  578 	mov	a,#0x01
      0001D8 55 33            [12]  579 	anl	a,_bitmap
      0001DA FE               [12]  580 	mov	r6,a
      0001DB E5 34            [12]  581 	mov	a,(_bitmap + 1)
      0001DD 7F 00            [12]  582 	mov	r7,#0x00
      0001DF BE 01 05         [24]  583 	cjne	r6,#0x01,00176$
      0001E2 BF 00 02         [24]  584 	cjne	r7,#0x00,00176$
      0001E5 80 4A            [24]  585 	sjmp	00130$
      0001E7                        586 00176$:
                                    587 ;	cooperative.c:313: break;
      0001E7                        588 00125$:
                                    589 ;	cooperative.c:315: else if((currentThreadId==1) &&  ((bitmap & 0x02)==0x02)){
      0001E7 74 01            [12]  590 	mov	a,#0x01
      0001E9 B5 31 11         [24]  591 	cjne	a,_currentThreadId,00121$
      0001EC 74 02            [12]  592 	mov	a,#0x02
      0001EE 55 33            [12]  593 	anl	a,_bitmap
      0001F0 FE               [12]  594 	mov	r6,a
      0001F1 E5 34            [12]  595 	mov	a,(_bitmap + 1)
      0001F3 7F 00            [12]  596 	mov	r7,#0x00
      0001F5 BE 02 05         [24]  597 	cjne	r6,#0x02,00179$
      0001F8 BF 00 02         [24]  598 	cjne	r7,#0x00,00179$
      0001FB 80 34            [24]  599 	sjmp	00130$
      0001FD                        600 00179$:
                                    601 ;	cooperative.c:316: break;
      0001FD                        602 00121$:
                                    603 ;	cooperative.c:318: else if((currentThreadId==2) &&  ((bitmap & 0x04)==0x04)){
      0001FD 74 02            [12]  604 	mov	a,#0x02
      0001FF B5 31 11         [24]  605 	cjne	a,_currentThreadId,00117$
      000202 74 04            [12]  606 	mov	a,#0x04
      000204 55 33            [12]  607 	anl	a,_bitmap
      000206 FE               [12]  608 	mov	r6,a
      000207 E5 34            [12]  609 	mov	a,(_bitmap + 1)
      000209 7F 00            [12]  610 	mov	r7,#0x00
      00020B BE 04 05         [24]  611 	cjne	r6,#0x04,00182$
      00020E BF 00 02         [24]  612 	cjne	r7,#0x00,00182$
      000211 80 1E            [24]  613 	sjmp	00130$
      000213                        614 00182$:
                                    615 ;	cooperative.c:319: break;
      000213                        616 00117$:
                                    617 ;	cooperative.c:321: else if( (currentThreadId==3) &&  ((bitmap & 0x08)==0x08) ){
      000213 74 03            [12]  618 	mov	a,#0x03
      000215 B5 31 02         [24]  619 	cjne	a,_currentThreadId,00183$
      000218 80 03            [24]  620 	sjmp	00184$
      00021A                        621 00183$:
      00021A 02 01 AB         [24]  622 	ljmp	00128$
      00021D                        623 00184$:
      00021D 74 08            [12]  624 	mov	a,#0x08
      00021F 55 33            [12]  625 	anl	a,_bitmap
      000221 FE               [12]  626 	mov	r6,a
      000222 E5 34            [12]  627 	mov	a,(_bitmap + 1)
      000224 7F 00            [12]  628 	mov	r7,#0x00
      000226 BE 08 05         [24]  629 	cjne	r6,#0x08,00185$
      000229 BF 00 02         [24]  630 	cjne	r7,#0x00,00185$
      00022C 80 03            [24]  631 	sjmp	00186$
      00022E                        632 00185$:
      00022E 02 01 AB         [24]  633 	ljmp	00128$
      000231                        634 00186$:
                                    635 ;	cooperative.c:325: } while (1);
      000231                        636 00130$:
                                    637 ;	cooperative.c:326: RESTORESTATE;
      000231 E5 31            [12]  638 	mov	a,_currentThreadId
      000233 FF               [12]  639 	mov	r7,a
      000234 24 FC            [12]  640 	add	a,#0xff - 0x03
      000236 40 20            [24]  641 	jc	00136$
      000238 EF               [12]  642 	mov	a,r7
      000239 2F               [12]  643 	add	a,r7
      00023A 90 02 3E         [24]  644 	mov	dptr,#00188$
      00023D 73               [24]  645 	jmp	@a+dptr
      00023E                        646 00188$:
      00023E 80 06            [24]  647 	sjmp	00131$
      000240 80 09            [24]  648 	sjmp	00132$
      000242 80 0C            [24]  649 	sjmp	00133$
      000244 80 0F            [24]  650 	sjmp	00134$
      000246                        651 00131$:
      000246 85 34 81         [24]  652 	MOV SP, 0x34 
      000249 80 0D            [24]  653 	sjmp	00136$
      00024B                        654 00132$:
      00024B 85 35 81         [24]  655 	MOV SP, 0x35 
      00024E 80 08            [24]  656 	sjmp	00136$
      000250                        657 00133$:
      000250 85 36 81         [24]  658 	MOV SP, 0x36 
      000253 80 03            [24]  659 	sjmp	00136$
      000255                        660 00134$:
      000255 85 37 81         [24]  661 	MOV SP, 0x37 
      000258                        662 00136$:
      000258 D0 D0            [24]  663 	POP PSW 
      00025A D0 83            [24]  664 	POP DPH 
      00025C D0 82            [24]  665 	POP DPL 
      00025E D0 F0            [24]  666 	POP B 
      000260 D0 E0            [24]  667 	POP ACC 
                                    668 ;	cooperative.c:327: }
      000262 22               [24]  669 	ret
                                    670 ;------------------------------------------------------------
                                    671 ;Allocation info for local variables in function 'ThreadExit'
                                    672 ;------------------------------------------------------------
                                    673 ;	cooperative.c:335: void ThreadExit(void) {
                                    674 ;	-----------------------------------------
                                    675 ;	 function ThreadExit
                                    676 ;	-----------------------------------------
      000263                        677 _ThreadExit:
                                    678 ;	cooperative.c:342: RESTORESTATE;
      000263 E5 31            [12]  679 	mov	a,_currentThreadId
      000265 FF               [12]  680 	mov	r7,a
      000266 24 FC            [12]  681 	add	a,#0xff - 0x03
      000268 40 20            [24]  682 	jc	00106$
      00026A EF               [12]  683 	mov	a,r7
      00026B 2F               [12]  684 	add	a,r7
      00026C 90 02 70         [24]  685 	mov	dptr,#00114$
      00026F 73               [24]  686 	jmp	@a+dptr
      000270                        687 00114$:
      000270 80 06            [24]  688 	sjmp	00101$
      000272 80 09            [24]  689 	sjmp	00102$
      000274 80 0C            [24]  690 	sjmp	00103$
      000276 80 0F            [24]  691 	sjmp	00104$
      000278                        692 00101$:
      000278 85 34 81         [24]  693 	MOV SP, 0x34 
      00027B 80 0D            [24]  694 	sjmp	00106$
      00027D                        695 00102$:
      00027D 85 35 81         [24]  696 	MOV SP, 0x35 
      000280 80 08            [24]  697 	sjmp	00106$
      000282                        698 00103$:
      000282 85 36 81         [24]  699 	MOV SP, 0x36 
      000285 80 03            [24]  700 	sjmp	00106$
      000287                        701 00104$:
      000287 85 37 81         [24]  702 	MOV SP, 0x37 
      00028A                        703 00106$:
      00028A D0 D0            [24]  704 	POP PSW 
      00028C D0 83            [24]  705 	POP DPH 
      00028E D0 82            [24]  706 	POP DPL 
      000290 D0 F0            [24]  707 	POP B 
      000292 D0 E0            [24]  708 	POP ACC 
                                    709 ;	cooperative.c:343: }
      000294 22               [24]  710 	ret
                                    711 	.area CSEG    (CODE)
                                    712 	.area CONST   (CODE)
                                    713 	.area XINIT   (CODE)
                                    714 	.area CABS    (ABS,CODE)
