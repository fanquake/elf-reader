import Foundation

extension elfReader {

    static func checkOSABI(bytes: Data) throws -> operatingSystemABI {

        guard let abi = operatingSystemABI(rawValue: bytes[0x07]) else {
            throw parseError.unknownOS
        }
        return abi
    }

    public enum operatingSystemABI : UInt8 {
        case systemv = 0x00
        case hpux = 0x01
        case netbsd = 0x02
        case linux = 0x03
        case gnuhurd = 0x04
        case solaris = 0x06
        case aix = 0x07
        case irix = 0x08
        case freebsd = 0x09
        case tru64 = 0x0A
        case novellmodesto = 0x0B
        case openbsd = 0x0C
        case openvms = 0x0D
        case nonstopkernel = 0x0E
        case aros = 0x0F
        case fenixos = 0x10
        case cloudabi = 0x11

        public var description: String {
            switch self {
            case .systemv:
                return "System V"
            case .hpux:
                return "HP-UX"
            case .netbsd:
                return "NetBSD"
            case .linux:
                return "Linux"
            case .gnuhurd:
                return "GNU Hurd"
            case .solaris:
                return "Solaris"
            case .aix:
                return "AIX"
            case .irix:
                return "IRIX"
            case .freebsd:
                return "FreeBSD"
            case .tru64:
                return "Tru64"
            case .novellmodesto:
                return "Novell Modesto"
            case .openbsd:
                return "OpenBSD"
            case .openvms:
                return "OpenVMS"
            case .nonstopkernel:
                return "Nonstop Kernel"
            case .aros:
                return "AROS"
            case .fenixos:
                return "Fenix OS"
            case .cloudabi:
                return "CloudABI"
            }
        }
    }

}
