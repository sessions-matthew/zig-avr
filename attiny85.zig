pub const attiny85 = extern struct {
    fn SFR(comptime addr: u8) u8 {
        return 0x20 + addr;
    }
    fn IO(comptime addr: u8) *u8 {
        return @intToPtr(*u8, SFR(addr));
    }
    pub const SREG = IO(0x3F);
    pub const SPH = IO(0x3E);
    pub const SPL = IO(0x3D);
    pub const GIMSK = IO(0x3B);
    pub const GIFR = IO(0x3A);
    pub const TIMSK = IO(0x39);
    pub const TIFR = IO(0x38);
    pub const SPMCSR = IO(0x37);
    // 0x36 is reserved
    pub const MUCR = IO(0x35);
    pub const MCUSR = IO(0x34);
    pub const TCCR0B = IO(0x33);
    pub const TCNT0 = IO(0x32);
    pub const OSCCAL = IO(0x31);
    pub const TCCR1 = IO(0x30);
    pub const TCNT1 = IO(0x2F);
    pub const OCR1A = IO(0x2E);
    pub const OCR1C = IO(0x2D);
    pub const GTCCR = IO(0x2C);
    pub const OCR1B = IO(0x2b);
    pub const TCCR0A = IO(0x2A);
    pub const OCR0A = IO(0x29);
    pub const OCR0B = IO(0x28);
    pub const PLLCSR = IO(0x27);
    pub const CLKPR = IO(0x26);
    pub const DT1A = IO(0x25);
    pub const DT1B = IO(0x24);
    pub const DTPS1 = IO(0x23);
    pub const DWDR = IO(0x22);
    pub const WDTCR = IO(0x21);
    pub const PRR = IO(0x20);
    pub const EEARH = IO(0x1F);
    pub const EEARL = IO(0x1E);
    pub const EEDR = IO(0x1D);
    pub const EECR = IO(0x1C);
    // 0x1B - 0x19 are reserved
    pub const PORTB = IO(0x18);
    pub const DDRB = IO(0x17);
    pub const PINB = IO(0x16);
    pub const PCMSK = IO(0x15);
    pub const DIDR0 = IO(0x14);
    pub const GPIOR2 = IO(0x13);
    pub const GPIOR1 = IO(0x12);
    pub const GPIOR0 = IO(0x11);
    pub const USIBR = IO(0x10);
    pub const USIDR = IO(0x0F);
    pub const USISR = IO(0x0E);
    pub const USICR = IO(0x0D);
    // 0x0C = IO(0x09 are reserved
    pub const ACSR = IO(0x08);
    pub const ADMUX = IO(0x07);
    pub const ADCSRA = IO(0x06);
    pub const ADCH = IO(0x05);
    pub const ADCL = IO(0x04);
    pub const ADCSRB = IO(0x03);
    // 0x02 - 0x00 are reserved

    pub const Pin = packed struct { port: *u8 = PORTB, pin: *u8 = PINB, ddr: *u8 = DDRB, n: u8 };

    pub const PB0 = Pin{ .n = 0 };
    pub const PB1 = Pin{ .n = 1 };
    pub const PB2 = Pin{ .n = 2 };
    pub const PB3 = Pin{ .n = 3 };
    pub const PB4 = Pin{ .n = 4 };
    pub const PB5 = Pin{ .n = 4 };
};

comptime {
    @export(attiny85, .{ .name = "attiny85", .linkage = .Strong });
}
