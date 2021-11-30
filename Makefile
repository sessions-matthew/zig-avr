outdir = /tmp
avrdir = ~/Applications/.arduino/arduino-1.8.12/hardware/tools/avr
avrbin = $(avrdir)/bin
mcu = attiny85

# make target="blink" -C ./project/
target = blink
build: build-$(target)

build-%:
	@zig build-obj -femit-bin=$(outdir)/$(target).o \
		 -Dmcu=$(mcu) \
	   -Drelease-small --strip \
		 --cache-dir /tmp/zig-cache \
	   -target avr-freestanding-none \
		 -mcpu=$(mcu) $(target).zig

	@$(avrbin)/avr-gcc -Os $(outdir)/$(target).o \
			-mmcu=$(mcu) -o $(outdir)/$(target).elf

	@$(avrbin)/avr-objcopy -j .text -j data \
			-O ihex $(outdir)/$(target).elf \
			$(outdir)/$(target).hex

	@$(avrbin)/avr-size -C --mcu=$(mcu) \
			$(outdir)/$(target).elf

flash: flash-$(mcu)

flash-attiny85: build-$(target)
	@$(avrbin)/avrdude -p $(mcu) -P /dev/ttyACM0 \
			-c avrisp -b 19200 \
			-U flash:w:$(outdir)/$(target).hex:i \
			-C $(avrdir)/etc/avrdude.conf

# this one requires a rst to gnd "button press"
# - will mess with Arduino IDE compatibility
# - will boot within 10 seconds
# - red leds will start powered off after re-connecting
flash-atmega32u4: build-$(target)
	@$(avrbin)/avrdude -p$(mcu) \
			-cavr109 -P/dev/ttyACM0 -b57600 \
			-U flash:w:$(outdir)/$(target).hex:i \
			-C $(avrdir)/etc/avrdude.conf

flash-%: build-$(target)
	@$(avrbin)/avrdude -p $(mcu) -Pusb \
			-U flash:w:$(outdir)/$(target).hex:i \
			-c arduino -P/dev/ttyUSB0 \
			-C $(avrdir)/etc/avrdude.conf
