#include <REGX52.H>

sbit SDA = P2^0;
sbit SCL = P2^1;

// Delay
void delay() {
    unsigned int i, j;
    for(i = 0; i < 200; i++)
        for(j = 0; j < 100; j++);
}

// I2C Start
void I2C_Start() {
    SDA = 1;
    SCL = 1;
    SDA = 0;
    SCL = 0;
}

// I2C Stop
void I2C_Stop() {
    SDA = 0;
    SCL = 1;
    SDA = 1;
}

// G?i 1 byte
void I2C_Write(unsigned char dat) {
    unsigned char i;

    for(i = 0; i < 8; i++) {
        if(dat & 0x80)
            SDA = 1;
        else
            SDA = 0;

        SCL = 1;
        SCL = 0;

        dat = dat << 1;
    }

    SDA = 1;
    SCL = 1;
    SCL = 0;
}

// G?i 4 bit
void LCD_Write4(unsigned char dat) {
    I2C_Start();
    I2C_Write(0x4E);

    I2C_Write(dat | 0x08 | 0x04);
    I2C_Write(dat | 0x08);

    I2C_Stop();
}

// G?i l?nh / d? li?u
void LCD_Send(unsigned char value, unsigned char mode) {
    unsigned char high, low;

    high = value & 0xF0;
    low  = (value << 4) & 0xF0;

    LCD_Write4(high | mode);
    LCD_Write4(low  | mode);

    delay();
}

// L?nh
void LCD_Cmd(unsigned char cmd) {
    LCD_Send(cmd, 0x00);
}

// Ký t?
void LCD_Char(unsigned char c) {
    LCD_Send(c, 0x01);
}

// Chu?i
void LCD_String(char *s) {
    while(*s) {
        LCD_Char(*s);
        s++;
    }
}

// Init
void LCD_Init() {
    delay();

    LCD_Cmd(0x28);
    LCD_Cmd(0x0C);
    LCD_Cmd(0x06);
    LCD_Cmd(0x01);

    delay();
}

void main() {
    LCD_Init();
    LCD_String("HELLO");

    while(1);
}