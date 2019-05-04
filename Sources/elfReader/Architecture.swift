import Foundation

extension elfReader {

    static func architectureBit(bytes: Data) throws -> Architecture {

        guard let arch = Architecture(rawValue: bytes[0x04]) else {
            throw parseError.noArchBit
        }
        return arch
    }

    public enum Architecture: UInt8 {
        case elf32 = 1
        case elf64 = 2
    }
}
