; ====================================================================
; CHUONG TRINH: QUET THE RFID HZ-1050 (RDM6300) VA HIEN THI LCD I2C
; VI DIEU KHIEN: 8051 (Yeu cau thach anh 11.0592 MHz)
; ====================================================================

SCL      BIT P2.0
SDA      BIT P2.1

; --- DINH NGHIA THONG SO I2C LCD ---
I2C_ADDR      EQU 4EH    ; Dia chi I2C cua module LCD (0x27 x 2). Neu khong chay thu doi sang 7EH
LCD_BACKLIGHT EQU 08H    ; Bat den nen (bit 3 cua PCF8574)
EN_BIT        EQU 04H    
RS_BIT        EQU 01H    

ORG 0000H
LJMP MAIN

ORG 0030H
MAIN:
    ; --- KHOI TAO UART (9600 BAUD) ---
    MOV TMOD, #20H       ; Timer 1, Mode 2 (Auto-reload 8-bit)
    MOV TH1, #0FDH       ; Toc do 9600 Baud (Chi dung voi thach anh 11.0592MHz)
    MOV SCON, #50H       ; Che do 8-bit UART, cho phep nhan (REN=1)
    SETB TR1             ; Cho phep Timer 1 hoat dong

    ; --- KHOI TAO LCD ---
    ACALL LCD_INIT_I2C   
    
    ; --- HIEN THI TIEU DE (Dong 1) ---
    MOV A, #80H          ; Tro ve dau dong 1
    ACALL LCD_CMD
    MOV DPTR, #MSG1      ; In chuoi "Quet the RFID:"
    ACALL LCD_WRITE_STRING

; ====================================================================
; VONG LAP CHINH: CHO QUET THE VA XU LY DU LIEU
; ====================================================================
LOOP_RFID:
    JNB RI, $            ; Cho nhan 1 byte tu UART
    CLR RI               ; Xoa co nhan
    MOV A, SBUF
    CJNE A, #02H, LOOP_RFID ; Kiem tra co phai byte bat dau (STX = 0x02) chua? Neu chua thi tiep tuc cho

    ; --- 1. NHAN NHANH 10 KY TU VA LUU VAO RAM ---
    ; Nhieu the gui du lieu rat nhanh, phai luu tam vao RAM truoc khi in de khong bi mat chu
    MOV R0, #10          ; Can lay 10 byte ID
    MOV R1, #40H         ; Chon dia chi bat dau tu 40H trong RAM de luu tam
READ_ID_CHARS:
    JNB RI, $            ; Cho nhan tung ky tu
    CLR RI
    MOV A, SBUF
    MOV @R1, A           ; Luu ky tu nhan duoc vao RAM
    INC R1               ; Tang con tro RAM len o tiep theo
    DJNZ R0, READ_ID_CHARS ; Lap lai den khi nhan du 10 ky tu

    ; --- 2. IN DU LIEU TU RAM RA LCD ---
    MOV A, #0C0H         ; Tro ve dau dong 2 cua LCD
    ACALL LCD_CMD
    
    MOV R0, #10          ; In 10 ky tu da luu
    MOV R1, #40H         ; Dua con tro ve lai dia chi 40H
PRINT_TO_LCD:
    MOV A, @R1           ; Lay du lieu tu RAM ra thanh ghi A
    ACALL LCD_CHAR       ; Gui ky tu do len LCD
    INC R1               ; Tang con tro
    DJNZ R0, PRINT_TO_LCD

    SJMP LOOP_RFID       ; Quay lai tu dau, cho the tiep theo

; ====================================================================
; CAC HAM GIAO TIEP I2C (Giu nguyen logic chuan)
; ====================================================================
I2C_START:
    SETB SDA
    SETB SCL
    CLR SDA
    CLR SCL
    RET

I2C_STOP:
    CLR SDA
    SETB SCL
    SETB SDA
    RET

I2C_WRITE:
    MOV R7, #8
I2C_LOOP:
    RLC A
    MOV SDA, C
    SETB SCL
    CLR SCL
    DJNZ R7, I2C_LOOP
    SETB SDA
    SETB SCL
    CLR SCL
    RET

I2C_OUT_LCD:
    PUSH ACC
    ACALL I2C_START
    MOV A, #I2C_ADDR
    ACALL I2C_WRITE
    POP ACC
    ACALL I2C_WRITE
    ACALL I2C_STOP
    RET

; ====================================================================
; CAC HAM DIEU KHIEN LCD
; ====================================================================
LCD_PULSE_EN:
    ORL A, #EN_BIT
    ACALL I2C_OUT_LCD
    ANL A, #(NOT EN_BIT)
    ACALL I2C_OUT_LCD
    RET

LCD_SEND_4BIT:
    PUSH ACC
    ORL A, R2
    ORL A, #LCD_BACKLIGHT ; Luon giu trang thai bat den nen
    ACALL LCD_PULSE_EN
    POP ACC
    RET

LCD_WRITE_BYTE:
    MOV R3, A
    ANL A, #0F0H
    ACALL LCD_SEND_4BIT
    MOV A, R3
    SWAP A
    ANL A, #0F0H
    ACALL LCD_SEND_4BIT
    RET

LCD_CMD:
    MOV R2, #00H
    ACALL LCD_WRITE_BYTE
    ACALL DELAY_2MS
    RET

LCD_CHAR:
    MOV R2, #RS_BIT
    ACALL LCD_WRITE_BYTE
    ACALL DELAY_2MS
    RET

LCD_INIT_I2C:
    ACALL DELAY_10MS
    MOV A, #33H          ; Khoi tao che do 4-bit
    ACALL LCD_WRITE_BYTE
    MOV A, #32H
    ACALL LCD_WRITE_BYTE
    MOV A, #28H          ; 2 dong, 5x8
    ACALL LCD_CMD
    MOV A, #0CH          ; Bat man hinh, tat con tro
    ACALL LCD_CMD
    MOV A, #01H          ; Xoa man hinh
    ACALL LCD_CMD
    RET

LCD_WRITE_STRING:
    CLR A
    MOVC A, @A+DPTR
    JZ END_STR
    ACALL LCD_CHAR
    INC DPTR
    SJMP LCD_WRITE_STRING
END_STR:
    RET

; ====================================================================
; HAM DELAY
; ====================================================================
DELAY_2MS:
    MOV R6, #10
D1: MOV R7, #100
    DJNZ R7, $
    DJNZ R6, D1
    RET

DELAY_10MS:
    MOV R6, #50
D2: MOV R7, #100
    DJNZ R7, $
    DJNZ R6, D2
    RET

; ====================================================================
; DU LIEU HIEN THI CO DINH
; ====================================================================
MSG1: DB 'Quet the RFID:', 0

END