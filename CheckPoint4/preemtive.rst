                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module preemtive
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _myTimer0Handler
                                     12 	.globl _Bootstrap
                                     13 	.globl _main
                                     14 	.globl _CY
                                     15 	.globl _AC
                                     16 	.globl _F0
                                     17 	.globl _RS1
                                     18 	.globl _RS0
                                     19 	.globl _OV
                                     20 	.globl _F1
                                     21 	.globl _P
                                     22 	.globl _PS
                                     23 	.globl _PT1
                                     24 	.globl _PX1
                                     25 	.globl _PT0
                                     26 	.globl _PX0
                                     27 	.globl _RD
                                     28 	.globl _WR
                                     29 	.globl _T1
                                     30 	.globl _T0
                                     31 	.globl _INT1
                                     32 	.globl _INT0
                                     33 	.globl _TXD
                                     34 	.globl _RXD
                                     35 	.globl _P3_7
                                     36 	.globl _P3_6
                                     37 	.globl _P3_5
                                     38 	.globl _P3_4
                                     39 	.globl _P3_3
                                     40 	.globl _P3_2
                                     41 	.globl _P3_1
                                     42 	.globl _P3_0
                                     43 	.globl _EA
                                     44 	.globl _ES
                                     45 	.globl _ET1
                                     46 	.globl _EX1
                                     47 	.globl _ET0
                                     48 	.globl _EX0
                                     49 	.globl _P2_7
                                     50 	.globl _P2_6
                                     51 	.globl _P2_5
                                     52 	.globl _P2_4
                                     53 	.globl _P2_3
                                     54 	.globl _P2_2
                                     55 	.globl _P2_1
                                     56 	.globl _P2_0
                                     57 	.globl _SM0
                                     58 	.globl _SM1
                                     59 	.globl _SM2
                                     60 	.globl _REN
                                     61 	.globl _TB8
                                     62 	.globl _RB8
                                     63 	.globl _TI
                                     64 	.globl _RI
                                     65 	.globl _P1_7
                                     66 	.globl _P1_6
                                     67 	.globl _P1_5
                                     68 	.globl _P1_4
                                     69 	.globl _P1_3
                                     70 	.globl _P1_2
                                     71 	.globl _P1_1
                                     72 	.globl _P1_0
                                     73 	.globl _TF1
                                     74 	.globl _TR1
                                     75 	.globl _TF0
                                     76 	.globl _TR0
                                     77 	.globl _IE1
                                     78 	.globl _IT1
                                     79 	.globl _IE0
                                     80 	.globl _IT0
                                     81 	.globl _P0_7
                                     82 	.globl _P0_6
                                     83 	.globl _P0_5
                                     84 	.globl _P0_4
                                     85 	.globl _P0_3
                                     86 	.globl _P0_2
                                     87 	.globl _P0_1
                                     88 	.globl _P0_0
                                     89 	.globl _B
                                     90 	.globl _ACC
                                     91 	.globl _PSW
                                     92 	.globl _IP
                                     93 	.globl _P3
                                     94 	.globl _IE
                                     95 	.globl _P2
                                     96 	.globl _SBUF
                                     97 	.globl _SCON
                                     98 	.globl _P1
                                     99 	.globl _TH1
                                    100 	.globl _TH0
                                    101 	.globl _TL1
                                    102 	.globl _TL0
                                    103 	.globl _TMOD
                                    104 	.globl _TCON
                                    105 	.globl _PCON
                                    106 	.globl _DPH
                                    107 	.globl _DPL
                                    108 	.globl _SP
                                    109 	.globl _P0
                                    110 	.globl _LastProducerId
                                    111 	.globl _TempSP
                                    112 	.globl _Thread3SP
                                    113 	.globl _Thread2SP
                                    114 	.globl _Thread1SP
                                    115 	.globl _Thread0SP
                                    116 	.globl _bitmap
                                    117 	.globl _currentThreadId
                                    118 	.globl _createdThreadId
                                    119 	.globl _ThreadCreate
                                    120 	.globl _ThreadYield
                                    121 	.globl _ThreadExit
                                    122 ;--------------------------------------------------------
                                    123 ; special function registers
                                    124 ;--------------------------------------------------------
                                    125 	.area RSEG    (ABS,DATA)
      000000                        126 	.org 0x0000
                           000080   127 _P0	=	0x0080
                           000081   128 _SP	=	0x0081
                           000082   129 _DPL	=	0x0082
                           000083   130 _DPH	=	0x0083
                           000087   131 _PCON	=	0x0087
                           000088   132 _TCON	=	0x0088
                           000089   133 _TMOD	=	0x0089
                           00008A   134 _TL0	=	0x008a
                           00008B   135 _TL1	=	0x008b
                           00008C   136 _TH0	=	0x008c
                           00008D   137 _TH1	=	0x008d
                           000090   138 _P1	=	0x0090
                           000098   139 _SCON	=	0x0098
                           000099   140 _SBUF	=	0x0099
                           0000A0   141 _P2	=	0x00a0
                           0000A8   142 _IE	=	0x00a8
                           0000B0   143 _P3	=	0x00b0
                           0000B8   144 _IP	=	0x00b8
                           0000D0   145 _PSW	=	0x00d0
                           0000E0   146 _ACC	=	0x00e0
                           0000F0   147 _B	=	0x00f0
                                    148 ;--------------------------------------------------------
                                    149 ; special function bits
                                    150 ;--------------------------------------------------------
                                    151 	.area RSEG    (ABS,DATA)
      000000                        152 	.org 0x0000
                           000080   153 _P0_0	=	0x0080
                           000081   154 _P0_1	=	0x0081
                           000082   155 _P0_2	=	0x0082
                           000083   156 _P0_3	=	0x0083
                           000084   157 _P0_4	=	0x0084
                           000085   158 _P0_5	=	0x0085
                           000086   159 _P0_6	=	0x0086
                           000087   160 _P0_7	=	0x0087
                           000088   161 _IT0	=	0x0088
                           000089   162 _IE0	=	0x0089
                           00008A   163 _IT1	=	0x008a
                           00008B   164 _IE1	=	0x008b
                           00008C   165 _TR0	=	0x008c
                           00008D   166 _TF0	=	0x008d
                           00008E   167 _TR1	=	0x008e
                           00008F   168 _TF1	=	0x008f
                           000090   169 _P1_0	=	0x0090
                           000091   170 _P1_1	=	0x0091
                           000092   171 _P1_2	=	0x0092
                           000093   172 _P1_3	=	0x0093
                           000094   173 _P1_4	=	0x0094
                           000095   174 _P1_5	=	0x0095
                           000096   175 _P1_6	=	0x0096
                           000097   176 _P1_7	=	0x0097
                           000098   177 _RI	=	0x0098
                           000099   178 _TI	=	0x0099
                           00009A   179 _RB8	=	0x009a
                           00009B   180 _TB8	=	0x009b
                           00009C   181 _REN	=	0x009c
                           00009D   182 _SM2	=	0x009d
                           00009E   183 _SM1	=	0x009e
                           00009F   184 _SM0	=	0x009f
                           0000A0   185 _P2_0	=	0x00a0
                           0000A1   186 _P2_1	=	0x00a1
                           0000A2   187 _P2_2	=	0x00a2
                           0000A3   188 _P2_3	=	0x00a3
                           0000A4   189 _P2_4	=	0x00a4
                           0000A5   190 _P2_5	=	0x00a5
                           0000A6   191 _P2_6	=	0x00a6
                           0000A7   192 _P2_7	=	0x00a7
                           0000A8   193 _EX0	=	0x00a8
                           0000A9   194 _ET0	=	0x00a9
                           0000AA   195 _EX1	=	0x00aa
                           0000AB   196 _ET1	=	0x00ab
                           0000AC   197 _ES	=	0x00ac
                           0000AF   198 _EA	=	0x00af
                           0000B0   199 _P3_0	=	0x00b0
                           0000B1   200 _P3_1	=	0x00b1
                           0000B2   201 _P3_2	=	0x00b2
                           0000B3   202 _P3_3	=	0x00b3
                           0000B4   203 _P3_4	=	0x00b4
                           0000B5   204 _P3_5	=	0x00b5
                           0000B6   205 _P3_6	=	0x00b6
                           0000B7   206 _P3_7	=	0x00b7
                           0000B0   207 _RXD	=	0x00b0
                           0000B1   208 _TXD	=	0x00b1
                           0000B2   209 _INT0	=	0x00b2
                           0000B3   210 _INT1	=	0x00b3
                           0000B4   211 _T0	=	0x00b4
                           0000B5   212 _T1	=	0x00b5
                           0000B6   213 _WR	=	0x00b6
                           0000B7   214 _RD	=	0x00b7
                           0000B8   215 _PX0	=	0x00b8
                           0000B9   216 _PT0	=	0x00b9
                           0000BA   217 _PX1	=	0x00ba
                           0000BB   218 _PT1	=	0x00bb
                           0000BC   219 _PS	=	0x00bc
                           0000D0   220 _P	=	0x00d0
                           0000D1   221 _F1	=	0x00d1
                           0000D2   222 _OV	=	0x00d2
                           0000D3   223 _RS0	=	0x00d3
                           0000D4   224 _RS1	=	0x00d4
                           0000D5   225 _F0	=	0x00d5
                           0000D6   226 _AC	=	0x00d6
                           0000D7   227 _CY	=	0x00d7
                                    228 ;--------------------------------------------------------
                                    229 ; overlayable register banks
                                    230 ;--------------------------------------------------------
                                    231 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        232 	.ds 8
                                    233 ;--------------------------------------------------------
                                    234 ; internal ram data
                                    235 ;--------------------------------------------------------
                                    236 	.area DSEG    (DATA)
                           000030   237 _createdThreadId	=	0x0030
                           000031   238 _currentThreadId	=	0x0031
                           000033   239 _bitmap	=	0x0033
                           000034   240 _Thread0SP	=	0x0034
                           000035   241 _Thread1SP	=	0x0035
                           000036   242 _Thread2SP	=	0x0036
                           000037   243 _Thread3SP	=	0x0037
                           000038   244 _TempSP	=	0x0038
                           00002C   245 _LastProducerId	=	0x002c
                                    246 ;--------------------------------------------------------
                                    247 ; overlayable items in internal ram 
                                    248 ;--------------------------------------------------------
                                    249 	.area	OSEG    (OVR,DATA)
                                    250 ;--------------------------------------------------------
                                    251 ; indirectly addressable internal ram data
                                    252 ;--------------------------------------------------------
                                    253 	.area ISEG    (DATA)
                                    254 ;--------------------------------------------------------
                                    255 ; absolute internal ram data
                                    256 ;--------------------------------------------------------
                                    257 	.area IABS    (ABS,DATA)
                                    258 	.area IABS    (ABS,DATA)
                                    259 ;--------------------------------------------------------
                                    260 ; bit data
                                    261 ;--------------------------------------------------------
                                    262 	.area BSEG    (BIT)
                                    263 ;--------------------------------------------------------
                                    264 ; paged external ram data
                                    265 ;--------------------------------------------------------
                                    266 	.area PSEG    (PAG,XDATA)
                                    267 ;--------------------------------------------------------
                                    268 ; external ram data
                                    269 ;--------------------------------------------------------
                                    270 	.area XSEG    (XDATA)
                                    271 ;--------------------------------------------------------
                                    272 ; absolute external ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area XABS    (ABS,XDATA)
                                    275 ;--------------------------------------------------------
                                    276 ; external initialized ram data
                                    277 ;--------------------------------------------------------
                                    278 	.area XISEG   (XDATA)
                                    279 	.area HOME    (CODE)
                                    280 	.area GSINIT0 (CODE)
                                    281 	.area GSINIT1 (CODE)
                                    282 	.area GSINIT2 (CODE)
                                    283 	.area GSINIT3 (CODE)
                                    284 	.area GSINIT4 (CODE)
                                    285 	.area GSINIT5 (CODE)
                                    286 	.area GSINIT  (CODE)
                                    287 	.area GSFINAL (CODE)
                                    288 	.area CSEG    (CODE)
                                    289 ;--------------------------------------------------------
                                    290 ; global & static initialisations
                                    291 ;--------------------------------------------------------
                                    292 	.area HOME    (CODE)
                                    293 	.area GSINIT  (CODE)
                                    294 	.area GSFINAL (CODE)
                                    295 	.area GSINIT  (CODE)
                                    296 ;--------------------------------------------------------
                                    297 ; Home
                                    298 ;--------------------------------------------------------
                                    299 	.area HOME    (CODE)
                                    300 	.area HOME    (CODE)
                                    301 ;--------------------------------------------------------
                                    302 ; code
                                    303 ;--------------------------------------------------------
                                    304 	.area CSEG    (CODE)
                                    305 ;------------------------------------------------------------
                                    306 ;Allocation info for local variables in function 'Bootstrap'
                                    307 ;------------------------------------------------------------
                                    308 ;	preemtive.c:126: void Bootstrap(void) {
                                    309 ;	-----------------------------------------
                                    310 ;	 function Bootstrap
                                    311 ;	-----------------------------------------
      000150                        312 _Bootstrap:
                           000007   313 	ar7 = 0x07
                           000006   314 	ar6 = 0x06
                           000005   315 	ar5 = 0x05
                           000004   316 	ar4 = 0x04
                           000003   317 	ar3 = 0x03
                           000002   318 	ar2 = 0x02
                           000001   319 	ar1 = 0x01
                           000000   320 	ar0 = 0x00
                                    321 ;	preemtive.c:139: TMOD = 0;  // timer 0 mode 0
      000150 75 89 00         [24]  322 	mov	_TMOD,#0x00
                                    323 ;	preemtive.c:140: IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
      000153 75 A8 82         [24]  324 	mov	_IE,#0x82
                                    325 ;	preemtive.c:142: TR0 = 1; // set bit TR0 to start running timer 0
                                    326 ;	assignBit
      000156 D2 8C            [12]  327 	setb	_TR0
                                    328 ;	preemtive.c:143: bitmap = 0x00;
      000158 E4               [12]  329 	clr	a
      000159 F5 33            [12]  330 	mov	_bitmap,a
      00015B F5 34            [12]  331 	mov	(_bitmap + 1),a
                                    332 ;	preemtive.c:144: currentThreadId = ThreadCreate(main);
      00015D 90 01 06         [24]  333 	mov	dptr,#_main
      000160 12 01 98         [24]  334 	lcall	_ThreadCreate
      000163 85 82 31         [24]  335 	mov	_currentThreadId,dpl
                                    336 ;	preemtive.c:145: RESTORESTATE;
      000166 E5 31            [12]  337 	mov	a,_currentThreadId
      000168 FF               [12]  338 	mov	r7,a
      000169 24 FC            [12]  339 	add	a,#0xff - 0x03
      00016B 40 20            [24]  340 	jc	00106$
      00016D EF               [12]  341 	mov	a,r7
      00016E 2F               [12]  342 	add	a,r7
      00016F 90 01 73         [24]  343 	mov	dptr,#00114$
      000172 73               [24]  344 	jmp	@a+dptr
      000173                        345 00114$:
      000173 80 06            [24]  346 	sjmp	00101$
      000175 80 09            [24]  347 	sjmp	00102$
      000177 80 0C            [24]  348 	sjmp	00103$
      000179 80 0F            [24]  349 	sjmp	00104$
      00017B                        350 00101$:
      00017B 85 34 81         [24]  351 	MOV SP, 0x34 
      00017E 80 0D            [24]  352 	sjmp	00106$
      000180                        353 00102$:
      000180 85 35 81         [24]  354 	MOV SP, 0x35 
      000183 80 08            [24]  355 	sjmp	00106$
      000185                        356 00103$:
      000185 85 36 81         [24]  357 	MOV SP, 0x36 
      000188 80 03            [24]  358 	sjmp	00106$
      00018A                        359 00104$:
      00018A 85 37 81         [24]  360 	MOV SP, 0x37 
      00018D                        361 00106$:
      00018D D0 D0            [24]  362 	POP PSW 
      00018F D0 83            [24]  363 	POP DPH 
      000191 D0 82            [24]  364 	POP DPL 
      000193 D0 F0            [24]  365 	POP B 
      000195 D0 E0            [24]  366 	POP ACC 
                                    367 ;	preemtive.c:146: }
      000197 22               [24]  368 	ret
                                    369 ;------------------------------------------------------------
                                    370 ;Allocation info for local variables in function 'ThreadCreate'
                                    371 ;------------------------------------------------------------
                                    372 ;fp                        Allocated to registers 
                                    373 ;------------------------------------------------------------
                                    374 ;	preemtive.c:155: ThreadId ThreadCreate(FunctionPtr fp) {
                                    375 ;	-----------------------------------------
                                    376 ;	 function ThreadCreate
                                    377 ;	-----------------------------------------
      000198                        378 _ThreadCreate:
                                    379 ;	preemtive.c:200: EA = 0;
                                    380 ;	assignBit
      000198 C2 AF            [12]  381 	clr	_EA
                                    382 ;	preemtive.c:201: if((bitmap & 0xFF)==0xFF){
      00019A AE 33            [24]  383 	mov	r6,_bitmap
      00019C E5 34            [12]  384 	mov	a,(_bitmap + 1)
      00019E 7F 00            [12]  385 	mov	r7,#0x00
      0001A0 BE FF 07         [24]  386 	cjne	r6,#0xff,00102$
      0001A3 BF 00 04         [24]  387 	cjne	r7,#0x00,00102$
                                    388 ;	preemtive.c:202: return -1;
      0001A6 75 82 FF         [24]  389 	mov	dpl,#0xff
      0001A9 22               [24]  390 	ret
      0001AA                        391 00102$:
                                    392 ;	preemtive.c:204: TempSP = SP; 
      0001AA 85 81 38         [24]  393 	mov	_TempSP,_SP
      0001AD 75 39 00         [24]  394 	mov	(_TempSP + 1),#0x00
                                    395 ;	preemtive.c:205: if((bitmap & 0x01) == 0x00){
      0001B0 E5 33            [12]  396 	mov	a,_bitmap
      0001B2 20 E0 0E         [24]  397 	jb	acc.0,00112$
                                    398 ;	preemtive.c:209: __endasm;
      0001B5 75 34 3F         [24]  399 	MOV	0x34 , #0x3F
      0001B8 43 33 01         [24]  400 	ORL	0X33 ,#0X01
                                    401 ;	preemtive.c:210: createdThreadId = 0;
      0001BB 75 30 00         [24]  402 	mov	_createdThreadId,#0x00
                                    403 ;	preemtive.c:211: SP = Thread0SP;
      0001BE 85 34 81         [24]  404 	mov	_SP,_Thread0SP
      0001C1 80 37            [24]  405 	sjmp	00113$
      0001C3                        406 00112$:
                                    407 ;	preemtive.c:213: else if((bitmap & 0x02) ==0x00){
      0001C3 E5 33            [12]  408 	mov	a,_bitmap
      0001C5 20 E1 0E         [24]  409 	jb	acc.1,00109$
                                    410 ;	preemtive.c:217: __endasm;
      0001C8 75 35 4F         [24]  411 	MOV	0x35 , #0x4F
      0001CB 43 33 02         [24]  412 	ORL	0X33 ,#0X02
                                    413 ;	preemtive.c:218: createdThreadId = 1;
      0001CE 75 30 01         [24]  414 	mov	_createdThreadId,#0x01
                                    415 ;	preemtive.c:219: SP = Thread1SP;
      0001D1 85 35 81         [24]  416 	mov	_SP,_Thread1SP
      0001D4 80 24            [24]  417 	sjmp	00113$
      0001D6                        418 00109$:
                                    419 ;	preemtive.c:221: else if((bitmap & 0x04) ==0x00){
      0001D6 E5 33            [12]  420 	mov	a,_bitmap
      0001D8 20 E2 0E         [24]  421 	jb	acc.2,00106$
                                    422 ;	preemtive.c:225: __endasm;
      0001DB 75 36 5F         [24]  423 	MOV	0x36 , #0x5F
      0001DE 43 33 04         [24]  424 	ORL	0X33 ,#0X04
                                    425 ;	preemtive.c:226: createdThreadId = 2;
      0001E1 75 30 02         [24]  426 	mov	_createdThreadId,#0x02
                                    427 ;	preemtive.c:227: SP = Thread2SP;
      0001E4 85 36 81         [24]  428 	mov	_SP,_Thread2SP
      0001E7 80 11            [24]  429 	sjmp	00113$
      0001E9                        430 00106$:
                                    431 ;	preemtive.c:229: else if((bitmap & 0x08) ==0x00){
      0001E9 E5 33            [12]  432 	mov	a,_bitmap
      0001EB 20 E3 0C         [24]  433 	jb	acc.3,00113$
                                    434 ;	preemtive.c:233: __endasm;
      0001EE 75 37 6F         [24]  435 	MOV	0x37 , #0x6F
      0001F1 43 33 08         [24]  436 	ORL	0X33 ,#0X08
                                    437 ;	preemtive.c:234: createdThreadId = 3;
      0001F4 75 30 03         [24]  438 	mov	_createdThreadId,#0x03
                                    439 ;	preemtive.c:235: SP = Thread3SP ;
      0001F7 85 37 81         [24]  440 	mov	_SP,_Thread3SP
      0001FA                        441 00113$:
                                    442 ;	preemtive.c:245: __endasm;
      0001FA C0 82            [24]  443 	PUSH	DPL
      0001FC C0 83            [24]  444 	PUSH	DPH
      0001FE E5 00            [12]  445 	MOV	A , 0X00
      000200 C0 E0            [24]  446 	PUSH	ACC
      000202 C0 E0            [24]  447 	PUSH	ACC
      000204 C0 E0            [24]  448 	PUSH	ACC
      000206 C0 E0            [24]  449 	PUSH	ACC
                                    450 ;	preemtive.c:246: switch(createdThreadId ){
      000208 E5 30            [12]  451 	mov	a,_createdThreadId
      00020A FF               [12]  452 	mov	r7,a
      00020B 24 FC            [12]  453 	add	a,#0xff - 0x03
      00020D 40 40            [24]  454 	jc	00119$
      00020F EF               [12]  455 	mov	a,r7
      000210 2F               [12]  456 	add	a,r7
                                    457 ;	preemtive.c:247: case 0:
      000211 90 02 15         [24]  458 	mov	dptr,#00153$
      000214 73               [24]  459 	jmp	@a+dptr
      000215                        460 00153$:
      000215 80 06            [24]  461 	sjmp	00114$
      000217 80 11            [24]  462 	sjmp	00115$
      000219 80 1C            [24]  463 	sjmp	00116$
      00021B 80 27            [24]  464 	sjmp	00117$
      00021D                        465 00114$:
                                    466 ;	preemtive.c:251: __endasm;
      00021D 75 D0 00         [24]  467 	MOV	PSW ,#0X00
      000220 C0 D0            [24]  468 	PUSH	PSW
                                    469 ;	preemtive.c:252: Thread0SP=SP; 	
      000222 85 81 34         [24]  470 	mov	_Thread0SP,_SP
      000225 75 35 00         [24]  471 	mov	(_Thread0SP + 1),#0x00
                                    472 ;	preemtive.c:253: break;
                                    473 ;	preemtive.c:254: case 1:
      000228 80 25            [24]  474 	sjmp	00119$
      00022A                        475 00115$:
                                    476 ;	preemtive.c:258: __endasm;
      00022A 75 D0 08         [24]  477 	MOV	PSW ,#0X08
      00022D C0 D0            [24]  478 	PUSH	PSW
                                    479 ;	preemtive.c:259: Thread1SP=SP; 	
      00022F 85 81 35         [24]  480 	mov	_Thread1SP,_SP
      000232 75 36 00         [24]  481 	mov	(_Thread1SP + 1),#0x00
                                    482 ;	preemtive.c:260: break;
                                    483 ;	preemtive.c:261: case 2:
      000235 80 18            [24]  484 	sjmp	00119$
      000237                        485 00116$:
                                    486 ;	preemtive.c:265: __endasm;
      000237 75 D0 10         [24]  487 	MOV	PSW ,#0X10
      00023A C0 D0            [24]  488 	PUSH	PSW
                                    489 ;	preemtive.c:266: Thread2SP=SP; 	
      00023C 85 81 36         [24]  490 	mov	_Thread2SP,_SP
      00023F 75 37 00         [24]  491 	mov	(_Thread2SP + 1),#0x00
                                    492 ;	preemtive.c:267: break;
                                    493 ;	preemtive.c:268: case 3:
      000242 80 0B            [24]  494 	sjmp	00119$
      000244                        495 00117$:
                                    496 ;	preemtive.c:272: __endasm;
      000244 75 D0 18         [24]  497 	MOV	PSW ,#0X18
      000247 C0 D0            [24]  498 	PUSH	PSW
                                    499 ;	preemtive.c:273: Thread3SP=SP;
      000249 85 81 37         [24]  500 	mov	_Thread3SP,_SP
      00024C 75 38 00         [24]  501 	mov	(_Thread3SP + 1),#0x00
                                    502 ;	preemtive.c:277: }
      00024F                        503 00119$:
                                    504 ;	preemtive.c:278: SP = TempSP;
      00024F 85 38 81         [24]  505 	mov	_SP,_TempSP
                                    506 ;	preemtive.c:279: EA=1;
                                    507 ;	assignBit
      000252 D2 AF            [12]  508 	setb	_EA
                                    509 ;	preemtive.c:280: return createdThreadId;
      000254 85 30 82         [24]  510 	mov	dpl,_createdThreadId
                                    511 ;	preemtive.c:282: }
      000257 22               [24]  512 	ret
                                    513 ;------------------------------------------------------------
                                    514 ;Allocation info for local variables in function 'myTimer0Handler'
                                    515 ;------------------------------------------------------------
                                    516 ;	preemtive.c:292: void myTimer0Handler(void){
                                    517 ;	-----------------------------------------
                                    518 ;	 function myTimer0Handler
                                    519 ;	-----------------------------------------
      000258                        520 _myTimer0Handler:
                                    521 ;	preemtive.c:293: EA = 0;
                                    522 ;	assignBit
      000258 C2 AF            [12]  523 	clr	_EA
                                    524 ;	preemtive.c:294: SAVESTATE;
      00025A C0 E0            [24]  525 	PUSH ACC 
      00025C C0 F0            [24]  526 	PUSH B 
      00025E C0 82            [24]  527 	PUSH DPL 
      000260 C0 83            [24]  528 	PUSH DPH 
      000262 C0 D0            [24]  529 	PUSH PSW 
      000264 E5 31            [12]  530 	mov	a,_currentThreadId
      000266 FF               [12]  531 	mov	r7,a
      000267 24 FC            [12]  532 	add	a,#0xff - 0x03
      000269 40 20            [24]  533 	jc	00106$
      00026B EF               [12]  534 	mov	a,r7
      00026C 2F               [12]  535 	add	a,r7
      00026D 90 02 71         [24]  536 	mov	dptr,#00154$
      000270 73               [24]  537 	jmp	@a+dptr
      000271                        538 00154$:
      000271 80 06            [24]  539 	sjmp	00101$
      000273 80 09            [24]  540 	sjmp	00102$
      000275 80 0C            [24]  541 	sjmp	00103$
      000277 80 0F            [24]  542 	sjmp	00104$
      000279                        543 00101$:
      000279 85 81 34         [24]  544 	MOV 0x34, SP 
      00027C 80 0D            [24]  545 	sjmp	00106$
      00027E                        546 00102$:
      00027E 85 81 35         [24]  547 	MOV 0x35, SP 
      000281 80 08            [24]  548 	sjmp	00106$
      000283                        549 00103$:
      000283 85 81 36         [24]  550 	MOV 0x36, SP 
      000286 80 03            [24]  551 	sjmp	00106$
      000288                        552 00104$:
      000288 85 81 37         [24]  553 	MOV 0x37, SP 
      00028B                        554 00106$:
                                    555 ;	preemtive.c:295: if(currentThreadId==0 && LastProducerId==1){
      00028B E5 31            [12]  556 	mov	a,_currentThreadId
      00028D 70 12            [24]  557 	jnz	00114$
      00028F 74 01            [12]  558 	mov	a,#0x01
      000291 B5 2C 06         [24]  559 	cjne	a,_LastProducerId,00156$
      000294 14               [12]  560 	dec	a
      000295 B5 2D 02         [24]  561 	cjne	a,(_LastProducerId + 1),00156$
      000298 80 02            [24]  562 	sjmp	00157$
      00029A                        563 00156$:
      00029A 80 05            [24]  564 	sjmp	00114$
      00029C                        565 00157$:
                                    566 ;	preemtive.c:296: currentThreadId = 2;
      00029C 75 31 02         [24]  567 	mov	_currentThreadId,#0x02
      00029F 80 23            [24]  568 	sjmp	00115$
      0002A1                        569 00114$:
                                    570 ;	preemtive.c:298: else if(currentThreadId==0 && LastProducerId==2){
      0002A1 E5 31            [12]  571 	mov	a,_currentThreadId
      0002A3 70 12            [24]  572 	jnz	00110$
      0002A5 74 02            [12]  573 	mov	a,#0x02
      0002A7 B5 2C 06         [24]  574 	cjne	a,_LastProducerId,00159$
      0002AA E4               [12]  575 	clr	a
      0002AB B5 2D 02         [24]  576 	cjne	a,(_LastProducerId + 1),00159$
      0002AE 80 02            [24]  577 	sjmp	00160$
      0002B0                        578 00159$:
      0002B0 80 05            [24]  579 	sjmp	00110$
      0002B2                        580 00160$:
                                    581 ;	preemtive.c:299: currentThreadId = 1;
      0002B2 75 31 01         [24]  582 	mov	_currentThreadId,#0x01
      0002B5 80 0D            [24]  583 	sjmp	00115$
      0002B7                        584 00110$:
                                    585 ;	preemtive.c:301: else if(currentThreadId!=0){
      0002B7 E5 31            [12]  586 	mov	a,_currentThreadId
      0002B9 60 09            [24]  587 	jz	00115$
                                    588 ;	preemtive.c:302: LastProducerId = currentThreadId;
      0002BB 85 31 2C         [24]  589 	mov	_LastProducerId,_currentThreadId
      0002BE 75 2D 00         [24]  590 	mov	(_LastProducerId + 1),#0x00
                                    591 ;	preemtive.c:303: currentThreadId = 0;
      0002C1 75 31 00         [24]  592 	mov	_currentThreadId,#0x00
      0002C4                        593 00115$:
                                    594 ;	preemtive.c:305: RESTORESTATE;
      0002C4 E5 31            [12]  595 	mov	a,_currentThreadId
      0002C6 FF               [12]  596 	mov	r7,a
      0002C7 24 FC            [12]  597 	add	a,#0xff - 0x03
      0002C9 40 20            [24]  598 	jc	00122$
      0002CB EF               [12]  599 	mov	a,r7
      0002CC 2F               [12]  600 	add	a,r7
      0002CD 90 02 D1         [24]  601 	mov	dptr,#00163$
      0002D0 73               [24]  602 	jmp	@a+dptr
      0002D1                        603 00163$:
      0002D1 80 06            [24]  604 	sjmp	00117$
      0002D3 80 09            [24]  605 	sjmp	00118$
      0002D5 80 0C            [24]  606 	sjmp	00119$
      0002D7 80 0F            [24]  607 	sjmp	00120$
      0002D9                        608 00117$:
      0002D9 85 34 81         [24]  609 	MOV SP, 0x34 
      0002DC 80 0D            [24]  610 	sjmp	00122$
      0002DE                        611 00118$:
      0002DE 85 35 81         [24]  612 	MOV SP, 0x35 
      0002E1 80 08            [24]  613 	sjmp	00122$
      0002E3                        614 00119$:
      0002E3 85 36 81         [24]  615 	MOV SP, 0x36 
      0002E6 80 03            [24]  616 	sjmp	00122$
      0002E8                        617 00120$:
      0002E8 85 37 81         [24]  618 	MOV SP, 0x37 
      0002EB                        619 00122$:
      0002EB D0 D0            [24]  620 	POP PSW 
      0002ED D0 83            [24]  621 	POP DPH 
      0002EF D0 82            [24]  622 	POP DPL 
      0002F1 D0 F0            [24]  623 	POP B 
      0002F3 D0 E0            [24]  624 	POP ACC 
                                    625 ;	preemtive.c:306: EA = 1;//after restore psw set ea=1
                                    626 ;	assignBit
      0002F5 D2 AF            [12]  627 	setb	_EA
                                    628 ;	preemtive.c:309: __endasm;       
      0002F7 32               [24]  629 	RETI
                                    630 ;	preemtive.c:310: }
      0002F8 22               [24]  631 	ret
                                    632 ;------------------------------------------------------------
                                    633 ;Allocation info for local variables in function 'ThreadYield'
                                    634 ;------------------------------------------------------------
                                    635 ;	preemtive.c:311: void ThreadYield(void) {
                                    636 ;	-----------------------------------------
                                    637 ;	 function ThreadYield
                                    638 ;	-----------------------------------------
      0002F9                        639 _ThreadYield:
                                    640 ;	preemtive.c:312: SAVESTATE;
      0002F9 C0 E0            [24]  641 	PUSH ACC 
      0002FB C0 F0            [24]  642 	PUSH B 
      0002FD C0 82            [24]  643 	PUSH DPL 
      0002FF C0 83            [24]  644 	PUSH DPH 
      000301 C0 D0            [24]  645 	PUSH PSW 
      000303 E5 31            [12]  646 	mov	a,_currentThreadId
      000305 FF               [12]  647 	mov	r7,a
      000306 24 FC            [12]  648 	add	a,#0xff - 0x03
      000308 40 20            [24]  649 	jc	00128$
      00030A EF               [12]  650 	mov	a,r7
      00030B 2F               [12]  651 	add	a,r7
      00030C 90 03 10         [24]  652 	mov	dptr,#00172$
      00030F 73               [24]  653 	jmp	@a+dptr
      000310                        654 00172$:
      000310 80 06            [24]  655 	sjmp	00101$
      000312 80 09            [24]  656 	sjmp	00102$
      000314 80 0C            [24]  657 	sjmp	00103$
      000316 80 0F            [24]  658 	sjmp	00104$
      000318                        659 00101$:
      000318 85 81 34         [24]  660 	MOV 0x34, SP 
      00031B 80 0D            [24]  661 	sjmp	00128$
      00031D                        662 00102$:
      00031D 85 81 35         [24]  663 	MOV 0x35, SP 
      000320 80 08            [24]  664 	sjmp	00128$
      000322                        665 00103$:
      000322 85 81 36         [24]  666 	MOV 0x36, SP 
      000325 80 03            [24]  667 	sjmp	00128$
      000327                        668 00104$:
      000327 85 81 37         [24]  669 	MOV 0x37, SP 
                                    670 ;	preemtive.c:313: do {
      00032A                        671 00128$:
                                    672 ;	preemtive.c:323: switch (currentThreadId) {
      00032A E5 31            [12]  673 	mov	a,_currentThreadId
      00032C FF               [12]  674 	mov	r7,a
      00032D 24 FC            [12]  675 	add	a,#0xff - 0x03
      00032F 40 20            [24]  676 	jc	00112$
      000331 EF               [12]  677 	mov	a,r7
      000332 2F               [12]  678 	add	a,r7
                                    679 ;	preemtive.c:324: case 0:
      000333 90 03 37         [24]  680 	mov	dptr,#00174$
      000336 73               [24]  681 	jmp	@a+dptr
      000337                        682 00174$:
      000337 80 06            [24]  683 	sjmp	00107$
      000339 80 09            [24]  684 	sjmp	00108$
      00033B 80 0C            [24]  685 	sjmp	00109$
      00033D 80 0F            [24]  686 	sjmp	00110$
      00033F                        687 00107$:
                                    688 ;	preemtive.c:325: currentThreadId = 1;
      00033F 75 31 01         [24]  689 	mov	_currentThreadId,#0x01
                                    690 ;	preemtive.c:326: break;
                                    691 ;	preemtive.c:327: case 1:
      000342 80 0D            [24]  692 	sjmp	00112$
      000344                        693 00108$:
                                    694 ;	preemtive.c:328: currentThreadId = 2;
      000344 75 31 02         [24]  695 	mov	_currentThreadId,#0x02
                                    696 ;	preemtive.c:329: break;
                                    697 ;	preemtive.c:330: case 2:
      000347 80 08            [24]  698 	sjmp	00112$
      000349                        699 00109$:
                                    700 ;	preemtive.c:331: currentThreadId = 3;
      000349 75 31 03         [24]  701 	mov	_currentThreadId,#0x03
                                    702 ;	preemtive.c:332: break;
                                    703 ;	preemtive.c:333: case 3:
      00034C 80 03            [24]  704 	sjmp	00112$
      00034E                        705 00110$:
                                    706 ;	preemtive.c:334: currentThreadId = 0;
      00034E 75 31 00         [24]  707 	mov	_currentThreadId,#0x00
                                    708 ;	preemtive.c:338: }
      000351                        709 00112$:
                                    710 ;	preemtive.c:339: if( (currentThreadId==0) &&  ((bitmap & 0x01)==0x01) ){
      000351 E5 31            [12]  711 	mov	a,_currentThreadId
      000353 70 11            [24]  712 	jnz	00125$
      000355 74 01            [12]  713 	mov	a,#0x01
      000357 55 33            [12]  714 	anl	a,_bitmap
      000359 FE               [12]  715 	mov	r6,a
      00035A E5 34            [12]  716 	mov	a,(_bitmap + 1)
      00035C 7F 00            [12]  717 	mov	r7,#0x00
      00035E BE 01 05         [24]  718 	cjne	r6,#0x01,00176$
      000361 BF 00 02         [24]  719 	cjne	r7,#0x00,00176$
      000364 80 4A            [24]  720 	sjmp	00130$
      000366                        721 00176$:
                                    722 ;	preemtive.c:340: break;
      000366                        723 00125$:
                                    724 ;	preemtive.c:342: else if((currentThreadId==1) &&  ((bitmap & 0x02)==0x02)){
      000366 74 01            [12]  725 	mov	a,#0x01
      000368 B5 31 11         [24]  726 	cjne	a,_currentThreadId,00121$
      00036B 74 02            [12]  727 	mov	a,#0x02
      00036D 55 33            [12]  728 	anl	a,_bitmap
      00036F FE               [12]  729 	mov	r6,a
      000370 E5 34            [12]  730 	mov	a,(_bitmap + 1)
      000372 7F 00            [12]  731 	mov	r7,#0x00
      000374 BE 02 05         [24]  732 	cjne	r6,#0x02,00179$
      000377 BF 00 02         [24]  733 	cjne	r7,#0x00,00179$
      00037A 80 34            [24]  734 	sjmp	00130$
      00037C                        735 00179$:
                                    736 ;	preemtive.c:343: break;
      00037C                        737 00121$:
                                    738 ;	preemtive.c:345: else if((currentThreadId==2) &&  ((bitmap & 0x04)==0x04)){
      00037C 74 02            [12]  739 	mov	a,#0x02
      00037E B5 31 11         [24]  740 	cjne	a,_currentThreadId,00117$
      000381 74 04            [12]  741 	mov	a,#0x04
      000383 55 33            [12]  742 	anl	a,_bitmap
      000385 FE               [12]  743 	mov	r6,a
      000386 E5 34            [12]  744 	mov	a,(_bitmap + 1)
      000388 7F 00            [12]  745 	mov	r7,#0x00
      00038A BE 04 05         [24]  746 	cjne	r6,#0x04,00182$
      00038D BF 00 02         [24]  747 	cjne	r7,#0x00,00182$
      000390 80 1E            [24]  748 	sjmp	00130$
      000392                        749 00182$:
                                    750 ;	preemtive.c:346: break;
      000392                        751 00117$:
                                    752 ;	preemtive.c:348: else if( (currentThreadId==3) &&  ((bitmap & 0x08)==0x08) ){
      000392 74 03            [12]  753 	mov	a,#0x03
      000394 B5 31 02         [24]  754 	cjne	a,_currentThreadId,00183$
      000397 80 03            [24]  755 	sjmp	00184$
      000399                        756 00183$:
      000399 02 03 2A         [24]  757 	ljmp	00128$
      00039C                        758 00184$:
      00039C 74 08            [12]  759 	mov	a,#0x08
      00039E 55 33            [12]  760 	anl	a,_bitmap
      0003A0 FE               [12]  761 	mov	r6,a
      0003A1 E5 34            [12]  762 	mov	a,(_bitmap + 1)
      0003A3 7F 00            [12]  763 	mov	r7,#0x00
      0003A5 BE 08 05         [24]  764 	cjne	r6,#0x08,00185$
      0003A8 BF 00 02         [24]  765 	cjne	r7,#0x00,00185$
      0003AB 80 03            [24]  766 	sjmp	00186$
      0003AD                        767 00185$:
      0003AD 02 03 2A         [24]  768 	ljmp	00128$
      0003B0                        769 00186$:
                                    770 ;	preemtive.c:352: } while (1);
      0003B0                        771 00130$:
                                    772 ;	preemtive.c:353: RESTORESTATE;
      0003B0 E5 31            [12]  773 	mov	a,_currentThreadId
      0003B2 FF               [12]  774 	mov	r7,a
      0003B3 24 FC            [12]  775 	add	a,#0xff - 0x03
      0003B5 40 20            [24]  776 	jc	00136$
      0003B7 EF               [12]  777 	mov	a,r7
      0003B8 2F               [12]  778 	add	a,r7
      0003B9 90 03 BD         [24]  779 	mov	dptr,#00188$
      0003BC 73               [24]  780 	jmp	@a+dptr
      0003BD                        781 00188$:
      0003BD 80 06            [24]  782 	sjmp	00131$
      0003BF 80 09            [24]  783 	sjmp	00132$
      0003C1 80 0C            [24]  784 	sjmp	00133$
      0003C3 80 0F            [24]  785 	sjmp	00134$
      0003C5                        786 00131$:
      0003C5 85 34 81         [24]  787 	MOV SP, 0x34 
      0003C8 80 0D            [24]  788 	sjmp	00136$
      0003CA                        789 00132$:
      0003CA 85 35 81         [24]  790 	MOV SP, 0x35 
      0003CD 80 08            [24]  791 	sjmp	00136$
      0003CF                        792 00133$:
      0003CF 85 36 81         [24]  793 	MOV SP, 0x36 
      0003D2 80 03            [24]  794 	sjmp	00136$
      0003D4                        795 00134$:
      0003D4 85 37 81         [24]  796 	MOV SP, 0x37 
      0003D7                        797 00136$:
      0003D7 D0 D0            [24]  798 	POP PSW 
      0003D9 D0 83            [24]  799 	POP DPH 
      0003DB D0 82            [24]  800 	POP DPL 
      0003DD D0 F0            [24]  801 	POP B 
      0003DF D0 E0            [24]  802 	POP ACC 
                                    803 ;	preemtive.c:354: }
      0003E1 22               [24]  804 	ret
                                    805 ;------------------------------------------------------------
                                    806 ;Allocation info for local variables in function 'ThreadExit'
                                    807 ;------------------------------------------------------------
                                    808 ;	preemtive.c:362: void ThreadExit(void) {
                                    809 ;	-----------------------------------------
                                    810 ;	 function ThreadExit
                                    811 ;	-----------------------------------------
      0003E2                        812 _ThreadExit:
                                    813 ;	preemtive.c:369: RESTORESTATE;
      0003E2 E5 31            [12]  814 	mov	a,_currentThreadId
      0003E4 FF               [12]  815 	mov	r7,a
      0003E5 24 FC            [12]  816 	add	a,#0xff - 0x03
      0003E7 40 20            [24]  817 	jc	00106$
      0003E9 EF               [12]  818 	mov	a,r7
      0003EA 2F               [12]  819 	add	a,r7
      0003EB 90 03 EF         [24]  820 	mov	dptr,#00114$
      0003EE 73               [24]  821 	jmp	@a+dptr
      0003EF                        822 00114$:
      0003EF 80 06            [24]  823 	sjmp	00101$
      0003F1 80 09            [24]  824 	sjmp	00102$
      0003F3 80 0C            [24]  825 	sjmp	00103$
      0003F5 80 0F            [24]  826 	sjmp	00104$
      0003F7                        827 00101$:
      0003F7 85 34 81         [24]  828 	MOV SP, 0x34 
      0003FA 80 0D            [24]  829 	sjmp	00106$
      0003FC                        830 00102$:
      0003FC 85 35 81         [24]  831 	MOV SP, 0x35 
      0003FF 80 08            [24]  832 	sjmp	00106$
      000401                        833 00103$:
      000401 85 36 81         [24]  834 	MOV SP, 0x36 
      000404 80 03            [24]  835 	sjmp	00106$
      000406                        836 00104$:
      000406 85 37 81         [24]  837 	MOV SP, 0x37 
      000409                        838 00106$:
      000409 D0 D0            [24]  839 	POP PSW 
      00040B D0 83            [24]  840 	POP DPH 
      00040D D0 82            [24]  841 	POP DPL 
      00040F D0 F0            [24]  842 	POP B 
      000411 D0 E0            [24]  843 	POP ACC 
                                    844 ;	preemtive.c:370: }
      000413 22               [24]  845 	ret
                                    846 	.area CSEG    (CODE)
                                    847 	.area CONST   (CODE)
                                    848 	.area XINIT   (CODE)
                                    849 	.area CABS    (ABS,CODE)
