import Foundation

extension elfReader {

    static func checkEndianess(bytes: Data) throws -> Endianess {

        guard let endian = Endianess(rawValue: bytes[0x05]) else {
            throw parseError.noEndianBit
        }
        return endian
    }

    public enum Endianess: UInt8 {
        case littleEndian = 1
        case bigEndian = 2
    }
}
