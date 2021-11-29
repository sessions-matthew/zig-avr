outdir = /tmp
avrdir = ~/Applications/.arduino/arduino-1.8.12/hardware/tools/avr
avrbin = $(avrdir)/bin

# make target="blink" -C ./project/
target = blink
build: build-$(target)

build-%:
	@zig build-obj -femit-bin=$(outdir)/$(target).o \
	   -Drelease-small --strip \
		 --cache-dir /tmp/zig-cache \
	   -target avr-freestanding-none \
		 -mcpu=attiny85 $(target).zig

	@$(avrbin)/avr-gcc -Os $(outdir)/$(target).o \
			-mmcu=attiny85 -o $(outdir)/$(target).elf

	@$(avrbin)/avr-objcopy -j .text -j data \
			-O ihex $(outdir)/$(target).elf \
			$(outdir)/$(target).hex

	@$(avrbin)/avr-size -C --mcu=attiny85 \
			$(outdir)/$(target).elf


flash: build-$(target)
	@$(avrbin)/avrdude -p attiny85 -P /dev/ttyACM0 \
			-c avrisp -b 19200 \
			-U flash:w:$(outdir)/$(target).hex:i \
			-C $(avrdir)/etc/avrdude.conf
