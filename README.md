# A Multimedia Introduction to How Computers Work on C64

A slide show demoed to kindergarteners on the basic workings of a computer. Not
limited to 8bit, but this application runs only on a Commodore 64 (or an emaulator such as [VICE](https://vice-emu.sourceforge.io/))

## Usage

Once built, load `oldschool64.prg` or the disk version containing the binary in
`oldschool64.d64` on your Commodore 64 or emulator. Use game **port 2** and the left and
right direction to navigate the slides.

## Tools Used

This project makes use of [VS64](https://marketplace.visualstudio.com/items?itemName=rosc.vs64) for building the [Kick Assembler](http://theweb.dk/KickAssembler/Main.html#frontpage) assembly code.

If you do not wish to use VS64, you can compile the project with the following:

```
java -jar KickAss.jar -odir build -o build/oldschool64.prg src/loader.s
```

There are a few VS Code tasks defined:

* The default build task will create the binary `build/oldschool64.prg`
* If you have VICE toolset installed a D64 disk image can be created as as `build/oldschoold64.d64`
* If you have [exomizer](https://csdb.dk/release/?id=204524) you can choose the compressed target to build `build/oldschool64c.prg`

The static slides were initially created using
[Petmate](https://nurpax.github.io/petmate/)

[![Youtube Video From
Emulator](https://img.youtube.com/vi/GHbPxBWjnU8/0.jpg)](https://www.youtube.com/watch?v=GHbPxBWjnU8)
