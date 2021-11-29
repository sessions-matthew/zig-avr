const attiny85 = @import("attiny85.zig").attiny85;
const avr = @import("avr.zig").avr;

export fn main() void {
    avr.enablePin(attiny85, attiny85.PB3, avr.pinDir.OUTPUT);

    while (true) {
        avr.togglePin(attiny85, attiny85.PB3);
        avr.delay(10000);
    }
}
