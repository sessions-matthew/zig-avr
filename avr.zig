pub fn Avr(comptime T: type) type {
    return struct {
        pub const pinDir = struct {
            pub const OUTPUT = 1;
            pub const INPUT = 0;
        };
        pub fn enablePin(comptime pin: T.Pin, comptime dir: u8) void {
            if (dir == 1) {
                pin.ddr.* |= 1 << pin.n;
            } else {
                pin.ddr.* &= ~@intCast(u8, 1 << pin.n);
            }
        }
        pub fn togglePin(comptime pin: T.Pin) void {
            pin.port.* ^= 1 << pin.n;
        }
        pub fn delay(comptime count: u16) void {
            var i = count;
            while (i > 0)
                i -= 1;
        }
    };
}
