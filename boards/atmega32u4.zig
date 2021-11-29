pub const board = extern struct {
    fn SFR(comptime addr: u8) u8 {
        return 0x20 + addr;
    }
    fn IO(comptime addr: u8) *u8 {
        return @intToPtr(*u8, SFR(addr));
    }

    // TODO: Fill in all other registers from reference manual
    pub const MCUSR = IO(0x34);

    pub const PORTB = IO(0x05);
    pub const DDRB = IO(0x04);
    pub const PINB = IO(0x03);

    pub const Pin = packed struct { port: *u8 = PORTB, pin: *u8 = PINB, ddr: *u8 = DDRB, n: u8 };

    pub const PB0 = Pin{ .n = 0 };
    pub const PB1 = Pin{ .n = 1 };
    pub const PB2 = Pin{ .n = 2 };
    pub const PB3 = Pin{ .n = 3 };
    pub const PB4 = Pin{ .n = 4 };
    pub const PB5 = Pin{ .n = 5 };
};
comptime {
    @export(board, .{ .name = "atmega328p", .linkage = .Strong });
}
