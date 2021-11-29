const attiny85 = @import("attiny85.zig").attiny85;
const atmega328p = @import("atmega328p.zig").atmega328p;
const avr = @import("avr.zig").avr;

export fn main() void {
    avr.enablePin(atmega328p, atmega328p.PB5, avr.pinDir.OUTPUT);

    while (true) {
        avr.togglePin(atmega328p, atmega328p.PB5);
        avr.delay(30000);
    }
}
