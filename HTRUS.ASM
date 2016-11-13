MAGIC_Code    EQU 5651h
MAGIC_Answer  EQU 7801h
MAGIC_Disable EQU 7800h
HTRUS_Version EQU 0402h

Disabled_Key_ EQU 0BEBh
Extended_Key_ EQU 0B73h
Normal_Key_   EQU 0B72h
Both_Key_     EQU 9090h

MOV_Operation EQU 8800h
XOR_Operation EQU 3000h
AND_Operation EQU 2000h
OR_Operation  EQU 0800h

.286P
MASM
JUMPS
Code segment para use16 'CODE'
 Assume cs:Code, ds:Code
  Org 100h

Start:
 Old09 label dword
 jmp Install
 db (?)

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³                ¥à¥¬¥­­ë¥ ¤«ï ¢á¥å äã­ªæ¨©                 ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³  Ext      db (0)  ³
 ³  Pressed  db (0)  ³
 ³  Cyrylic  db (0)  ³
 ³  BordCol  db (0)  ³
 ³           db (1)  ³
 ³           db (2)  ³
 ³           db (2)  ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³               ’ ¡«¨æ  ¯¥à¥ª®¤¨à®¢ª¨ á¨¬¢®«®¢               ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³  OrdTbl   label byte                              ³
 ³    db    27                                       ³
 ³    db    '1','2','3','4','5','6','7','8','9','0'  ³
 ³    db    '-','=', 8 , 9 ,'©','æ','ã','ª','¥','­'  ³
 ³    db    '£','è','é','§','å','ê',13 , 0 ,'ä','ë'  ³
 ³    db    '¢',' ','¯','à','®','«','¤','¦','í',')'  ³
 ³    db     0 ,'\','ï','ç','á','¬','¨','â','ì','¡'  ³
 ³    db    'î','ñ'                                  ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 Ord_SIZE EQU $-OrdTbl
ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³    ’ ¡«¨æ  ¯¥à¥ª®¤¨à®¢ª¨ á¨¬¢®«®¢ ¤«ï à¥¦¨¬   <SHIFT>      ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³  CpsTbl   label byte                              ³
 ³    db    27                                       ³
 ³    db    '!','"','/','$',':',',','.',';','?','%'  ³
 ³    db    '_','+', 8 , 0 ,'‰','–','“','Š','…',''  ³
 ³    db    'ƒ','˜','™','‡','•','š',13 , 0 ,'”','›'  ³
 ³    db    '‚','€','','','','‹','„','†','','('  ³
 ³    db     0 ,'|','Ÿ','—','‘','Œ','ˆ','’','œ',''  ³
 ³    db    '','ğ'                                  ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 Cps_SIZE EQU $-CpsTbl
ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³             ’ ¡«¨æ  ¯¥à¥ª®¤¨à®¢ª¨ á¨¬¢®«®¢ Alt             ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³  AltTbl   label byte                              ³
 ³    db    27                                       ³
 ³    db    '1','2','3','4','5','6','7','8','9','0'  ³
 ³    db    '-','=', 8 , 9 ,'Ú','Â','¿','Ö','Ò','·'  ³
 ³    db    '³','Ä','º','Í','[',']',13 , 0 ,'Ã','Å'  ³
 ³    db    '´','Ç','×','¶','°','±','²',';', 39,'`'  ³
 ³    db     0 ,'\','À','Á','Ù','Ó','Ğ','½','û',','  ³
 ³    db    '.','/'                                  ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 Alt_SIZE EQU $-AltTbl
ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³           ’ ¡«¨æ  ¯¥à¥ª®¤¨à®¢ª¨ á¨¬¢®«®¢ Alt+SHIFT         ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³  AlsTbl   label byte                              ³
 ³    db    27                                       ³
 ³    db    '!','@','#','$','%','^','&','*','(',')'  ³
 ³    db    '_','+', 8 , 0 ,'É','Ë','»','Õ','Ñ','¸'  ³
 ³    db    'Û','Ü','İ','Ş','{','}',13 , 0 ,'Ì','Î'  ³
 ³    db    '¹','Æ','Ø','µ','ß','ş','ı',':', 34,'~'  ³
 ³    db     0 ,'|','È','Ê','¼','Ô','Ï','¾','ü','<'  ³
 ³    db    '>','?'                                  ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 Als_SIZE EQU $-AlsTbl
ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³        ¡à ¡®âç¨ª Int 09 (¯à¥àë¢ ­¨¥ ®â ª« ¢¨ âãàë)        ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

 Int09 proc far
  pusha
  push ds es
  push cs
  pop ds
  in  al,60h
  cmp al,0E0h
  jne No_Extended
  or  byte ptr [Ext],00000111b
  jmp short Int09_Inherited
 No_Extended:
  mov cl,byte ptr [Ext]

  rcr cl,1                             ; ¥à¢ ï ª« ¢¨è  ¯¥à¥ª«îç¥­¨ï.
 First_Ext_Type:
  jc  First_Key_Done
 First_Key_Press_Code:
  cmp al,036h                          ; 01Dh
  je  GoWork
 First_Key_Release_Code:
  cmp al,0B6h                          ; 09Dh
 First_Switch_Type:
  mov bx,3001h                         ; xor 01 (/m0,/m1); mov 01 (/m3)
  je  Break
 First_Key_Done:

  rcr cl,1                             ; ‚â®à ï ª« ¢¨è  ¯¥à¥ª«îç¥­¨ï.
 Second_Ext_Type:
  jmp Second_Key_Done
 Second_Key_Press_Code:
  cmp al,02Ah                          ; 02Ah
  je  GoWork
 Second_Key_Release_Code:
  cmp al,0AAh                          ; 0AAh
 Second_Switch_Type:
  mov bx,8800h                         ; mov 00
  je  Break
 Second_Key_Done:

  rcr cl,1                             ; ’à¥âìï ª« ¢¨è  ¯¥à¥ª«îç¥­¨ï.
 Third_Ext_Type:
  jnc Third_Key_Done
 Third_Key_Press_Code:
  cmp al,038h                          ; 038h
  je  GoWork
 Third_Key_Release_Code:
  cmp al,000h                          ; 0B8h
 Third_Switch_Type:
  mov bx,3002h                         ; xor 02
  je  Break
 Third_Key_Done:

  jmp Short Clear

 GoWork:
  mov byte ptr [Pressed],1
  jmp short Cl_Ext
 Break:
  mov byte ptr [Operation_Type],bh
  cmp byte ptr [Pressed],1
  jne Cl_Ext
  jmp $+2
 Operation_Type:
  mov byte ptr [Cyrylic],bl
  
  call Set_Border

 Clear:
  mov byte ptr [Pressed],0
 Cl_Ext:
  and byte ptr [Ext],11111000b
 Int09_Inherited:
  push 40h
  pop es
 AutoIns_Code:
  and byte ptr es:[18h],0FFh
  mov si,word ptr es:[1Ch]
  pushf
  call dword ptr [Old09]
  mov dx,word ptr es:[17h]
  ;test dx,0000000000001101            ; <RShift><Ctrl><Alt>
  ;jne No_Load_Default
  ;pusha
  ;xor byte ptr [Ext],00010000b
  ;mov ax,word ptr [AXForSetMode]
  ;xor bl,bl
  ;int 10h
  ;popa
;No_Load_Default:
  
ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³            à®æ¥¤ãà  âà ­á«ïæ¨¨ ª®¤®¢ á¨¬¢®«®¢             ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

  cmp si,word ptr es:[1Ch]
  je  Int09_Exit
  mov ax,word ptr es:[si]
  mov al,ah
  or  al,al
  jz  Int09_Exit
  cmp al,53
  ja  Int09_Exit
  
  test dx,0000001100001100b            ; Alt, Ctrl ?
  jnz Int09_Exit
  test byte ptr [Cyrylic],00000011b    ; Work ?
  jz  Int09_Exit
  mov di,(offset OrdTbl)-1
  xor bx,bx
  test byte ptr [Cyrylic],00000010b
  jz  No_Alt_Key
  mov di,(offset AltTbl)-1
 No_Alt_Key:
                ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ; Left  Shift Ä¿
                ³ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ; Rihgt Shift ÄÙ
  test dl,00000011b
  jz  No_Shift_Key                     ; …á«¨ ­¥ ­ ¦ â ­¨ª ª®© <SHIFT>.
  xor bx,Ord_SIZE                      ; ‘¬¥­¨âì â ¡«¨æã.
 No_Shift_Key:
  cmp al,15                            ; à®¢¥àª  ­  ­¥§ ¢¨á¨¬®áâì ®â <Caps>.
  jbe Do_Translate
  cmp al,41                            ; à®¢¥àª  ­  ­¥§ ¢¨á¨¬®áâì ®â <Caps>.
  je  Do_Translate
  cmp al,43                            ; à®¢¥àª  ­  ­¥§ ¢¨á¨¬®áâì ®â <Caps>.
  je  Do_Translate
  test dl,40h                          ; Caps Lock ?
  jz  Do_Translate
  xor bx,Ord_SIZE                      ; ‘¬¥­¨âì â ¡«¨æã.
 Do_Translate:
  add bx,di
  xlat
  cmp al,127
  jbe No_Zero_AH
  xor ah,ah
 No_Zero_AH:
  mov word ptr es:[si],ax

 Int09_Exit:
  pop es ds
  popa
  iret
 Int09 endp

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³             à®æ¥¤ãà  ãáâ ­®¢ª¨ ¡®à¤¥à  íªà ­              ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

 Set_Border proc near
  pusha
  mov dx,3DAh
  in  al,dx
  mov dl,0C0h
  mov al,11h
  out dx,al
  xor bh,bh
  mov bl,[Cyrylic]
  mov al,byte ptr [BordCol+bx]
  out dx,al
  mov al,20h
  out dx,al
  popa
  ret
 Set_Border endp

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³     Š®¤ á íâ®£® ¬¥áâ  ­¥ ­ã¦¥­ ¤«ï ¤à ©¢¥à  ª« ¢¨ âãàë     ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

OnlyKeyboard label word

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³          ‚áïª ï ¤à¥¡¥¤¥­ì ¤«ï ®¡à ¡®âç¨ª  Int 10           ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³  AXForSetMode dw  0   ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³         ¥à¥¬¥­­ë¥, ¨á¯®«ì§ã¥¬ë¥ ¤«ï à ¡®âë á XMS          ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³  XMSEntry     dd (?)  ³
 ³  Handle       dw (?)  ³
 ³  Count        db (0)  ³
 ³  SizeCh       db (0)  ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³             ‘âàãªâãà  ¤«ï ¯¥à¥­®á  ¡«®ª®¢ XMS              ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³  Len          dd   0  ³
 ³  SourceHandle dw   0  ³
 ³  SourceOffs   dd   0  ³
 ³  DestHandle   dw   0  ³
 ³  DestOffs     dd   0  ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³              ¡à ¡®âç¨ª Int 10 (¢¨¤¥®á¥à¢¨á)               ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

  Old10        dd (?)

 Int10 proc far
  or  ah,ah
  jz  BIOSSetMode
  cmp ah,11h
  je  BIOSLoadFonts
  cmp ax,4F02h
  je  BIOSSetMode
  cmp ax,MAGIC_Code                    ; ¯à¥¤¥«¥­¨¥ ãáâ ­®¢ª¨.
  je  Check_Install_Resident
  jmp dword ptr cs:[Old10]

Check_Install_Resident:
  push cs                              ; ‚®§¢à é ¥â ¢ ES:DI  ¤à¥á
  pop  es                              ; ¤«ï à¥§¨¤¥­â­®© ¯®àæ¨¨.
  xor di,di                            ; „«ï HMA à¥§¨¤¥­â  DI <> 0.
  mov ax,MAGIC_Answer
  mov bx,HTRUS_Version
  iret

BIOSSetMode:
  mov word ptr cs:[AXForSetMode],ax
  pushf
  call dword ptr cs:[Old10]
  push ds
  push cs
  pop  ds

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³           Š®¤ á íâ®£® ¬¥áâ  § ¢¨á¨¬ ®â  ¤ ¯â¥à             ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

 Display_Depended:
  pusha
  mov dx,3CEh
  mov al,06h
  out dx,al
  inc dx
  in  al,dx
  and al,1
  jnz NoControlFonts
  push ds
  push 0
  pop ds
  mov al,byte ptr ds:[485h]            ; —¨á«® áâà®ª ¢ á¨¬¢®«¥.
  mov bl,byte ptr ds:[449h]            ; ®¬¥à ¢¨¤¥®à¥¦¨¬ .
  pop ds
  sub bl,byte ptr [AXForSetMode]       ; à®¢¥à¨âì ­  § ¤à®çªã.
  jz  InTextMode                       ; …á«¨ à¥¦¨¬ ¢ª«îç¨«áï.
  cmp bl,80h                           ; € ¢¤àã£ ¯¥à¥ª«îç¥­¨¥
  je  InTextMode                       ; á á®åà ­¥­¨¥¬ ¢¨¤¥®¯ ¬ïâ¨ ?
  cmp word ptr [AXForSetMode],4F02h    ; VESA Set Mode
  jne NoControlFonts
InTextMode:
  cmp al,14
  mov al,8
  ;mov word ptr [AXForSetMode],1102h
  jb  No_Font_8x16
  ;mov word ptr [AXForSetMode],1104h
  ;ja  No_Font_8x14
  ;mov word ptr [AXForSetMode],1101h
;No_Font_8x14:
  mov al,16
No_Font_8x16:
  mov byte ptr [SizeCh],al
  mov al,0                             ; ‡ £àã§ª  èà¨äâ  ¯à¨ ¢ª«îç¥­¨¨
                                       ; ­®¢®£® à¥¦¨¬  á ¨á¯®«ì§®¢ ­¨¥¬
                                       ; ¯®¤äã­ªæ¨¨ 0.
  mov bl,0                             ; ˜à¨äâ ¢ 0 ¡ ­ª.
  jmp short ControlFonts
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

BIOSLoadFonts:
  push ds
  push cs
  pop  ds
  ;mov word ptr [AXForSetMode],ax
  push ax
  and al,11101111b
  cmp al,01h
  je Control8x16
  cmp al,02h
  je Control8x8
  cmp al,04h
  je Control8x16
  pop ax
  pop ds
  jmp dword ptr cs:[Old10]

Control8x16:
  mov al,16
  jmp short Control
Control8x8:
  mov al,08
Control:
  mov byte ptr [SizeCh],al
  pop ax
  pusha

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³         ‚ íâ®© â®çª¥ AL á®¤¥à¦¨â ­®¬¥à ¯®¤äã­ªæ¨¨,         ³Û³²³±³°³
³°³±³²³Û³           BL - ­®¬¥à ¡ ­ª  ¤«ï § £àã§ª¨ èà¨äâ .            ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

ControlFonts:
  and al,10h
  mov byte ptr [Load_Font_Sub_Function+1],al
  ;test byte ptr [Ext],00010000b
  ;jz  Need_Control_Fonts
  ;popa
  ;jmp dword ptr [Old10]
 ;Need_Control_Fonts:
  push es

  push cs
  pop  es

  mov al,byte ptr [SizeCh]
  mov byte ptr [Count],al

 NextBlock:
  mov ah,[Count]
  xor al,al                            ; AX=Count*256
  cmp byte ptr [SizeCh],08
  jne NoAdd
  add ax,4096
NoAdd:
  mov word ptr [SourceOffs],ax
  lea si,Len
  mov ah,0Bh
  push bx                              ; ‘®åà ­¨âì BL á ­®¬¥à®¬ ¡ ­ª .
  call dword ptr [XMSEntry]
  pop bx                               ; ‚®ááâ ­®¢¨âì BL á ­®¬¥à®¬ ¡ ­ª .
  xor bp,bp
  mov bh,byte ptr [SizeCh]
  mov cx,16
  cmp bh,08
  jne No32
  mov cx,32
No32:
  mov al,[Count]
  mul cl
  mov dx,ax
  
Load_Font_Sub_Function:
  mov ax,1100h                         ; 1100h
  push bx                              ; ‘®åà ­¨âì BL á ­®¬¥à®¬ ¡ ­ª .
  pushf
  call dword ptr [Old10]
  pop bx                               ; ‚®ááâ ­®¢¨âì BL á ­®¬¥à®¬ ¡ ­ª .
  dec byte ptr [Count]
  jge NextBlock

No_Control_Fonts:
  mov cl,byte ptr [SizeCh]             ; “áâ ­®¢¨âì à §¬¥à ªãàá®à .
  sub cl,2
  mov ch,cl
  sub ch,1
Cursor_Size EQU $-1                    ; Œ¥âª  ¯¥à¥¬¥­­®©.
  mov ah,01h
  int 10h
  pop es
NoControlFonts:
  popa
  call Set_Border
  pop ds
  sti
  retf 2
 Int10 endp

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³                 Š®¤ ¨­áâ ««ïæ¨¨ à¥§¨¤¥­â                   ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

Install:
 mov ax,cs
 mov ds,ax
 mov es,ax

 mov word ptr cs:[AXForSetMode],1104h

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³                 ¯à¥¤¥«¥­¨¥ ¢¨¤¥® ¤ ¯â¥à                   ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 
 ;jmp No_VGA                           ; „«ï ¯à®¢¥àª¨ EGA ª®¤  ­  VGA.
 ;jmp short Yes_VGA
 mov ax,1A00h
 int 10h
 cmp al,1Ah
 jne No_VGA
 cmp bl,7
 jl  No_VGA
 cmp bl,8
 jg  No_VGA
 jmp Short Yes_VGA
No_VGA:
 mov word ptr cs:[AXForSetMode],1101h
 or  byte ptr cs:[Ext],00001000b       ; ¨â ®§­ ç îé¨© ­ «¨ç¨¥ EGA.

 lea si,EGA_Code                       ; ¥à¥­®á ª®¤  ®¡à ¡®âª¨ ¢ª«îç¥­¨ï
 lea di,Display_Depended               ; ¢¨¤¥®à¥¦¨¬  ¤«ï EGA.
 mov cx,EGA_Code_Size
 cld
 rep movsb

 lea si,$EGA_Code                      ; ¥à¥­®á ª®¤  ®¡à ¡®âª¨ ¢ª«îç¥­¨ï
 lea di,$Display_Depended              ; ¢¨¤¥®à¥¦¨¬  ¤«ï EGA (HMA).
 mov cx,$EGA_Code_Size
 cld
 rep movsb

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³                 ¡­ àã¦¥­ ¢¨¤¥® ¤ ¯â¥à VGA                 ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

Yes_VGA:

 mov ah,30h
 int 21h
 cmp al,5                              ; à®¢¥à¨âì ¢¥àá¨î DOS.
 jb  Out_HMA_Memory
 mov ax,4A01h                          ; ‡ ¯à®á á¢®¡®¤­®© ¯ ¬ïâ¨ HMA.
 xor bx,bx                             ;   ¢áïª¨© á«ãç ©.
 int 2Fh
 cmp bx,HMA_Code_Size                  ; „«ï ­ ç «  ...
 jb  Out_HMA_Memory                    ; ï¬  ¬¥¬ë.
 mov byte ptr cs:[KReside],1 ; HMA
Out_HMA_Memory:

 mov ax,0003h
 int 10h
 mov ax,0500h
 int 10h

 mov ax,cs
 mov ds,ax
 mov es,ax

 xor ch,ch
 mov bx,81h

 mov cl,byte ptr cs:[80h]              ; Command Line Len
 or  cl,cl
 jz  DoneLine
 add cx,bx

NextChar:
 mov al,byte ptr cs:[bx]
 cmp al,'/'
 je  ProcessParam
 cmp al,'-'
 je  ProcessParam
 cmp al,'?'
 je  SetHelp
 inc bx
 cmp bx,cx
 jae DoneLine
 jmp NextChar

ProcessParam:
 inc bx
 mov al,byte ptr cs:[bx]
 call UpCaseChar

 cmp al,'N'
 je  SetNumLock

 cmp al,'F'
 je  SetFast

 cmp al,'M'
 je  SetMetod

 cmp al,'K'
 je  SetKey

 cmp al,'X'
 je  SetXMSLocation

 cmp al,'S'
 je  SetSwitchers

 ;cmp al,'l'
 ;je  SetShadowFont
 ;cmp al,'L'
 ;je  SetShadowFont

 cmp al,'A'
 je  Enable_Alternate

 cmp al,'?'
 je  SetHelp
 ;cmp al,'H'
 ;je  SetHelp

 cmp al,'R'
 je  SetRelease

 cmp al,'B'
 je  SetBorder

 cmp al,'D'
 je  SetDefault

 cmp al,'I'
 je  SetAutoIns

 cmp al,'C'
 je  SetCursor

 jmp ErrorInCommand

SetCursor:
 or  byte ptr cs:[Change_Param][1],01000000b
 push ax cx
 call Decode_Dec
 and al,00000111b
 dec al
 mov byte ptr cs:[Cursor_Size],al
 mov cl,16-2
 test byte ptr cs:[Ext],00001000b       ; ¨â ®§­ ç îé¨© ­ «¨ç¨¥ EGA.
 jz  No_EGA_Cursor
 mov cl,14-2
No_EGA_Cursor:
 mov ch,cl
 sub ch,al
 mov ah,01h
 pusha
 int 10h
 popa
 pop cx ax
 jmp NextChar

SetAutoIns:
 or  byte ptr cs:[Change_Param],01000000b
 inc bx
 push ax
 mov al,7Fh
 cmp byte ptr cs:[bx],'-'
 jne No_Disable_AutoIns
 mov al,0FFh
 inc bx
 jmp short S_A_No_inc_bx
No_Disable_AutoIns:
 cmp byte ptr cs:[bx],'+'
 jne S_A_No_inc_bx
 inc bx
S_A_No_inc_bx:
 mov byte ptr cs:[AutoIns_Code+5],al
 pop ax
 jmp NextChar

Enable_Alternate:
 or  byte ptr cs:[Change_Param],00001000b
 inc bx
 push ax
 mov al,byte ptr cs:[Third_Key_Press_Code+1]
 or  al,80h
 cmp byte ptr cs:[bx],'-'
 jne No_Disable_Alt
 mov al,0
 inc bx
 jmp short E_A_No_inc_bx
No_Disable_Alt:
 cmp byte ptr cs:[bx],'+'
 jne E_A_No_inc_bx
 inc bx
E_A_No_inc_bx:
 mov byte ptr cs:[Third_Key_Release_Code+1],al
 pop ax
 jmp NextChar

SetHelp:
 inc bx
 mov byte ptr cs:[HelpFlag],1
 jmp NextChar

SetShadowFont:
 inc bx
 mov byte ptr cs:[LoadToShadow],1 ; Shadow
 jmp NextChar

SetKey:
 or  byte ptr cs:[Change_Param],00000010b
 cmp byte ptr cs:[bx+1],':'
 je  Set_Key_Layot
 mov ax,Normal_Key_
 cmp byte ptr cs:[bx+1],'E'
 je  Extended_Key
 cmp byte ptr cs:[bx+1],'e'
 je  Extended_Key
 cmp byte ptr cs:[bx+1],'B'
 je  Both_Key
 cmp byte ptr cs:[bx+1],'b'
 je  Both_Key
 jmp short No_Extended_Key

Extended_Key:
 mov ax,Extended_Key_
 inc bx
 jmp short No_Extended_Key
Both_Key:
 mov ax,Both_Key_
 inc bx
No_Extended_Key:
 mov word ptr cs:[First_Ext_Type],ax
 push cx
 push si
 xor ax,ax
 mov si,10
 xor ch,ch
SetKey_DecodeNumber:
 inc bx
 mov cl,byte ptr cs:[bx]
 sub cl,30h
 cmp cl,9
 ja  SetKey_Done
 mul si
 add ax,cx
 jmp short SetKey_DecodeNumber
SetKey_Done:
 and al,7Fh
 jz  Set_Key_Default

 call SetLamps
 mov byte ptr cs:[First_Key_Press_Code+1],al
 or  al,80h
 mov byte ptr cs:[First_Key_Release_Code+1],al
Set_Key_Default:
 pop si
 pop cx
 jmp NextChar

Set_Key_Layot:
 add bx,2
 call Decode_File_Name
 pusha
 mov ax,3D00h
 lea dx,File_Name
 int 21h
 jc  Set_K_L_Error_Open
 mov word ptr [File_Handle],ax
 mov bx,ax
 mov ax,4202h
 xor cx,cx
 xor dx,dx
 int 21h
 push dx ax
 mov ax,4200h
 mov bx,word ptr [File_Handle]
 xor cx,cx
 xor dx,dx
 int 21h
 pop ax dx
 or  dx,dx
 jnz Set_K_L_Error_Size
 cmp ax,53*4
 ja  Set_K_L_Error_Size
 mov cx,ax
 lea dx,OrdTbl
 mov bx,word ptr [File_Handle]
 mov ah,3Fh
 int 21h
 or  byte ptr [Change_Param],00010000b
Set_K_L_Error_Size:
 mov ah,3Eh
 mov bx,word ptr [File_Handle]
 int 21h
 popa
 jmp NextChar
Set_K_L_Error_Open:
 mov byte ptr cs:[HelpFlag],3
 popa
 jmp NextChar

SetRelease:
 inc bx
 or  byte ptr cs:[Change_Param],10000000b
 jmp NextChar

SetBorder:
 cmp byte ptr cs:[bx+1],'+'
 je  EnableBorder
 cmp byte ptr cs:[bx+1],'-'
 je  DisableBorder

 or  byte ptr cs:[Change_Param],00000001b
 push cx
 push si di
 xor di,di
SetBorder_Next_Number:
 xor ax,ax
 mov si,10
 xor ch,ch
SetBorder_DecodeNumber:
 inc bx
 mov cl,byte ptr cs:[bx]
 sub cl,30h
 cmp cl,9
 ja  SetBorder_Done
 mul si
 add ax,cx
 jmp short SetBorder_DecodeNumber
SetBorder_Done:
 mov cs:[BordCol+di],al
 cmp byte ptr cs:[bx],','
 jne SetBorder_Exit
 inc di
 cmp di,3
 jbe SetBorder_Next_Number
SetBorder_Exit:
 cmp di,2
 jne SetBorder_No_Fix
 mov al,byte ptr cs:[BordCol+di]
 mov byte ptr cs:[BordCol+di+1],al
SetBorder_No_Fix:
 pop di si
 pop cx
 jmp NextChar

EnableBorder:
 add bx,2
 or  byte ptr cs:[Change_Param],00100000b
 mov byte ptr cs:[Set_Border],60h      ; ‡ ¬¥­¨âì ­  PushA.
 mov byte ptr cs:[$Set_Border],60h     ; ‡ ¬¥­¨âì ­  PushA.
 jmp NextChar

DisableBorder:
 add bx,2
 or  byte ptr cs:[Change_Param],00100000b
 mov byte ptr cs:[Set_Border],0C3h     ; ‡ ¬¥­¨âì ­  Ret.
 mov byte ptr cs:[$Set_Border],0C3h    ; ‡ ¬¥­¨âì ­  Ret.
 pusha
 mov ax,1001h
 xor bh,bh
 int 10h
 popa
 jmp NextChar

SetNumLock:
 inc bx
 push ds
 push cx
 xor cx,cx
 mov ds,cx
 cmp byte ptr cs:[bx],'1'
 je  SetNumLock_NumLockOn
 cmp byte ptr cs:[bx],'+'
 je  SetNumLock_NumLockOn
 and byte ptr ds:[417h],11011111b
 jmp short Set_NumLock_Quit
SetNumLock_NumLockOn:
 or  byte ptr ds:[417h],00100000b
Set_NumLock_Quit:
 pop cx
 pop ds
 inc bx
 jmp NextChar

SetFast:
 inc bx
 cmp byte ptr cs:[bx],':'
 je  Set_External_Font
 push bx cx dx
 mov ax,0305h
 mov bx,0
 int 16h
 pop dx cx bx
 jmp NextChar

Set_External_Font:
 inc bx
 call Decode_File_Name
 pusha
 mov ax,3D00h
 lea dx,File_Name
 int 21h
 jc  Error_Open
 mov word ptr [File_Handle],ax
 mov bx,ax
 mov ax,4202h
 xor cx,cx
 xor dx,dx
 int 21h
 push dx ax
 mov ax,4200h
 mov bx,word ptr [File_Handle]
 xor cx,cx
 xor dx,dx
 int 21h
 pop ax dx
 or  dx,dx
 jnz Error_Size
 cmp ax,2048
 je  Font_File_8x8
 cmp ax,4096
 je  Font_File_8x16
 cmp ax,3584
 je  Font_File_8x14
 jmp short Error_Size
Font_File_8x8:
 or  byte ptr [Change_Param][1],00000001b
 mov cx,2048
 lea dx,Font_8x8
 jmp short Load_Font
Font_File_8x16:
 or  byte ptr [Change_Param][1],00000100b
 mov cx,4096
 lea dx,Font_8x16
 jmp short Load_Font
Font_File_8x14:
 or  byte ptr [Change_Param][1],00000010b
 mov cx,3584
 lea dx,Font_8x14
Load_Font:
 mov bx,word ptr [File_Handle]
 mov ah,3Fh
 int 21h
Error_Size:
 mov ah,3Eh
 mov bx,word ptr [File_Handle]
 int 21h
 popa
 jmp NextChar
Error_Open:
 mov byte ptr cs:[HelpFlag],3
 popa
 jmp NextChar

SetMetod:
 inc bx
 or  byte ptr cs:[Change_Param],00000100b
 mov al,byte ptr cs:[bx]
 cmp al,'0'
 je  SetMetod_0                        ; Trigger Key
 cmp al,'1'
 je  SetMetod_1                        ; Trigger Key + L <SHIFT>
 cmp al,'2'
 je  SetMetod_2                        ; Duble Key
 jmp NextChar

SetMetod_0:
 pusha
 mov ax,XOR_Operation+01h              ; XOR
 mov word ptr cs:[First_Switch_Type+1],ax
 clc
 push cs
 pop es
 mov ax,Disabled_Key_
 mov bl,2Ah
 mov cx,MOV_Operation+00h
 call Set_Key_2
 popa
 jmp NextChar

SetMetod_1:
 pusha
 mov ax,XOR_Operation+01h              ; XOR
 mov word ptr cs:[First_Switch_Type+1],ax
 clc
 push cs
 pop es
 mov ax,Normal_Key_
 mov bl,2Ah
 mov cx,MOV_Operation+00h
 call Set_Key_2
 popa
 jmp NextChar

SetMetod_2:
 pusha
 mov ax,MOV_Operation+01h              ; XOR
 mov word ptr cs:[First_Switch_Type+1],ax
 clc
 push cs
 pop es
 mov ax,Normal_Key_
 mov bl,2Ah
 mov cx,MOV_Operation+00h
 call Set_Key_2
 popa
 jmp NextChar

SetSwitchers:
 inc bx
 mov al,byte ptr cs:[bx]
 add bx,2
 cmp al,'1'
 je  SetSW_1
 cmp al,'2'
 je  SetSW_2
 cmp al,'3'
 je  SetSW_3
 jmp ErrorInCommand

SetSW_1:
 or  byte ptr cs:[Change_Param][1],00001000b
 mov al,byte ptr cs:[bx]
 inc bx
 call UpCaseChar
 mov dx,Normal_Key_
 cmp al,'N'
 je  SetSW_1_1
 mov dx,Extended_Key_
 cmp al,'E'
 je  SetSW_1_1
 mov dx,Both_Key_
 cmp al,'B'
 je  SetSW_1_1
 mov dx,Disabled_Key_
 cmp al,','
 je  SetSW_1_2
SetSW_1_1:
 mov word ptr cs:[First_Ext_Type],dx
 inc bx                                ; à®¯ãáâ¨âì § ¯ïâãî.
SetSW_1_2:
 cmp byte ptr cs:[bx],','
 je  SetSW_1_3
 dec bx
 call Decode_Dec
 and al,7Fh
 mov byte ptr cs:[First_Key_Press_Code+1],al
 or  al,80h
 mov byte ptr cs:[First_Key_Release_Code+1],al
SetSW_1_3:
 inc bx
 mov al,byte ptr cs:[bx]
 inc bx
 mov dx,XOR_Operation
 cmp al,','
 je  SetSW_1_4
 inc bx
 call UpCaseChar
 mov dx,MOV_Operation
 cmp al,'M'
 je  SetSW_1_4
 mov dx,XOR_Operation
 cmp al,'X'
 je  SetSW_1_4
 mov dx,OR_Operation
 cmp al,'O'
 je  SetSW_1_4
 mov dx,AND_Operation
SetSW_1_4:
 mov ax,word ptr cs:[bx]
 cmp ah,'1'
 jne SetSW_1_6
 or  dl,1
SetSW_1_6:
 cmp al,'1'
 jne SetSW_1_7
 or  dl,2
SetSW_1_7:
 mov word ptr cs:[First_Switch_Type+1],dx
 add bx,2
 jmp NextChar

SetSW_2:
 or  byte ptr cs:[Change_Param][1],00010000b
 mov al,byte ptr cs:[bx]
 inc bx
 call UpCaseChar
 mov dx,Normal_Key_
 cmp al,'N'
 je  SetSW_2_1
 mov dx,Extended_Key_
 cmp al,'E'
 je  SetSW_2_1
 mov dx,Both_Key_
 cmp al,'B'
 je  SetSW_2_1
 mov dx,Disabled_Key_
 cmp al,','
 je  SetSW_2_2
SetSW_2_1:
 mov word ptr cs:[Second_Ext_Type],dx
 inc bx                                ; à®¯ãáâ¨âì § ¯ïâãî.
SetSW_2_2:
 cmp byte ptr cs:[bx],','
 je  SetSW_2_3
 dec bx
 call Decode_Dec
 and al,7Fh
 mov byte ptr cs:[Second_Key_Press_Code+1],al
 or  al,80h
 mov byte ptr cs:[Second_Key_Release_Code+1],al
SetSW_2_3:
 inc bx
 mov al,byte ptr cs:[bx]
 inc bx
 mov dx,XOR_Operation
 cmp al,','
 je  SetSW_2_4
 inc bx
 call UpCaseChar
 mov dx,MOV_Operation
 cmp al,'M'
 je  SetSW_2_4
 mov dx,XOR_Operation
 cmp al,'X'
 je  SetSW_2_4
 mov dx,OR_Operation
 cmp al,'O'
 je  SetSW_2_4
 mov dx,AND_Operation
SetSW_2_4:
 mov ax,word ptr cs:[bx]
 cmp ah,'1'
 jne SetSW_2_6
 or  dl,1
SetSW_2_6:
 cmp al,'1'
 jne SetSW_2_7
 or  dl,2
SetSW_2_7:
 mov word ptr cs:[Second_Switch_Type+1],dx
 add bx,2
 jmp NextChar

SetSW_3:
 or  byte ptr cs:[Change_Param][1],00100000b
 mov al,byte ptr cs:[bx]
 inc bx
 call UpCaseChar
 mov dx,Normal_Key_
 cmp al,'N'
 je  SetSW_3_1
 mov dx,Extended_Key_
 cmp al,'E'
 je  SetSW_3_1
 mov dx,Both_Key_
 cmp al,'B'
 je  SetSW_3_1
 mov dx,Disabled_Key_
 cmp al,','
 je  SetSW_3_2
SetSW_3_1:
 mov word ptr cs:[Third_Ext_Type],dx
 inc bx                                ; à®¯ãáâ¨âì § ¯ïâãî.
SetSW_3_2:
 cmp byte ptr cs:[bx],','
 je  SetSW_3_3
 dec bx
 call Decode_Dec
 and al,7Fh
 mov byte ptr cs:[Third_Key_Press_Code+1],al
 or  al,80h
 mov byte ptr cs:[Third_Key_Release_Code+1],al
SetSW_3_3:
 inc bx
 mov al,byte ptr cs:[bx]
 inc bx
 mov dx,XOR_Operation
 cmp al,','
 je  SetSW_3_4
 inc bx
 call UpCaseChar
 mov dx,MOV_Operation
 cmp al,'M'
 je  SetSW_3_4
 mov dx,XOR_Operation
 cmp al,'X'
 je  SetSW_3_4
 mov dx,OR_Operation
 cmp al,'O'
 je  SetSW_3_4
 mov dx,AND_Operation
SetSW_3_4:
 mov ax,word ptr cs:[bx]
 cmp ah,'1'
 jne SetSW_3_6
 or  dl,1
SetSW_3_6:
 cmp al,'1'
 jne SetSW_3_7
 or  dl,2
SetSW_3_7:
 mov word ptr cs:[Third_Switch_Type+1],dx
 add bx,2
 jmp NextChar

SetXMSLocation:
 inc bx
 mov byte ptr cs:[KReside],0           ; XMS
 jmp NextChar

SetDefault:                       ÚÂÂÄÄÄÄÄÄÄÄÄÄÄ ; All fonts.
 inc bx                           ³³³   ÚÄÄÄÄÄÄÄ ; Key layot.
 or  word ptr [Change_Param],0000011100010000b
 jmp NextChar

;SetShadowLocation:
; inc bx
; mov byte ptr cs:[KReside],2 ; Shadow
; jmp short NextChar

ErrorInCommand:
 mov byte ptr cs:[HelpFlag],2
 push cs
 push cs
 pop es
 pop ds

 ;lea bp,Err3
 ;mov cx,30
 ;mov bl,12
 ;mov dh,12
 ;mov dl,30
 ;call OutStr
 jmp Short DoneLine

DoneLine:

 cmp byte ptr cs:[HelpFlag],1
 je  No_Enable_HMA

 mov ax,MAGIC_Code
 int 10h                               ; ES:DI €¤à¥á à¥§¨¤¥­â .
 cmp ax,MAGIC_Disable
 jne No_Enable_HMA
 mov byte ptr cs:[Enable_Flag],1
 push cs
 push es
 pop ds
 pop es
 mov si,(offset Save_A_Int_09) - (offset HMA_Disabled)
 lea di,A_Int_09
 cld
 mov cx,2
 rep movsw
 lea di,A_Int_10
 mov cx,2
 rep movsw
 push cs
 push ds
 pop es
 pop ds
 lea si,HMA_Control[4]
 mov di,4
 mov cx,HMA_Control_Size-4
 cli
 rep movsb
 sti
 mov ax,0003h
 int 10h
 mov ax,0500h
 int 10h
No_Enable_HMA:

 mov ax,MAGIC_Code
 int 10h                               ; ES:DI €¤à¥á à¥§¨¤¥­â .
 cmp ax,MAGIC_Answer
 jne Dont_Get_Param
 mov ax,es
 mov byte ptr cs:[KReside],0
 cmp ax,0FFFFh
 jne Dont_Get_Param
 mov byte ptr cs:[KReside],1
Dont_Get_Param:

 mov ax,cs
 mov es,ax
 mov ds,ax

 test byte ptr [Ext],00001000b         ; EGA ?
 jz  Dont_Copy_Font

 mov dx,256                            ; ‚ EGA ¨á¯®«ì§ã¥âáï â®«ìª® 
 mov si,Offset Font_8x14               ; §­ ª®£¥­¥à â®àë 8x14 ¨ 8x8. ®íâ®¬ã
 mov di,Offset Font_8x16               ; ¢ §­ ª®£¥­¥à â®à 8x16 ª®¯¨àã¥âáï
                                       ; §­ ª®£¥­¥à â®à 8x14.
Up_8x16_NextChar:
 mov cx,14
 rep movsb
 inc di
 inc di
 dec dx
 jnz Up_8x16_NextChar

 ; mov byte ptr cs:[Load_Font_Sub_Function+1],10h
 ; „«ï ¯p ¢¨«ì­®© p ¡®âë ­  EGA .
Dont_Copy_Font:
 test byte ptr [Change_Param][1],00000100b ; ˆ§¬¥­¨âì èà¨äâ 8x16.
 jnz  Want_Load_Font

 test byte ptr [Ext],00001000b         ; EGA ?
 jz   Check_Install

 test byte ptr [Change_Param][1],00000010b ; ˆ§¬¥­¨âì èà¨äâ 8x14.
 jnz  Want_Load_Font

Check_Install:
 mov ax,MAGIC_Code
 int 10h                               ; ES:DI €¤à¥á à¥§¨¤¥­â .
 cmp ax,MAGIC_Answer
 je  Dont_Load_Font

Want_Load_Font:
 mov ax,cs
 mov es,ax
 mov ds,ax
 lea bp,Font_8x16
 mov cx,256
 xor dx,dx
 mov bx,1000h
 mov ax,1100h
 int 10h

Dont_Load_Font:
 mov ax,cs
 mov es,ax
 mov ds,ax

 lea bp,Hello
 mov bl,14
 mov cx,80*15
 cmp byte ptr cs:[HelpFlag],1
 je  Yes_Help
 cmp byte ptr cs:[HelpFlag],2
 je  Yes_Help
 jmp short No_Help
Yes_Help:
 add cx,80*8                           ; …á«¨ § ¯à è¨¢ ¥âáï Help â®
No_Help:                               ; ¢ë¢¥áâ¨ ­  íªà ­ ¡®«ìè¥ áâà®ª.
 xor dx,dx
 call OutStr

 xor ax,ax
 push ds
 push es
 mov ds,ax
 les bx,dword ptr ds:[10h*4]           ; Int 10h pointer
 mov ax,es
 cmp ax,0A000h
 ja  NotLocked
 pop es
 pop ds
 lea bp,BType3
 mov cx,30
 mov bl,0Ah
 mov dh,8
 mov dl,30
 call OutStr
 jmp short I_Cont1
NotLocked:
 mov al,byte ptr es:[bx]
 mov ah,al
 sub ah,10h
 mov byte ptr es:[bx],ah
 mov cl,byte ptr es:[bx]
 mov byte ptr es:[bx],al
 pop es
 pop ds
 cmp ah,cl
 je  Shadow
 mov byte ptr ds:[ShadowFlag],0
 lea bp,BType1
 mov cx,30
 mov bl,0Ah
 mov dh,8
 mov dl,30
 call OutStr

 jmp short I_Cont1

Shadow:
 mov byte ptr ds:[ShadowFlag],1
 lea bp,BType2
 mov cx,30
 mov bl,0Ah
 mov dh,8
 mov dl,30
 call OutStr

I_Cont1:
 cmp byte ptr cs:[LoadToShadow],1
 jne NoShadowFont
 push es
 mov ax,1130h
 mov bh,6
 int 10h
 mov al,byte ptr es:[bp]
 mov ah,al
 sub ah,10h
 mov byte ptr es:[bp],ah
 mov cl,byte ptr es:[bp]
 mov byte ptr es:[bp],al
 pop es
 cmp ah,cl
 jne NoShadowFont

 push es
 mov ax,1130h
 mov bh,3
 int 10h
 mov al,byte ptr es:[bp]
 mov ah,al
 sub ah,10h
 mov byte ptr es:[bp],ah
 mov cl,byte ptr es:[bp]
 mov byte ptr es:[bp],al
 pop es
 cmp ah,cl
 je  ShadowFont

NoShadowFont:
 mov byte ptr ds:[ShadowFontFlag],0
 lea bp,FType1
 cmp byte ptr ds:[KReside],1           ; HMA ?
 jne NoHMAFont                         ; …á«¨ ­¥â â® ®áâ ¢¨âì áâ à®¥.
 lea bp,FType2
NoHMAFont:
 mov cx,30
 mov bl,0Ah
 mov dh,9
 mov dl,30
 call OutStr

 jmp short I_Cont2

ShadowFont:
 mov byte ptr ds:[ShadowFontFlag],1
 lea bp,FType3
 mov cx,30
 mov bl,0Ah
 mov dh,9
 mov dl,30
 call OutStr

I_Cont2:

 push es
 mov ax,0FFFFh
 mov es,ax
 mov bp,5
 mov cx,8
 mov bl,0Ah
 mov dh,11
 mov dl,30
 call OutStr
 pop es

 push cs
 push cs
 pop ds
 pop es

 cmp byte ptr cs:[KReside],0
 jne NotRAM
 lea bp,KType1
 jmp short OutKStatus

NotRAM:
 cmp byte ptr cs:[KReside],1
 jne NotHMA
 lea bp,KType2
 jmp short OutKStatus

NotHMA:
 lea bp,KType3

OutKStatus:
 mov cx,30
 mov bl,0Ah
 mov dh,10
 mov dl,30
 call OutStr

 lea bp,IType3
 cmp byte ptr cs:[HelpFlag],1
 je  DisplayHelpStatus
 lea bp,Err3
 cmp byte ptr cs:[HelpFlag],2
 je  DisplayHelpStatus
 lea bp,Err4
 cmp byte ptr cs:[HelpFlag],3
 je  DisplayHelpStatus
 jmp short NoHelpStatus
DisplayHelpStatus:
 mov cx,30
 mov bl,12
 mov dh,12
 mov dl,30
 call OutStr

 jmp Quit

NoHelpStatus:
 mov ax,4310h
 int 2Fh
 mov word ptr cs:[XMSEntry + 0],bx
 mov word ptr cs:[XMSEntry + 2],es
 mov word ptr cs:[XMS_Call + 0],bx
 mov word ptr cs:[XMS_CAll + 2],es
 mov ax,MAGIC_Code
 int 10h                               ; ES:DI €¤à¥á à¥§¨¤¥­â .
 cmp ax,MAGIC_Answer
 je Installed
 jmp NotInstalled

Installed:
 push cs
 pop ds
 cmp word ptr [Change_Param],0
 jne Change_Parameters
 jmp Wrong_Install

Change_Parameters:
 mov ax,es
 cmp ax,0FFFFh
 je  Change_HMA_Parameters
 test byte ptr [Change_Param],00000001b   ; ˆ§¬¥­¨âì æ¢¥â ¡®à¤¥à  íªà ­ 
 jz  No_Change_Border
 mov ax,word ptr [BordCol][0]
 mov word ptr es:[BordCol][0],ax       ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
 mov ax,word ptr [BordCol][2]
 mov word ptr es:[BordCol][2],ax       ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
 push ds
 push es                               ; Set_Border ®âà ¡®â ¥â á
 pop ds                                ; ¯¥à¥¬¥­­ë¬¨ à¥§¨¤¥­â­®©
 call Set_Border                       ; ç áâ¨.
 pop ds
No_Change_Border:

 test byte ptr [Change_Param],00000010b   ; ˆ§¬¥­¨âì ª ¢¨èã ¯¥à¥ª«îç¥­¨ï
 jz  No_Change_Key
 mov al,byte ptr [First_Key_Press_Code+1]
 mov byte ptr es:[First_Key_Press_Code+1],al       ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
 mov al,byte ptr [First_Key_Release_Code+1]
 mov byte ptr es:[First_Key_Release_Code+1],al     ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
 mov ax,word ptr [First_Ext_Type]
 mov word ptr es:[First_Ext_Type],ax
No_Change_Key:

 test byte ptr [Change_Param],00000100b
 jz  No_Change_Metod
 mov ax,word ptr [First_Switch_Type+1]
 mov word ptr es:[First_Switch_Type+1],ax          ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
 mov ax,word ptr [Second_Switch_Type+1]
 mov word ptr es:[Second_Switch_Type+1],ax         ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
 mov ax,word ptr [Second_Ext_Type]
 mov word ptr es:[Second_Ext_Type],ax              ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
 mov al,byte ptr [Second_Key_Press_Code+1]
 mov byte ptr es:[Second_Key_Press_Code+1],al      ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
 mov al,byte ptr [Second_Key_Release_Code+1]
 mov byte ptr es:[Second_Key_Release_Code+1],al    ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
No_Change_Metod:

 test byte ptr [Change_Param],00001000b
 jz  No_D_E_Alt
 mov al,byte ptr [Third_Key_Release_Code+1]
 mov byte ptr es:[Third_Key_Release_Code+1],al   ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
No_D_E_Alt:

 test byte ptr [Change_Param],00010000b   ; ˆ§¬¥­¨âì à áª« ¤ªã ª« ¢¨ âãàë.
 jz  No_Change_Layot
 lea si,OrdTbl
 mov di,si
 mov cx,53*4
 cld
 rep movsb
No_Change_Layot:

 test byte ptr cs:[Change_Param],00100000b
 jz  No_Change_Indicator
 mov al,byte ptr cs:[Set_Border]
 mov byte ptr es:[Set_Border],al
 push ds
 push es                               ; Set_Border ®âà ¡®â ¥â á
 pop ds                                ; ¯¥à¥¬¥­­ë¬¨ à¥§¨¤¥­â­®©
 call Set_Border                       ; ç áâ¨.
 pop ds
No_Change_Indicator:

 test byte ptr [Change_Param][1],00000001b ; ˆ§¬¥­¨âì èà¨äâ 8x8.
 jz  No_Change_Font8x8
 mov dx,word ptr es:[SourceHandle]         ; XMS Handler ¤«ï èà¨äâ®¢.
 push es
 mov ax,cs
 mov ds,ax
 mov es,ax
 mov ax,1024*2
 mov word ptr ds:[Len],ax
 mov word ptr ds:[DestHandle],dx
 mov word ptr ds:[DestOffs][0],1024*4
 mov word ptr ds:[DestOffs][2],0
 lea ax,Font_8x8
 mov word ptr ds:[SourceHandle],0
 mov word ptr ds:[SourceOffs][0],ax
 mov ax,cs
 mov word ptr ds:[SourceOffs][2],ax
 lea si,Len
 mov ah,0Bh
 call dword ptr cs:[XMSEntry]
 pop es
No_Change_Font8x8:

 test byte ptr [Change_Param][1],00000110b ; ˆ§¬¥­¨âì èà¨äâ 8x16 ¨«¨ 8x14.
 jz  No_Change_Font8x16
 mov dx,word ptr es:[SourceHandle]         ; XMS Handler ¤«ï èà¨äâ®¢.
 push es
 mov ax,cs
 mov ds,ax
 mov es,ax
 mov ax,1024*4
 mov word ptr ds:[Len],ax
 mov word ptr ds:[DestHandle],dx
 xor ax,ax
 mov word ptr ds:[DestOffs][0],ax
 mov word ptr ds:[DestOffs][2],ax
 lea ax,Font_8x16
 mov word ptr ds:[SourceHandle],0
 mov word ptr ds:[SourceOffs][0],ax
 mov ax,cs
 mov word ptr ds:[SourceOffs][2],ax
 lea si,Len
 mov ah,0Bh
 call dword ptr cs:[XMSEntry]
 pop es
No_Change_Font8x16:

 test byte ptr [Change_Param][1],00001000b ; ˆ§¬¥­¨âì SW 1.
 jz  No_Change_SW_1
 mov ax,word ptr [First_Ext_Type]
 mov word ptr es:[First_Ext_Type],ax
 mov al,byte ptr [First_Key_Press_Code+1]
 mov byte ptr es:[First_Key_Press_Code+1],al
 mov al,byte ptr [First_Key_Release_Code+1]
 mov byte ptr es:[First_Key_Release_Code+1],al
 mov ax,word ptr [First_Switch_Type+1]
 mov word ptr es:[First_Switch_Type+1],ax
No_Change_SW_1:

 test byte ptr [Change_Param][1],00010000b ; ˆ§¬¥­¨âì SW 2.
 jz  No_Change_SW_2
 mov ax,word ptr [Second_Ext_Type]
 mov word ptr es:[Second_Ext_Type],ax
 mov al,byte ptr [Second_Key_Press_Code+1]
 mov byte ptr es:[Second_Key_Press_Code+1],al
 mov al,byte ptr [Second_Key_Release_Code+1]
 mov byte ptr es:[Second_Key_Release_Code+1],al
 mov ax,word ptr [Second_Switch_Type+1]
 mov word ptr es:[Second_Switch_Type+1],ax
No_Change_SW_2:

 test byte ptr [Change_Param][1],00100000b ; ˆ§¬¥­¨âì SW 3.
 jz  No_Change_SW_3
 mov ax,word ptr [Third_Ext_Type]
 mov word ptr es:[Third_Ext_Type],ax
 mov al,byte ptr [Third_Key_Press_Code+1]
 mov byte ptr es:[Third_Key_Press_Code+1],al
 mov al,byte ptr [Third_Key_Release_Code+1]
 mov byte ptr es:[Third_Key_Release_Code+1],al
 mov ax,word ptr [Third_Switch_Type+1]
 mov word ptr es:[Third_Switch_Type+1],ax
No_Change_SW_3:

 test byte ptr [Change_Param],01000000b ; ˆ§¬¥­¨âì Auto Insert
 jz  No_Change_AutoIns
 mov al,byte ptr [AutoIns_Code+5]
 mov byte ptr es:[AutoIns_Code+5],al
No_Change_AutoIns:

 test byte ptr [Change_Param][1],01000000b ; ˆ§¬¥­¨âì à §¬¥à ªãàá®à .
 jz  No_Change_Cursor
 mov al,byte ptr [Cursor_Size]
 mov byte ptr es:[Cursor_Size],al
No_Change_Cursor:

 test byte ptr [Change_Param],10000000b    ; ‚ë£àã§¨âì ¨§ ¯ ¬ïâ¨
 jnz Release_From_Memory
 jmp Cancel_Change
Release_From_Memory:

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³                     ‚ë£àã§ª  à¥§¨¤¥­â                      ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

 xor ax,ax
 mov ds,ax
 mov ax,es
 cmp ax,0FFFFh                         ; ¥§¨¤¥­â ¢ HMA.
 je  Cant_Release                      ; …á«¨ ¤  â® ­¥«ì§ï ¢ë£àã¦ âì.
 cmp word ptr ds:[9*4+2],ax            ; Segment Control
 jne Cant_Release
 cmp word ptr ds:[10h*4+2],ax          ; Segment Control
 jne Cant_Release

 cli

 mov ax,word ptr es:[Old09]
 mov word ptr ds:[9h*4],ax
 mov ax,word ptr es:[Old09+2]
 mov word ptr ds:[9h*4+2],ax

 mov ax,word ptr es:[Old10]
 mov word ptr ds:[10h*4],ax
 mov ax,word ptr es:[Old10+2]
 mov word ptr ds:[10h*4+2],ax

 sti

 push es

 mov dx,word ptr es:[Handle]
 mov ah,0Ah
 call dword ptr es:[XMSEntry]

 pop es

 mov ah,49h
 int 21h

 mov ax,1104h
 mov bl,0
 test byte ptr cs:[Ext],00001000b         ; EGA ?
 jz  No_Restore_EGA
 mov al,01h
No_Restore_EGA:
 int 10h

 mov ah,01h
 mov cx,0D0Eh
 int 10h

 mov ax,cs
 mov es,ax
 mov ds,ax

 lea bp,IType6
 mov cx,30
 mov bl,9
 mov dh,12
 mov dl,30
 call OutStr

 jmp Quit


ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³               ¥¢®§¬®¦­® ¢ë£àã§¨âì à¥§¨¤¥­â                ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

Cant_Release:
 mov ax,cs
 mov es,ax
 lea bp,IType5
 mov cx,30
 mov bl,12
 mov dh,12
 mov dl,30
 call OutStr

 jmp Quit

Change_HMA_Parameters:
 test byte ptr [Change_Param],00000001b   ; ˆ§¬¥­¨âì æ¢¥â ¡®à¤¥à  íªà ­ 
 jz  No_Change_HMA_Border
 mov ax,word ptr [BordCol][0]
 mov word ptr es:[$BordCol+di][0],ax       ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
 mov ax,word ptr [BordCol][2]
 mov word ptr es:[$BordCol+di][2],ax       ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
 push ds
 push es                                   ; Set_Border ®âà ¡®â ¥â á
 pop ds                                    ; ¯¥à¥¬¥­­ë¬¨ à¥§¨¤¥­â­®©
 call $Set_Border                          ; ç áâ¨.
 pop ds
No_Change_HMA_Border:

 test byte ptr [Change_Param],00000010b    ; ˆ§¬¥­¨âì ª ¢¨èã ¯¥à¥ª«îç¥­¨ï
 jz  No_Change_HMA_Key
 mov al,byte ptr [First_Key_Press_Code+1]
 mov byte ptr es:[$First_Key_Press_Code+1+di],al   ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
 mov al,byte ptr [First_Key_Release_Code+1]
 mov byte ptr es:[$First_Key_Release_Code+1+di],al ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
 mov ax,word ptr [First_Ext_Type]
 mov word ptr es:[$First_Ext_Type+di],ax
No_Change_HMA_Key:

 test byte ptr [Change_Param],00000100b
 jz  No_Change_HMA_Metod
 mov ax,word ptr [First_Switch_Type+1]
 mov word ptr es:[$First_Switch_Type+1+di],ax      ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
 mov ax,word ptr [Second_Switch_Type+1]
 mov word ptr es:[$Second_Switch_Type+1+di],ax     ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
 mov ax,word ptr [Second_Ext_Type]
 mov word ptr es:[$Second_Ext_Type+di],ax          ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
 mov al,byte ptr [Second_Key_Press_Code+1]
 mov byte ptr es:[$Second_Key_Press_Code+1+di],al  ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
 mov al,byte ptr [Second_Key_Release_Code+1]
 mov byte ptr es:[$Second_Key_Release_Code+1+di],al; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
No_Change_HMA_Metod:

 test byte ptr [Change_Param],00001000b
 jz  No_HMA_D_E_Alt
 mov al,byte ptr [Third_Key_Release_Code+1]
 mov byte ptr es:[$Third_Key_Release_Code+1+di],al ; ‚ à¥§¨¤¥­â­®© ¯®àæ¨¨.
No_HMA_D_E_Alt:

 test byte ptr [Change_Param],00010000b   ; ˆ§¬¥­¨âì à áª« ¤ªã ª« ¢¨ âãàë.
 jz  No_Change_HMA_Layot
 push di
 lea si,OrdTbl
 add di,offset $OrdTbl
 mov cx,53*4
 cld
 rep movsb
 pop di
No_Change_HMA_Layot:

 test byte ptr cs:[Change_Param],00100000b
 jz  No_Change_HMA_Indicator
 mov al,byte ptr cs:[Set_Border]
 mov byte ptr es:[$Set_Border+di],al
 push ds
 push es                               ; Set_Border ®âà ¡®â ¥â á
 pop ds                                ; ¯¥à¥¬¥­­ë¬¨ à¥§¨¤¥­â­®©
 call $Set_Border                      ; ç áâ¨.
 pop ds
No_Change_HMA_Indicator:

 test byte ptr [Change_Param][1],00000001b ; ˆ§¬¥­¨âì èà¨äâ 8x8.
 jz  No_Change_HMA_Font8x8
 push di
 lea si,Font_8x8
 add di,si
 mov cx,2048
 cld
 rep movsb
 pop di
No_Change_HMA_Font8x8:

test byte ptr [Change_Param][1],00000010b ; ˆ§¬¥­¨âì èà¨äâ 8x14.
 jz  No_Change_HMA_Font8x14
 push di
 lea si,Font_8x14
 add di,si
 mov cx,3584
 cld
 rep movsb
 pop di
No_Change_HMA_Font8x14:

 test byte ptr [Change_Param][1],00000100b ; ˆ§¬¥­¨âì èà¨äâ 8x16.
 jz  No_Change_HMA_Font8x16
 push di
 lea si,Font_8x16
 add di,si
 mov cx,4096
 cld
 rep movsb
 pop di
No_Change_HMA_Font8x16:

 test byte ptr [Change_Param][1],00001000b ; ˆ§¬¥­¨âì SW 1.
 jz  No_Change_HMA_SW_1
 mov ax,word ptr [First_Ext_Type]
 mov word ptr es:[$First_Ext_Type+di],ax
 mov al,byte ptr [First_Key_Press_Code+1]
 mov byte ptr es:[$First_Key_Press_Code+1+di],al
 mov al,byte ptr [First_Key_Release_Code+1]
 mov byte ptr es:[$First_Key_Release_Code+1+di],al
 mov ax,word ptr [First_Switch_Type+1]
 mov word ptr es:[$First_Switch_Type+1+di],ax
No_Change_HMA_SW_1:

 test byte ptr [Change_Param][1],00010000b ; ˆ§¬¥­¨âì SW 2.
 jz  No_Change_HMA_SW_2
 mov ax,word ptr [Second_Ext_Type]
 mov word ptr es:[$Second_Ext_Type+di],ax
 mov al,byte ptr [Second_Key_Press_Code+1]
 mov byte ptr es:[$Second_Key_Press_Code+1+di],al
 mov al,byte ptr [Second_Key_Release_Code+1]
 mov byte ptr es:[$Second_Key_Release_Code+1+di],al
 mov ax,word ptr [Second_Switch_Type+1]
 mov word ptr es:[$Second_Switch_Type+1+di],ax
No_Change_HMA_SW_2:

 test byte ptr [Change_Param][1],00100000b ; ˆ§¬¥­¨âì SW 3.
 jz  No_Change_HMA_SW_3
 mov ax,word ptr [Third_Ext_Type]
 mov word ptr es:[$Third_Ext_Type+di],ax
 mov al,byte ptr [Third_Key_Press_Code+1]
 mov byte ptr es:[$Third_Key_Press_Code+1+di],al
 mov al,byte ptr [Third_Key_Release_Code+1]
 mov byte ptr es:[$Third_Key_Release_Code+1+di],al
 mov ax,word ptr [Third_Switch_Type+1]
 mov word ptr es:[$Third_Switch_Type+1+di],ax
No_Change_HMA_SW_3:

 test byte ptr [Change_Param],01000000b ; ˆ§¬¥­¨âì Auto Insert
 jz  No_Change_HMA_AutoIns
 mov al,byte ptr [AutoIns_Code+5]
 mov byte ptr es:[$AutoIns_Code+5+di],al
No_Change_HMA_AutoIns:

 test byte ptr [Change_Param][1],01000000b ; ˆ§¬¥­¨âì à §¬¥à ªãàá®à .
 jz  No_Change_HMA_Cursor
 mov al,byte ptr [Cursor_Size]
 mov byte ptr es:[$Cursor_Size+di],al
No_Change_HMA_Cursor:

 test byte ptr [Change_Param],10000000b   ; ‚ë£àã§¨âì ¨§ ¯ ¬ïâ¨
 jnz Disable_HMA
 jmp Cancel_Change
Disable_HMA:
 mov ax,MAGIC_Code
 int 10h
 mov ax,word ptr es:[$Old09+di][0]
 mov word ptr cs:[O_Int_09][0],ax
 mov ax,word ptr es:[$Old09+di][2]
 mov word ptr cs:[O_Int_09][2],ax
 mov ax,word ptr es:[$Old10+di][0]
 mov word ptr cs:[O_Int_10][0],ax
 mov ax,word ptr es:[$Old10+di][2]
 mov word ptr cs:[O_Int_10][2],ax
 mov ds,dx
 push cs
 pop es
 mov si,(offset A_Int_09) - (offset HMA_Control)
 lea di,Save_A_Int_09
 cld
 mov cx,2
 rep movsw
 mov si,(offset A_Int_10) - (offset HMA_Control)
 mov cx,2
 rep movsw
 push cs
 push ds
 pop es
 pop ds
 lea si,HMA_Disabled[4]
 mov di,4
 cld
 mov cx,HMA_Disabled_Size-4
 cli
 rep movsb
 sti

 mov ax,1130h
 mov bh,4
 int 10h
 mov ax,es
 push 0
 pop es
 mov word ptr es:[1Fh*4][0],bp
 mov word ptr es:[1Fh*4][2],ax

 mov ax,1104h
 mov bl,0
 test byte ptr cs:[Ext],00001000b         ; EGA ?
 jz  No_Restore_EGA_HMA
 mov al,01h
No_Restore_EGA_HMA:
 int 10h

 mov ah,01h
 mov cx,0D0Eh
 int 10h

 mov ax,cs
 mov ds,ax
 mov es,ax

 lea bp,IType7
 mov cx,30
 mov bl,9
 mov dh,12
 mov dl,30
 call OutStr

 jmp Quit

Cancel_Change:
 mov ax,cs
 mov ds,ax
 mov es,ax
 lea bp,IType4
 mov cx,30
 mov bl,9
 mov dh,12
 mov dl,30
 call OutStr

 jmp Quit


Wrong_Install:
 mov ax,cs
 mov es,ax
 lea bp,IType1
 cmp byte ptr cs:[Enable_Flag],1
 jne No_Enable_Msg
 lea bp,IType8
No_Enable_Msg:
 mov cx,30
 mov bl,12
 mov dh,12
 mov dl,30
 call OutStr

 jmp Quit

NotInstalled:

 xor ax,ax
 mov ds,ax

 cli

 mov ax,word ptr ds:[09h*4]
 mov word ptr cs:[Old09],ax
 mov word ptr cs:[$Old09],ax
 mov word ptr cs:[$$Old09],ax
 mov ax,word ptr ds:[09h*4+2]
 mov word ptr cs:[Old09+2],ax
 mov word ptr cs:[$Old09+2],ax
 mov word ptr cs:[$$Old09+2],ax

 mov ax,word ptr ds:[10h*4]
 mov word ptr cs:[Old10],ax
 mov word ptr cs:[$Old10],ax
 mov word ptr cs:[$$Old10],ax
 mov ax,word ptr ds:[10h*4+2]
 mov word ptr cs:[Old10+2],ax
 mov word ptr cs:[$Old10+2],ax
 mov word ptr cs:[$$Old10+2],ax

 sti

 mov ax,cs
 mov ds,ax

 cmp byte ptr cs:[ShadowFontFlag],0
 je  No_Shadow_Font

 mov ax,1130h
 mov bh,6
 int 10h

 cld
 mov di,bp
 push cs
 pop ds
 lea si,Font_8x16
 mov cx,4096/2
 mov ax,word ptr es:[di]
 rep movsw
 xor ax,ax
 mov bx,word ptr es:[di]
 stosw

 mov ax,1130h
 mov bh,5
 int 10h

 mov cx,18*15/2
 mov di,bp
 xor ax,ax
 mov bx,word ptr es:[di]
 rep stosw

 mov ax,1130h
 mov bh,3
 int 10h

 mov di,bp
 lea si,Font_8x8
 mov cx,2048/2
 mov ax,word ptr es:[di]
 rep movsw

 mov ax,1130h
 mov bh,2
 int 10h

 mov di,bp
 lea si,Font_8x14
 mov cx,3584/2
 mov ax,word ptr es:[di]
 rep movsw

 mov ax,cs
 mov ds,ax
 mov es,ax

 jmp FontDataInstalled

No_Shadow_Font:
ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³                                                            ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 mov ax,4300h
 int 2Fh
 cmp al,80h
 je  XMSInstalled
 call Beep
 lea bp,Err1
 mov cx,30
 mov bl,12
 mov dh,12
 mov dl,30
 call OutStr
ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³   ‚®â §¤¥áì ­ ¤® á¤¥« âì ¯®¤¤¥à¦ªã èà¨äâ®¢ ¢ Low ¯ ¬ïâ¨    ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ;mov ax,cs
 ;mov ds,ax
 ;add ax,1000h

 jmp Quit

XMSInstalled:
 mov ax,4310h
 int 2Fh
 mov word ptr cs:[XMSEntry + 0],bx
 mov word ptr cs:[XMSEntry + 2],es
 mov word ptr cs:[XMS_Call + 0],bx
 mov word ptr cs:[XMS_CAll + 2],es

 cmp word ptr cs:[KReside],1           ; HMA ?
 jne FontInXMS

 mov ax,cs
 mov es,ax
 mov ds,ax
 lea si,OrdTbl
 lea di,$OrdTbl
 mov cx,53*4
 cld
 rep movsb

 mov al,byte ptr [Ext]
 mov byte ptr [$Ext],al

 mov al,byte ptr [Pressed]
 mov byte ptr [$Pressed],al

 mov al,byte ptr [Cyrylic]
 mov byte ptr [$Cyrylic],al

 mov ax,word ptr [BordCol][0]
 mov word ptr [$BordCol][0],ax
 mov ax,word ptr [BordCol][2]
 mov word ptr [$BordCol][2],ax

 mov ax,word ptr [First_Ext_Type]
 mov word ptr [$First_Ext_Type],ax
 mov al,byte ptr [First_Key_Press_Code][1]
 mov byte ptr [$First_Key_Press_Code][1],al
 mov al,byte ptr [First_Key_Release_Code][1]
 mov byte ptr [$First_Key_Release_Code][1],al
 mov ax,word ptr [First_Switch_Type][1]
 mov word ptr [$First_Switch_Type][1],ax

 mov ax,word ptr [Second_Ext_Type]
 mov word ptr [$Second_Ext_Type],ax
 mov al,byte ptr [Second_Key_Press_Code][1]
 mov byte ptr [$Second_Key_Press_Code][1],al
 mov al,byte ptr [Second_Key_Release_Code][1]
 mov byte ptr [$Second_Key_Release_Code][1],al
 mov ax,word ptr [Second_Switch_Type][1]
 mov word ptr [$Second_Switch_Type][1],ax

 mov ax,word ptr [Third_Ext_Type]
 mov word ptr [$Third_Ext_Type],ax
 mov al,byte ptr [Third_Key_Press_Code][1]
 mov byte ptr [$Third_Key_Press_Code][1],al
 mov al,byte ptr [Third_Key_Release_Code][1]
 mov byte ptr [$Third_Key_Release_Code][1],al
 mov ax,word ptr [Third_Switch_Type][1]
 mov word ptr [$Third_Switch_Type][1],ax

 mov al,byte ptr [AutoIns_Code][5]
 mov byte ptr [$AutoIns_Code][5],al

 mov al,byte ptr [Cursor_Size]
 mov byte ptr [$Cursor_Size],al

 mov ah,05h                            ; Local Enable line A20.
 call dword ptr cs:[XMSEntry]
 mov ax,4A02h                          ; ‡ ¯à®á ¡«®ª  HMA.
 mov bx,HMA_Code_Size
 int 2Fh                               ; ES:DI - €¤à¥á ¡«®ª .
 cmp bx,HMA_Code_Size
 jb  FontInXMS
 push di
 mov word ptr cs:[HMA_Block],di
 mov word ptr cs:[HMA_Block+2],es
 mov ax,cs
 mov ds,ax
 lea si,HMA_Code
 mov cx,HMA_Code_Size
 cld
 rep movsb
 pop di

 lea ax,$Int09-HMA_Code+[di]
 mov word ptr cs:[A_Int_09][0],ax
 mov ax,es
 mov word ptr cs:[A_Int_09][2],ax

 lea ax,$Int10-HMA_Code+[di]
 mov word ptr cs:[A_Int_10][0],ax
 mov ax,es
 mov word ptr cs:[A_Int_10][2],ax

 mov ax,word ptr cs:[02Ch]             ; á¢®¡®¦¤ ¥¬ á¥£¬¥­â áâà®ª áà¥¤ë.
 mov es,ax
 xor ax,ax
 mov word ptr cs:[02Ch],ax
 mov ah,49h
 int 21h

 ;mov ax,cs                            ;
 ;mov es,ax
 ;mov ah,

 mov ax,5800h
 int 21h                               ; ‡ ¯à®á¨âì â¥ªãéãî áâà â¥£¨î.

 push ax

 mov ax,5801h                          ; “áâ ­®¢¨âì áâà â¥£¨î à á¯à¥¤¥«¥­¨ï
 mov bx,0081h                          ; ¯ ¬ïâ¨ - ­ ¨¡®«¥¥ ¯®¤å®¤ïé¨© ¡«®ª
 int 21h                               ; ¯ ¬ïâ¨ (High/Low).

 mov ah,48h                            ;  ¢¥à­ïª  ¤®«¦¥­ ­ ©â¨áì å®âï ¡ë
 mov bx,4                              ; ®¤¨­ ¯®¤å®¤ïé¨© á¢®¡®¤­ë© ¡«®ª.
 int 21h
 jnc NewBlock_Ok

 mov ax,5801h                          ; ‚¥à­ãâì áâà â¥£¨î à á¯à¥¤¥«¥­¨ï
 pop bx                                ; ¢ ¨áå®¤­®¥ á®áâ®ï­¨¥.
 int 21h

 call Beep
 jmp Quit

NewBlock_Ok:
 ;   AX=Segment Of Block
 mov word ptr cs:[DOS_Block],ax
 dec ax
 mov es,ax
 inc ax
 ;mov word ptr es:[1],ax               ; “áâ ­®¢¨âì á¥£¬¥­â ¢« ¤¥«ìæ .
 mov word ptr es:[1],0070h             ; à¨ª¨­ãâìáï DOS.
 mov es,ax
 xor di,di
 mov ax,cs
 mov ds,ax
 lea si,HMA_Control
 mov cx,HMA_Control_Size
 cld
 rep movsb

 mov ax,5801h                          ; ‚¥à­ãâì áâà â¥£¨î à á¯à¥¤¥«¥­¨ï
 pop bx                                ; ¢ ¨áå®¤­®¥ á®áâ®ï­¨¥.
 int 21h

 cli

 xor ax,ax
 mov ds,ax
 mov dx,word ptr cs:[DOS_Block]

 mov ax,offset HMA_Int09 - offset HMA_Control
 mov word ptr ds:[09h*4][0],ax
 mov word ptr ds:[09h*4][2],dx

 mov ax,offset HMA_Int10 - offset HMA_Control
 mov word ptr ds:[10h*4][0],ax
 mov word ptr ds:[10h*4][2],dx

 mov ax,offset Font_8x8 - offset HMA_Control + 1024
 mov word ptr ds:[1Fh*4][0],ax
 mov word ptr ds:[1Fh*4][2],dx

 sti

 mov ax,cs
 mov ds,ax
 mov es,ax

 jmp Done

FontInXMS:
 mov ah,08h
 call dword ptr cs:[XMSEntry]
 cmp ax,6
 jae MemOk
 call Beep
 push cs
 pop es
 lea bp,Err2
 mov cx,30
 mov bl,12
 mov dh,12
 mov dl,30
 call OutStr
 jmp Quit

MemOk:
 mov ah,09h
 mov dx,6
 call dword ptr cs:[XMSEntry]
 mov cs:[Handle],dx

 mov ax,1024*6
 mov word ptr ds:[Len],ax
 mov word ptr ds:[DestHandle],dx
 lea ax,Font_8x16
 mov word ptr ds:[SourceOffs],ax
 mov ax,cs
 mov word ptr ds:[SourceOffs + 2],ax
 lea si,Len
 mov ah,0Bh
 call dword ptr cs:[XMSEntry]

 mov ax,cs:[Handle]
 mov word ptr ds:[SourceHandle],ax
 xor ax,ax
 mov word ptr cs:[SourceOffs+2],ax
 mov word ptr ds:[DestHandle],ax
 mov word ptr ds:[DestOffs],ax
 mov ax,cs
 mov word ptr ds:[DestOffs+2],ax
 mov ax,256
 mov word ptr ds:[Len],ax

FontDataInstalled:

 cli

 xor ax,ax
 mov ds,ax

 lea ax,Int09
 mov word ptr ds:[09h*4],ax
 mov ax,cs
 mov word ptr ds:[09h*4+2],ax

 ;cmp byte ptr cs:[ShadowFontFlag],1
 ;je  No10hControl

 lea ax,Int10
 mov word ptr ds:[10h*4],ax
 mov ax,cs
 mov word ptr ds:[10h*4+2],ax

No10hControl:

 sti

Done:

 mov ax,cs                             ; á¢®¡®¦¤¥­¨¥ á¥£¬¥­â  áâà®ª áà¥¤ë.
 mov ds,ax
 mov ax,word ptr cs:[02Ch]
 or  ax,ax
 jz  Block_Used
 mov es,ax
 xor ax,ax
 mov word ptr cs:[02Ch],ax
 mov ah,49h
 int 21h
Block_Used:
 push cs
 pop es
 lea bp,IType2
 mov cx,30
 mov bl,10
 mov dh,12
 mov dl,30
 call OutStr

 mov dx,1600h
 mov bh,00
 mov ah,02h
 int 10h

 cmp byte ptr cs:[KReside],1           ; HMA ?
 jne No_HMA_Resident
 int 20h

No_HMA_Resident:

 lea dx,Install
 cmp byte ptr cs:[ShadowFontFlag],1
 jne NoOnlyKeyboard
 lea dx,OnlyKeyboard
NoOnlyKeyboard:

 int 27h

Quit:
 mov dx,1600h
 mov bh,00
 mov ah,02h
 int 10h
 mov ax,4C01h
 int 21h

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³                   Š®¤ ¤«ï ¯®¤¤¥à¦ª¨ EGA                    ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³  EGA_Code:                               ³
 ³   cmp al,0                               ³
 ³   je  EGA_Control8x8                     ³
 ³   cmp al,1                               ³
 ³   je  EGA_Control8x8                     ³
 ³   cmp al,2                               ³
 ³   je  EGA_Control8x16                    ³
 ³   cmp al,3                               ³
 ³   je  EGA_Control8x16                    ³
 ³   cmp al,7                               ³
 ³   je  EGA_Control8x16                    ³
 ³   push si                                ³
 ³   lea si,Set_Border                      ³
 ³   call si                                ³
 ³   pop si                                 ³
 ³   pop ds                                 ³
 ³   sti                                    ³
 ³   retf 2                                 ³
 ³                                          ³
 ³  EGA_Control8x16:                        ³
 ³   mov byte ptr [SizeCh],16               ³
 ³   ;mov word ptr [AXForSetMode],1101h     ³
 ³   ;mov al,00h                            ³
 ³   jmp short EGA_Control                  ³
 ³  EGA_Control8x8:                         ³
 ³   mov byte ptr [SizeCh],08               ³
 ³   ;mov word ptr [AXForSetMode],1102h     ³
 ³   ;mov al,10h                            ³
 ³  EGA_Control:                            ³
 ³   pusha                                  ³
 ³   mov al,00                              ³
 ³   mov bl,00                              ³
 ³   push offset ControlFonts               ³
 ³   retn                                   ³
 ³  EGA_Code_Size EQU $-EGA_Code            ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³                  Š®¤ ¤«ï ¯®¤¤¥à¦ª¨ EGA (HMA)               ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³ $EGA_Code:                               ³
 ³   cmp al,0                               ³
 ³   je  $EGA_Control8x8                    ³
 ³   cmp al,1                               ³
 ³   je  $EGA_Control8x8                    ³
 ³   cmp al,2                               ³
 ³   je  $EGA_Control8x16                   ³
 ³   cmp al,3                               ³
 ³   je  $EGA_Control8x16                   ³
 ³   cmp al,7                               ³
 ³   je  $EGA_Control8x16                   ³
 ³                                          ³
 ³   add di,offset $NoControlFonts          ³
 ³   push di                                ³
 ³   sub di,offset $NoControlFonts          ³
 ³   retn                                   ³
 ³                                          ³
 ³  $EGA_Control8x16:                       ³
 ³   mov byte ptr [$SizeCh+di],14           ³
 ³   ;mov word ptr [$AXForSetMode+di],1101h ³
 ³   ;mov al,00h                            ³
 ³   jmp short $EGA_Control                 ³
 ³  $EGA_Control8x8:                        ³
 ³   mov byte ptr [$SizeCh+di],08           ³
 ³   ;mov word ptr [$AXForSetMode+di],1102h ³
 ³   ;mov al,10h                            ³
 ³  $EGA_Control:                           ³
 ³   mov al,00                              ³
 ³   mov bl,00                              ³
 ³   add di,offset $ControlFonts            ³
 ³   push di                                ³
 ³   sub di,offset $ControlFonts            ³
 ³   retn                                   ³
 ³  $EGA_Code_Size EQU $-$EGA_Code          ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³       AX - Key type; BL - Scan Code; CX - Switch type.     ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
Set_Key_1 proc near
 mov word ptr es:[First_Ext_Type],ax
 mov word ptr es:[First_Switch_Type+1],cx
 jc  Set_Key_1_Exit
 and bl,01111111b
 mov byte ptr es:[First_Key_Press_Code+1],bl
 or  bl,10000000b
 mov byte ptr es:[First_Key_Release_Code+1],bl
Set_Key_1_Exit:
 ret
Set_Key_1 endp

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³       AX - Key type; BL - Scan Code; CX - Switch type.     ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
Set_Key_2 proc near
 mov word ptr es:[Second_Ext_Type],ax
 mov word ptr es:[Second_Switch_Type+1],cx
 jc  Set_Key_2_Exit
 and bl,01111111b
 mov byte ptr es:[Second_Key_Press_Code+1],bl
 or  bl,10000000b
 mov byte ptr es:[Second_Key_Release_Code+1],bl
Set_Key_2_Exit:
 ret
Set_Key_2 endp

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³       AX - Key type; BL - Scan Code; CX - Switch type.     ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
Set_Key_3 proc near
 mov word ptr es:[Third_Ext_Type],ax
 mov word ptr es:[Third_Switch_Type+1],cx
 jc  Set_Key_3_Exit
 and bl,01111111b
 mov byte ptr es:[Third_Key_Press_Code+1],bl
 or  bl,10000000b
 mov byte ptr es:[Third_Key_Release_Code+1],bl
Set_Key_3_Exit:
 ret
Set_Key_3 endp

UpCaseChar proc near
 cmp al,'a'
 jb  UpCaseChar_Exit
 cmp al,'z'
 ja  UpCaseChar_Exit
 sub al,20h
UpCaseChar_Exit:
 ret
UpCaseChar endp

Decode_Dec proc near
 push cx dx si
 xor ax,ax
 mov si,10
 xor ch,ch
Decode_Dec_DecodeNumber:
 inc bx
 mov cl,byte ptr cs:[bx]
 sub cl,30h
 cmp cl,9
 ja  Decode_Dec_Done
 mul si
 add ax,cx
 jmp short Decode_Dec_DecodeNumber
Decode_Dec_Done:
 pop si dx cx
 ret
Decode_Dec endp

SetLamps proc near
 ret
 push ds
 push cx
 xor cx,cx
 mov ds,cx
 cmp al,70			       ; Scroll Lock
 jne No_ScrollLock
 and byte ptr ds:[417h],11101111b      ; Lamp Off
No_ScrollLock:
 cmp al,69			       ; Num Lock
 jne No_NumLock
 and byte ptr ds:[417h],11011111b      ; Lamp Off
No_NumLock:
 cmp al,58			       ; Caps Lock
 jne No_CapsLock
 and byte ptr ds:[417h],10111111b      ; Lamp Off
No_CapsLock:
 pop cx
 pop ds
 ret
SetLamps endp

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³  ‚ë¢®¤ áâ®à®ª¨ ­  íªà ­ (ES:[BP] String Ptr; CX - Length)  ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

OutStr proc near
 push ax
 push bx
 push cx
 mov ax,1301h
 mov bh,00h
 int 10h
 pop cx
 pop bx
 pop ax
 ret
OutStr endp

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³         DS:BX                                              ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
Decode_File_Name proc near
 pusha
 mov si,bx
 lea di,File_Name
 cld
 mov cx,256
Decode_F_N_Next:
 lodsb
 cmp al,0
 je  Decode_F_N_Exit
 cmp al,' '
 je  Decode_F_N_Exit
 cmp al,'/'
 je  Decode_F_N_Exit
 cmp al,'-'
 je  Decode_F_N_Exit
 cmp al,13
 je  Decode_F_N_Exit
 cmp al,10
 je  Decode_F_N_Exit
 stosb
 inc bx
 cmp si,0FFh
 ja  Decode_F_N_Exit
 dec cx
 jz  Decode_F_N_Exit
 jmp short Decode_F_N_Next
Decode_F_N_Exit:
 xor al,al
 stosb
 popa
 ret
Decode_File_Name endp

Beep proc near
 push ax
 mov ax,0E07h
 int 10h
 pop ax
 ret
Beep endp


Hello	db 'ÚÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄ¿'
	db 'ÃÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄ´'
        db '³³³³                    Cyrillic Font & Keyboard driver.                    ³³³³'
        db '³³³³   ±±±±±±±±± ÄÄÄÄÄÄÄÄÄÄÄÄÄ Version 4.03 Beta ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ ±±±±±±±±±   ³³³³'
        db '³³³³                Copyright (C) 1993 - 1996 Butenko Igor.                 ³³³³'
        db '³³³³        EGA, VGA Fonts 8x16, 8x8, 8x14. All Super VGA text modes.       ³³³³'
	db '³³³³                  Last compile : ',??DATE,'  ',??TIME,'                     ³³³³'
	db 'ÃÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄ´'
	db '³³³³ Video BIOS Location    :                                               ³³³³'
	db '³³³³ Font Driver Type       :                                               ³³³³'
	db '³³³³ Keyboard Driver Type   :                                               ³³³³'
	db '³³³³ BIOS Date              :                                               ³³³³'
	db '³³³³ Install Status         :                                               ³³³³'
	db 'ÃÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄ´'
	db 'ÀÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÙ'
        db 'ÚÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄ¿'
        db '³³³³ /A[+/-]   - Enable/Disable Alt.   ³ /K[E]xxx  - Set change layot key.  ³³³³'
        db '³³³³ /B[+/-/x] - Setup Border usage.   ³ /R        - Release from memory.   ³³³³'
        db '³³³³ /M[0..2]  - Set change layot type.³ /N[+/-]   - Num Lock On/Off.       ³³³³'
        db '³³³³ /X        - Use XMS memory.       ³ /D        - Load defaults.         ³³³³'
        db '³³³³ /F:<file> - Use external font.    ³ /K:<file> - Use external key layot.³³³³'
        db '³³³³ /C[1..7]  - Set cursor size.      ³ /F        - Fast keyboard.         ³³³³'
	db 'ÀÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÙ'


Err1	db 'XMS Driver not found.         '
Err2    db 'Out of XMS memory.            '
Err3	db 'Ivalid command line parameter.'
Err4    db 'Ivalid file name.             '


BType1	db 'ROM    Memory.                '
BType2	db 'Shadow Memory.                '
BType3	db 'Video Interrupt Locked.       '

FType1	db 'Code in RAM, data in XMS.     '
FType2  db 'Resident in HMA.              '
FType3  db 'Fonts loaded in shadow memory.'

KType1	db 'Resident in RAM.              '
KType2	db 'Resident in HMA.              '
KType3	db 'Resident in Shadow.           '

IType1	db 'Already Installed.            '
IType2	db 'Ok.                           '
IType3  db 'Get help. Detail in HTRUS.DOC.'
IType4	db 'Change Parameters.            '
IType5	db 'Can''t release resident.       '
IType6	db 'Release resident portion.     '
IType7  db 'Disable HMA resident.         '
IType8  db 'Enable HMA resident.          '

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³              ¥à¥¬¥­­ë¥ ¤«ï ª®¤  ¨­áâ ««ïæ¨¨               ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³  DOS_Block       dw 0  ³
 ³  HMA_Block       dd 0  ³
 ³  ShadowFlag      db 0  ³
 ³  LoadToShadow    db 0  ³
 ³  ShadowFontFlag  db 0  ³
 ³  KReside         db 0  ³
 ³  HelpFlag        db 0  ³
 ³  Change_Param    dw 0  ³
 ³  Enable_Flag     db 0  ³
 ³  File_Handle     dw 0  ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³              ¥à¥¬¥­­ë¥ ¤«ï ª®¤  ¨­áâ ««ïæ¨¨               ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³  File_Name       db 256 dup (0)  ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³  Change_Param dw   xxxxxxxxxxxxxxxxb                       ³Û³²³±³°³
³°³±³²³Û³                    ³³³³³³³³³³³³³³³³                        ³Û³²³±³°³
³°³±³²³Û³                    ³³³³³³³³³³³³³³³ÀÄÄ Change Border        ³Û³²³±³°³
³°³±³²³Û³                    ³³³³³³³³³³³³³³ÀÄÄÄ Change Key           ³Û³²³±³°³
³°³±³²³Û³                    ³³³³³³³³³³³³³ÀÄÄÄÄ Change Metod         ³Û³²³±³°³
³°³±³²³Û³                    ³³³³³³³³³³³³ÀÄÄÄÄÄ Enable/Disable Alt   ³Û³²³±³°³
³°³±³²³Û³                    ³³³³³³³³³³³ÀÄÄÄÄÄÄ Change Key layot     ³Û³²³±³°³
³°³±³²³Û³                    ³³³³³³³³³³ÀÄÄÄÄÄÄÄ Change Indicaton     ³Û³²³±³°³
³°³±³²³Û³                    ³³³³³³³³³ÀÄÄÄÄÄÄÄÄ Change Auto Insert   ³Û³²³±³°³
³°³±³²³Û³                    ³³³³³³³³ÀÄÄÄÄÄÄÄÄÄ Release              ³Û³²³±³°³
³°³±³²³Û³                    ³³³³³³³ÀÄÄÄÄÄÄÄÄÄÄ Change Font 8x8      ³Û³²³±³°³
³°³±³²³Û³                    ³³³³³³ÀÄÄÄÄÄÄÄÄÄÄÄ Change Font 8x14     ³Û³²³±³°³
³°³±³²³Û³                    ³³³³³ÀÄÄÄÄÄÄÄÄÄÄÄÄ Change Font 8x16     ³Û³²³±³°³
³°³±³²³Û³                    ³³³³ÀÄÄÄÄÄÄÄÄÄÄÄÄÄ Change Key 1         ³Û³²³±³°³
³°³±³²³Û³                    ³³³ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄ Change Key 2         ³Û³²³±³°³
³°³±³²³Û³                    ³³ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ Change Key 3         ³Û³²³±³°³
³°³±³²³Û³                    ³ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ Change Cursor        ³Û³²³±³°³
³°³±³²³Û³                    ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ                      ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³                                                            ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
HMA_Disabled label word
 XMS_Call_A dd (?)
 Dis_Int09:
  db 0EAh                              ; Jmp FAR.
  O_Int_09 dd (?)
  nop
  nop
  nop
 Dis_Int10:
  cmp ax,MAGIC_Code
  jne Dis_No_C
  push cs
  pop es
  mov ax,MAGIC_Disable
  iret
 Dis_No_C:
  db 0EAh                              ; Jmp FAR.
  O_Int_10 dd (?)
  Save_A_Int_09 dd (?)
  Save_A_Int_10 dd (?)

HMA_Disabled_Size EQU $-HMA_Disabled

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³                                                            ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

HMA_Control Label word
 XMS_Call dd (?)
 HMA_Int09:
  call HMA_Check
  db 0EAh                              ; Jmp FAR.
  A_Int_09 dd (?)
 HMA_Int10:
  call HMA_Check
  cmp ax,MAGIC_Code                    ; ¯à¥¤¥«¥­¨¥ ãáâ ­®¢ª¨.
  jne HMA_Control_N_C
  mov dx,cs
 HMA_Control_N_C:
  db 0EAh                              ; Jmp FAR.
  A_Int_10 dd (?)

HMA_Check proc near
 pusha
 mov ah,7
 call dword ptr cs:[XMS_Call-HMA_Control]
 dec ax
 jz  HMA_Ok
 mov ah,5
 call dword ptr cs:[XMS_Call-HMA_Control]
HMA_Ok:
 popa
 retn
HMA_Check endp

HMA_Control_Size EQU $-HMA_Control

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³                     Š®¤ ¤«ï HMA (DRC)                      ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
HMA_Code Label word
ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³                ¥à¥¬¥­­ë¥ ¤«ï ¢á¥å äã­ªæ¨©                 ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³ $Ext      db (0)  ³
 ³ $Pressed  db (0)  ³
 ³ $Cyrylic  db (0)  ³
 ³ $BordCol  db (0)  ³
 ³           db (0)  ³
 ³           db (0)  ³
 ³           db (0)  ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³               ’ ¡«¨æ  ¯¥à¥ª®¤¨à®¢ª¨ á¨¬¢®«®¢               ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³ $OrdTbl   label byte                              ³
 ³    db    27                                       ³
 ³    db    '1','2','3','4','5','6','7','8','9','0'  ³
 ³    db    '-','=', 8 , 9 ,'©','æ','ã','ª','¥','­'  ³
 ³    db    '£','è','é','§','å','ê',13 , 0 ,'ä','ë'  ³
 ³    db    '¢',' ','¯','à','®','«','¤','¦','í',')'  ³
 ³    db     0 ,'\','ï','ç','á','¬','¨','â','ì','¡'  ³
 ³    db    'î','ñ'                                  ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
$Ord_SIZE EQU $-$OrdTbl
ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³    ’ ¡«¨æ  ¯¥à¥ª®¤¨à®¢ª¨ á¨¬¢®«®¢ ¤«ï à¥¦¨¬   <SHIFT>      ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³ $CpsTbl   label byte                              ³
 ³    db    27                                       ³
 ³    db    '!','"','/','$',':',',','.',';','?','%'  ³
 ³    db    '_','+', 8 , 0 ,'‰','–','“','Š','…',''  ³
 ³    db    'ƒ','˜','™','‡','•','š',13 , 0 ,'”','›'  ³
 ³    db    '‚','€','','','','‹','„','†','','('  ³
 ³    db     0 ,'|','Ÿ','—','‘','Œ','ˆ','’','œ',''  ³
 ³    db    '','ğ'                                  ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
$Cps_SIZE EQU $-$CpsTbl
ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³             ’ ¡«¨æ  ¯¥à¥ª®¤¨à®¢ª¨ á¨¬¢®«®¢ Alt             ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³ $AltTbl   label byte                              ³
 ³    db    27                                       ³
 ³    db    '1','2','3','4','5','6','7','8','9','0'  ³
 ³    db    '-','=', 8 , 9 ,'Ú','Â','¿','Ö','Ò','·'  ³
 ³    db    '³','Ä','º','Í','[',']',13 , 0 ,'Ã','Å'  ³
 ³    db    '´','Ç','×','¶','°','±','²',';', 39,'`'  ³
 ³    db     0 ,'\','À','Á','Ù','Ó','Ğ','½','û',','  ³
 ³    db    '.','/'                                  ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
$Alt_SIZE EQU $-$AltTbl
ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³           ’ ¡«¨æ  ¯¥à¥ª®¤¨à®¢ª¨ á¨¬¢®«®¢ Alt+SHIFT         ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³ $AlsTbl   label byte                              ³
 ³    db    27                                       ³
 ³    db    '!','@','#','$','%','^','&','*','(',')'  ³
 ³    db    '_','+', 8 , 0 ,'É','Ë','»','Õ','Ñ','¸'  ³
 ³    db    'Û','Ü','İ','Ş','{','}',13 , 0 ,'Ì','Î'  ³
 ³    db    '¹','Æ','Ø','µ','ß','ş','ı',':', 34,'~'  ³
 ³    db     0 ,'|','È','Ê','¼','Ô','Ï','¾','ü','<'  ³
 ³    db    '>','?'                                  ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
$Als_SIZE EQU $-$AlsTbl

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³                                                            ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 $Get_Offset proc near
  call $+3
 @Get_Offset_Const:
  pop di
  sub di,Offset @Get_Offset_Const
  ret
 $Get_Offset endp

Inherited09:
  pushf
  db 9Ah                               ; Call Far
 $Old09 dd (?)
  retn

Restore09:
  db 0EAh                              ; Jmp Far
 $$Old09 dd (?)

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³        ¡à ¡®âç¨ª Int 09 (¯à¥àë¢ ­¨¥ ®â ª« ¢¨ âãàë)        ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

 $Int09 proc far
  pushf
  pusha
  push ds es
  push cs
  pop ds
  call $Get_Offset
  in  al,60h
  cmp al,0E0h
  jne $No_Extended
  or  byte ptr [$Ext+di],00000111b
  jmp short $Int09_Inherited
 $No_Extended:
  mov cl,byte ptr [$Ext+di]

  rcr cl,1                             ; ¥à¢ ï ª« ¢¨è  ¯¥à¥ª«îç¥­¨ï.
 $First_Ext_Type:
  jc  $First_Key_Done
 $First_Key_Press_Code:
  cmp al,036h                          ; 01Dh
  je  $GoWork
 $First_Key_Release_Code:
  cmp al,0B6h                          ; 09Dh
 $First_Switch_Type:
  mov bx,3001h                         ; xor 01 (/m0,/m1); mov 01 (/m3)
  je  $Break
 $First_Key_Done:

  rcr cl,1                             ; ‚â®à ï ª« ¢¨è  ¯¥à¥ª«îç¥­¨ï.
 $Second_Ext_Type:
  jmp $Second_Key_Done
 $Second_Key_Press_Code:
  cmp al,02Ah                          ; 02Ah
  je  $GoWork
 $Second_Key_Release_Code:
  cmp al,0AAh                          ; 0AAh
 $Second_Switch_Type:
  mov bx,8800h                         ; mov 00
  je  $Break
 $Second_Key_Done:

  rcr cl,1                             ; ’à¥âìï ª« ¢¨è  ¯¥à¥ª«îç¥­¨ï.
 $Third_Ext_Type:
  jnc $Third_Key_Done
 $Third_Key_Press_Code:
  cmp al,038h                          ; 038h
  je  $GoWork
 $Third_Key_Release_Code:
  cmp al,000h                          ; 0B8h
 $Third_Switch_Type:
  mov bx,3002h                         ; xor 02
  je  $Break
 $Third_Key_Done:

  jmp Short $Clear

 $GoWork:
  mov byte ptr [$Pressed+di],1
  jmp short $Cl_Ext
 $Break:
  mov byte ptr [$Operation_Type+di],bh
  cmp byte ptr [$Pressed+di],1
  jne $Cl_Ext
  jmp $+2
 $Operation_Type:
  mov byte ptr [$Cyrylic+di],bl
  
  call $Set_Border

 $Clear:
  mov byte ptr [$Pressed+di],0
 $Cl_Ext:
  and byte ptr [$Ext+di],11111000b

 $Int09_Inherited:
  push 40h
  pop es
 $AutoIns_Code:
  and byte ptr es:[18h],0FFh
  mov si,word ptr es:[1Ch]
  call Inherited09
  mov dx,word ptr es:[17h]
  ;test dx,0000000000001101            ; <RShift><Ctrl><Alt>
  ;jne No_Load_Default
  ;pusha
  ;xor byte ptr [$Ext+di],00010000b
  ;mov ax,word ptr [$AXForSetMode+di]
  ;xor bl,bl
  ;int 10h
  ;popa
;$No_Load_Default:
  
ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³            à®æ¥¤ãà  âà ­á«ïæ¨¨ ª®¤®¢ á¨¬¢®«®¢             ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

  cmp si,word ptr es:[1Ch]
  je  $Int09_Exit
  mov ax,word ptr es:[si]
  or  ah,ah
  jz  $Int09_Exit
  cmp ah,53
  ja  $Int09_Exit
  
  test dx,0000001100001100b            ; Alt, Ctrl ?
  jnz $Int09_Exit
  test byte ptr [$Cyrylic+di],00000011b; Work ?
  jz  $Int09_Exit
  mov cx,(offset $OrdTbl)-1
  xor bx,bx
  test byte ptr [$Cyrylic+di],00000010b
  jz  $No_Alt_Key
  mov cx,(offset $AltTbl)-1
 $No_Alt_Key:
                ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ; Left  Shift Ä¿
                ³ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ; Rihgt Shift ÄÙ
  test dl,00000011b
  jz  $No_Shift_Key                    ; …á«¨ ­¥ ­ ¦ â ­¨ª ª®© <SHIFT>.
  xor bx,$Ord_SIZE                     ; ‘¬¥­¨âì â ¡«¨æã.
 $No_Shift_Key:
  cmp ah,15                            ; à®¢¥àª  ­  ­¥§ ¢¨á¨¬®áâì ®â <Caps>.
  jbe $Do_Translate
  cmp ah,41                            ; à®¢¥àª  ­  ­¥§ ¢¨á¨¬®áâì ®â <Caps>.
  je  $Do_Translate
  cmp ah,43                            ; à®¢¥àª  ­  ­¥§ ¢¨á¨¬®áâì ®â <Caps>.
  je  $Do_Translate
  test dl,40h                          ; Caps Lock ?
  jz  $Do_Translate
  xor bx,$Ord_SIZE                     ; ‘¬¥­¨âì â ¡«¨æã.
 $Do_Translate:
  add bx,cx
  add bx,di
  mov al,ah
  xlat
  cmp al,127
  jbe $No_Zero_AH
  xor ah,ah
 $No_Zero_AH:
  mov word ptr es:[si],ax

 $Int09_Exit:
  pop es ds
  popa
  popf
  iret
 $Int09 endp

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³             à®æ¥¤ãà  ãáâ ­®¢ª¨ ¡®à¤¥à  íªà ­              ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

 $Set_Border proc near
  pusha
  mov dx,3DAh
  in  al,dx
  mov dl,0C0h
  mov al,11h
  out dx,aL
  xor bh,bh
  mov bl,[$Cyrylic+di]
  mov al,byte ptr [$BordCol+bx+di]
  out dx,al
  mov al,20h
  out dx,al
  popa
  ret
 $Set_Border endp

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³     Š®¤ á íâ®£® ¬¥áâ  ­¥ ­ã¦¥­ ¤«ï ¤à ©¢¥à  ª« ¢¨ âãàë     ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

$OnlyKeyboard label word

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³          ‚áïª ï ¤à¥¡¥¤¥­ì ¤«ï ®¡à ¡®âç¨ª  Int 10           ³Û³²³±³°³
ÀÂÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
 ³  $AXForSetMode dw 0   ³
 ³  $SizeCh       db 0   ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³              ¡à ¡®âç¨ª Int 10 (¢¨¤¥®á¥à¢¨á)               ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &
Inherited10:
  pushf
  db 9Ah                               ; Call Far
  $Old10        dd (?)
  retn

Restore10:
  db 0EAh                              ; Jmp Far
 $$Old10 dd (?)

 $Int10 proc far
  or  ah,ah
  jz  $BIOSSetMode
  cmp ah,11h
  je  $BIOSLoadFonts
  cmp ax,4F02h
  je  $BIOSSetMode
  cmp ax,MAGIC_Code                    ; ¯à¥¤¥«¥­¨¥ ãáâ ­®¢ª¨.
  je  $Check_Install_Resident

  ;jmp dword ptr cs:[$Old10]
  jmp Restore10

$Check_Install_Resident:
  mov ax,cs                            ; ‚®§¢à é ¥â ¢ ES:DI  ¤à¥á
  mov es,ax                            ; ¤«ï à¥§¨¤¥­â­®© ¯®àæ¨¨.
  call $Get_Offset
  ;add di,offset HMA_Code
  mov ax,MAGIC_Answer
  mov bx,HTRUS_Version
  iret

$BIOSSetMode:
  push di
  call $Get_Offset
  mov word ptr cs:[$AXForSetMode+di],ax
  pop di
  ;pushf
  ;call dword ptr cs:[$Old10+di]
  call Inherited10
  push ds
  push cs
  pop  ds
  pusha
  call $Get_Offset

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³           Š®¤ á íâ®£® ¬¥áâ  § ¢¨á¨¬ ®â  ¤ ¯â¥à             ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

 $Display_Depended:
  mov dx,3CEh
  mov al,06h
  out dx,al
  inc dx
  in  al,dx
  and al,1
  jnz $NoControlFonts
  push ds
  push 0
  pop ds
  mov al,byte ptr ds:[485h]            ; —¨á«® áâà®ª ¢ á¨¬¢®«¥.
  mov bl,byte ptr ds:[449h]            ; ®¬¥à ¢¨¤¥®à¥¦¨¬ .
  pop ds
  sub bl,byte ptr [$AXForSetMode+di]   ; à®¢¥à¨âì ­  § ¤à®çªã.
  jz  $InTextMode                      ; …á«¨ à¥¦¨¬ ¢ª«îç¨«áï.
  cmp bl,80h                           ; € ¢¤àã£ ¯¥à¥ª«îç¥­¨¥
  je  $InTextMode                      ; á á®åà ­¥­¨¥¬ ¢¨¤¥®¯ ¬ïâ¨ ?
  cmp word ptr [$AXForSetMode+di],4F02h; VESA Set Mode
  jne $NoControlFonts
$InTextMode:
  cmp al,14
  mov al,8
  jb  $Font_8x8
  je  $Font_8x14
  ;   ¨­ ç¥ ¤®¡ ¢ª  ¤«ï èà¨äâ  8x16.
  add al,2
$Font_8x14:
  add al,6
$Font_8x8:
  mov byte ptr [$SizeCh+di],al
  mov al,0                             ; ‡ £àã§ª  èà¨äâ  ¯à¨ ¢ª«îç¥­¨¨
                                       ; ­®¢®£® à¥¦¨¬  á ¨á¯®«ì§®¢ ­¨¥¬
                                       ; ¯®¤äã­ªæ¨¨ 0.
  mov bl,0                             ; ˜à¨äâ ¢ 0 ¡ ­ª.
  jmp short $ControlFonts
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

$BIOSLoadFonts:
  push ds
  push cs
  pop  ds
  pusha
  call $Get_Offset
  push ax
  and al,11101111b
  cmp al,01h
  je $Control8x14
  cmp al,02h
  je $Control8x8
  cmp al,04h
  je $Control8x16
  pop ax
  cmp al,30h
  je $Get_Info
No_Control_Info:
  popa
  pop ds
  ;jmp dword ptr [$Old10]
  jmp Restore10

$Get_Info:
  cmp bh,2
  jb No_Control_Info
  cmp bh,6
  ja No_Control_Info
  cmp bh,5
  je No_Control_Info
  popa
  pop ds
  push bx
  call Inherited10
  push cs
  pop es
  pop ax
  mov al,ah
  push di
  call $Get_Offset
  mov bp,offset Font_8x14
  sub al,2
  jz  $Get_Info_Exit
  mov bp,offset Font_8x8
  dec al
  jz  $Get_Info_Exit
  mov bp,offset Font_8x8 + 1024
  dec al
  jz  $Get_Info_Exit
  mov bp,offset Font_8x16

$Get_Info_Exit:
  add bp,di
  pop di
  xor ax,ax
  iret

$Control8x16:
  mov al,16
  jmp short $Control
$Control8x14:
  mov al,14
  jmp short $Control
$Control8x8:
  mov al,08
$Control:
  mov byte ptr [$SizeCh+di],al
  pop ax
  ;pushf
  ;call dword ptr [$Old10+di]

ÚÄÂÄÂÄÂÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÂÄÂÄ¿                               Comment &
³°³±³²³Û³         ‚ íâ®© â®çª¥ AL á®¤¥à¦¨â ­®¬¥à ¯®¤äã­ªæ¨¨,         ³Û³²³±³°³
³°³±³²³Û³           BL - ­®¬¥à ¡ ­ª  ¤«ï § £àã§ª¨ èà¨äâ .            ³Û³²³±³°³
ÀÄÁÄÁÄÁÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÁÄÁÄÁÄÙ                               &

$ControlFonts:
  and al,10h
  mov byte ptr [$Load_Font_Sub_Function+1+di],al
  push es

  push cs
  pop  es

  mov al,byte ptr [$SizeCh+di]
  cmp al,16
  je  $Load_8x16
  cmp al,8
  je  $Load_8x8
  ;    Else 8x14
  lea bp,Font_8x14
  jmp short $Load_Do
$Load_8x16:
  lea bp,Font_8x16
  jmp short $Load_Do
$Load_8x8:
  lea bp,Font_8x8
$Load_Do:
  add bp,di
  mov cx,256
  xor dx,dx
  mov bh,byte ptr [$SizeCh+di]

$Load_Font_Sub_Function:
  mov ax,1100h                         ; 1100h
  ;pushf
  ;call dword ptr [$Old10]
  call Inherited10

  call $Get_Offset

  mov cl,byte ptr [$SizeCh+di]         ; “áâ ­®¢¨âì à §¬¥à ªãàá®à .
  sub cl,2
  mov ch,cl
  sub ch,1
$Cursor_Size EQU $-1                   ; Œ¥âª  à §¬¥à  ªãàá®à .
  mov ah,01h
  int 10h

  call $Get_Offset

  pop es
$NoControlFonts:
  call $Set_Border
  push 0
  pop ds
  mov al,byte ptr ds:[485h]            ; —¨á«® áâà®ª ¢ á¨¬¢®«¥.
  mov bx,Offset Font_8x8
  cmp al,8
  je  $Setup_Vect
  mov bx,Offset Font_8x14
  cmp al,14
  je  $Setup_Vect
  mov bx,Offset Font_8x16

$Setup_Vect:
  mov dx,Offset Font_8x8 + 1024
  add dx,di
  add bx,di
  mov word ptr ds:[1Fh*4][0],dx
  mov word ptr ds:[1Fh*4][2],cs
  mov word ptr ds:[43h*4][0],bx
  mov word ptr ds:[43h*4][2],cs
  mov word ptr ds:[44h*4][0],bx
  mov word ptr ds:[44h*4][2],cs
  popa
  pop ds
  sti
  retf 2
 $Int10 endp

Font_8x16 label byte
 include Font8x16.inc
Font_8x8  label byte
 include Font8x8.inc
Font_8x14 label byte
 include Font8x14.inc

 HMA_Code_Size EQU $-HMA_Code
Code EndS

End Start
