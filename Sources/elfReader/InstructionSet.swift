import Foundation

extension elfReader {

        static func checkMachine(bytes: Data) throws -> InstructionSet {

        guard let machine = InstructionSet(rawValue: bytes[0x12]) else {
            throw parseError.invalidInstructionSet
        }
        return machine
    }

    // TODO: Complete definitions
    public enum InstructionSet: UInt8 {
        case EM_NONE = 0x00
        case EM_M32 = 0x01
        case EM_SPARC = 0x02
        case EM_386 = 0x03
        case EM_68K = 0x04
        case EM_88K = 0x05
        case EM_IAMCU = 0x06
        case EM_860 = 0x07
        case EM_MIPS = 0x08
        case EM_S370 = 0x09
        case EM_MIPS_RS3_LE = 0x0A
        // 0x0B - 0x0E : Reserved for future use
        case EM_PARISC = 0x0F
        // 0x10 : Reserved for future use
        case EM_VPP500 = 0x11
        case EM_SPARC32PLUS = 0x12
        case EM_960 = 0x13
        case EM_PPC = 0x14
        case EM_S390 = 0x16
        case EM_ARM = 0x28
        case EM_SH = 0x2A
        case EM_IA_64 = 0x32
        case EM_X86_64 = 0x3E
        case EM_AARCH64 = 0xB7 // 183
        case EM_RISCV = 0xF3 // 243

        // taken from http://www.sco.com/developers/gabi/latest/ch4.eheader.html
        public var description: String {
            switch self {
            case .EM_NONE:
                return "No machine"
            case .EM_M32:
                return "AT&T WE 32100"
            case .EM_SPARC:
                return "SPARC"
            case .EM_386:
                return "Intel 80386 (x86)"
            case .EM_68K:
                return "Motorola 68000"
            case .EM_88K:
                return "Motorola 88000"
            case .EM_IAMCU:
                return "Intel MCU"
            case .EM_860:
                return "Intel 80860"
            case .EM_MIPS:
                return "MIPS I Architecture"
            case .EM_S370:
                return "IBM System/370 Processor"
            case .EM_MIPS_RS3_LE:
                return "MIPS RS3000 Little-endian"
            case .EM_PARISC:
                return "Hewlett-Packard PA-RISC"
            case .EM_VPP500:
                return "Fujitsu VPP500"
            case .EM_SPARC32PLUS:
                return "Enhanced instruction set SPARC"
            case .EM_960:
                return "Intel 80960"
            case .EM_PPC:
                return "PowerPC"
            case .EM_S390:
                return "IBM System/390 Processor"
            case .EM_ARM:
                return "ARM 32-bit architecture (AARCH32)"
            case .EM_SH:
                return "Hitachi SH"
            case .EM_IA_64:
                return "Intel IA-64 processor architecture"
            case .EM_X86_64:
                return "AMD x86-64 architecture"
            case .EM_AARCH64:
                return "ARM 64-bit architecture (AARCH64)"
            case .EM_RISCV:
                return "RISC-V"
            }
        }
    }
}
