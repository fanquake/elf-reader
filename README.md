# elfReader 🧝

A Swift based [ELF](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format) parser. Written after reading [`Life of a binary`](https://kishuagarwal.github.io/life-of-a-binary.html), see below.

### Build
```shell
swift build
```

### Test
```shell
swift test
```

### Life of a Binary

```shell
docker run -it --rm -v $(pwd)/elf-reader:/elf-reader --workdir /elf-reader/Tests/Resources ubuntu:bionic

# install gcc and readelf
apt update && apt upgrade -y && apt install -y gcc elfutils

gcc --version
-> gcc (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0

# sample.c is provided, so just compile.

gcc -c sample.c

eu-readelf -h sample.o
-> ELF Header:
   Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00
   Class:                             ELF64
   <snip lots more info>
   Section header string table index: 12
```

At this point, you could jump out of the container, and run `swift test`.
A basic test for `elfReader` will look at the `sample.o` we just compiled and dump some ELF header info as part of the output.

```shell
pushd elf-reader
swift test
```

```swift
some: elfReader.elfReader
- magic: "7F 45 4C 46 02 01 01 00 00 00 00 00 00 00 00 00"
- architecture: elfReader.elfReader.Architecture.elf64
- endianess: elfReader.elfReader.Endianess.littleEndian
- identifier: elfReader.elfReader.elfIdentifier.ET_REL
- machine: elfReader.elfReader.InstructionSet.EM_X86_64
- osABI: elfReader.elfReader.operatingSystemABI.systemv
- version: 1
```
