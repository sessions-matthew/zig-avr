const attiny85 = @import("attiny85.zig").attiny85;
export fn main() void {
    attiny85.DDRB.* = 1 << 3;
    while (true) {
        attiny85.PORTB.* ^= 1 << 3;
        var i: i32 = 0;
        while (i < 32000) {
            i += 1;
        }
        i = 0;
    }
}
