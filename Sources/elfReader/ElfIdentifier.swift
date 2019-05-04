import Foundation

extension elfReader {

    static func readFileIdentifier(bytes: Data) throws -> elfIdentifier {

        let bytes = bytes[0x10...0x11]

        guard let uInt16 = bytes.to(type: UInt16.self),
            let identifier = elfIdentifier(rawValue: uInt16) else {
                throw parseError.fileIdentifier
        }
        return identifier
    }

    public enum elfIdentifier: UInt16 {
        case ET_NONE = 0x00
        case ET_REL = 0x01
        case ET_EXEC = 0x02
        case ET_DYN = 0x03
        case ET_CORE = 0x04
        case ET_LOOS = 0xfe00 // 65024
        case ET_HIOS = 0xfeff // 65279
        case ET_LOCPROC = 0xff00 // 65280
        case ET_HIPROC = 0xffff // 65535

        public var description: String {
            switch self {
            case .ET_NONE:
                return "No file type"
            case .ET_REL:
                return "Relocatable file"
            case .ET_EXEC:
                return "Executable file"
            case .ET_DYN:
                return "Shared object file"
            case .ET_CORE:
                return "Core file"
            case .ET_LOOS, .ET_HIOS:
                return "Operating system-specific"
            case .ET_LOCPROC, .ET_HIPROC:
                return "Processor-specific"
            }
        }
    }
}
