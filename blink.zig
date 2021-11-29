const board = @import("boards/attiny85.zig").board;
const avr = @import("avr.zig").Avr(board);

export fn main() void {
    avr.enablePin(board.PB4, avr.pinDir.OUTPUT);

    while (true) {
        avr.togglePin(board.PB4);
        avr.delay(30000);
    }
}
