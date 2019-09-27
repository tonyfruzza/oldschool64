.PHONY:
all: .PHONY
	mkdir -p build
	cat globalDefs.s loader.s irq.s input.s slides/*.asm slides/*.s > build/slides.s
	cd build; /usr/local/bin/mac2c64 -r slides.s
	cd build; mv slides.rw cool.prg
	open build/cool.prg
	cd build; /Applications/x64.app/Contents/MacOS/c1541 -format cool,02 d64 cool.d64 -attach cool.d64 -write cool.prg oldschool
