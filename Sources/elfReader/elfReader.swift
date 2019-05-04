import Foundation

struct elfReader {

    static let magicBytes = "7F454C46"

    public let magic: String
    public let architecture: Architecture
    public let endianess: Endianess
    public let identifier: elfIdentifier
    public let machine: InstructionSet
    public let osABI: operatingSystemABI
    public let version: UInt8

    public init(data: Data) throws {

        // check magic
        self.magic = try elfReader.checkMagic(bytes: data)

        // 32 or 64 bit ?
        self.architecture = try elfReader.architectureBit(bytes: data)

        // little or big endian?
        self.endianess = try elfReader.checkEndianess(bytes: data)

        // elf version
        self.version = try elfReader.elfVersion(bytes: data)

        // target os ABI
        self.osABI = try elfReader.checkOSABI(bytes: data)

        // EI_ABIVERSION - likely 0

        // unused 0x09 byte

        // after reading the first 10 bytes,
        // determine how to read the next 42 (32 bit) or 54 (64 bit) bytes.
        // switch on endianess etc

        // object file type 0x10...0x11
        self.identifier = try elfReader.readFileIdentifier(bytes: data)

        // instruction architecture
        self.machine = try elfReader.checkMachine(bytes: data)

        // elf version 0x14

        // entry point memory address

        // program header table
    }

    static func checkMagic(bytes: Data) throws -> String {

        guard bytes[0x00...0x03].asHex() == magicBytes else {
            throw parseError.notELF
        }
        // to match the "magic" output of eu-readelf -h
        return bytes[0x00..<0x10].asHex().separate()
    }

    static func elfVersion(bytes: Data) throws -> UInt8 {
        guard bytes[0x06] == UInt8(1) else {
            throw parseError.invalidElfVersion
        }
        return bytes[0x06]
    }
}
