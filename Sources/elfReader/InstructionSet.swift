import Foundation

extension elfReader {

        static func checkMachine(bytes: Data) throws -> InstructionSet {

        guard let machine = InstructionSet(rawValue: bytes[0x12]) else {
            throw parseError.invalidInstructionSet
        }
        return machine
    }

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
        case EM_PPC64 = 0x15
        case EM_S390 = 0x16
        case EM_SPU = 0x17
        // 0x18 - 0x23 : Reserved for future use
        case EM_V800 = 0x24
        case EM_FR20 = 0x25
        case EM_RH32 = 0x26
        case EM_RCE = 0x27
        case EM_ARM = 0x28
        case EM_SH = 0x2A
        case EM_SPARCV9 = 0x2B
        case EM_TRICORE = 0x2C
        case EM_ARC = 0x2D
        case EM_H8_300 = 0x2E
        case EM_H8_300H = 0x2F
        case EM_H8S = 0x30
        case EM_H8_500 = 0x31
        case EM_IA_64 = 0x32
        case EM_MIPS_X = 0x33
        case EM_COLDFIRE = 0x34
        case EM_68HC12 = 0x35
        case EM_MMA = 0x36
        case EM_PCP = 0x37
        case EM_NCPU = 0x38
        case EM_NDR1 = 0x39
        case EM_STARCORE = 0x3A
        case EM_ME16 = 0x3B
        case EM_ST100 = 0x3C
        case EM_TINYJ = 0x3D
        case EM_X86_64 = 0x3E
        case EM_PDSP = 0x3F
        case EM_PDP10 = 0x40
        case EM_PDP11 = 0x41
        case EM_FX66 = 0x42
        case EM_ST9PLUS = 0x43
        case EM_ST7 = 0x44
        case EM_68HC16 = 0x45
        case EM_68HC11 = 0x46
        case EM_68HC08 = 0x47
        case EM_68HC05 = 0x48
        case EM_SVX = 0x49
        case EM_ST19 = 0x4A
        case EM_VAX = 0x4B
        case EM_CRIS = 0x4C
        case EM_JAVELIN = 0x4D
        case EM_FIREPATH = 0x4E
        case EM_ZSP = 0x4F
        case EM_MMIX = 0x50
        case EM_HUANY = 0x51
        case EM_PRISM = 0x52
        case EM_AVR = 0x53
        case EM_FR30 = 0x54
        case EM_D10V = 0x55
        case EM_D30V = 0x56
        case EM_V850 = 0x57
        case EM_M32R = 0x58
        case EM_MN10300 = 0x59
        case EM_MN10200 = 0x5A
        case EM_PJ = 0x5B
        case EM_OPENRISC = 0x5C
        case EM_ARC_COMPACT = 0x5D
        case EM_XTENSA = 0x5E
        case EM_VIDEOCORE = 0x5F
        case EM_TMM_GPP = 0x60
        case EM_NS32K = 0x61
        case EM_TPC = 0x62
        case EM_SNP1K = 0x63
        case EM_ST200 = 0x64
        case EM_IP2K = 0x65
        case EM_MAX = 0x66
        case EM_CR = 0x67
        case EM_F2MC16 = 0x68
        case EM_MSP430 = 0x69
        case EM_BLACKFIN = 0x6A
        case EM_SE_C33 = 0x6B
        case EM_SEP = 0x6C
        case EM_ARCA = 0x6D
        case EM_UNICORE = 0x6E
        case EM_EXCESS = 0x6F
        case EM_DXP = 0x70
        case EM_ALTERA_NIOS2 = 0x71
        case EM_CRX = 0x72
        case EM_XGATE = 0x73
        case EM_C166 = 0x74
        case EM_M16C = 0x75
        case EM_DSPIC30F = 0x76
        case EM_CE = 0x77
        case EM_M32C = 0x78
        // 0x79 - 0x82 : Reserved for future use
        case EM_TSK3000 = 0x83
        case EM_RS08 = 0x84
        case EM_SHARC = 0x85
        case EM_ECOG2 = 0x86
        case EM_SCORE7 = 0x87
        case EM_DSP24 = 0x88
        case EM_VIDEOCORE3 = 0x89
        case EM_LATTICEMICO32 = 0x8A
        case EM_SE_C17 = 0x8B
        case EM_TI_C6000 = 0x8C
        case EM_TI_C2000 = 0x8D
        case EM_TI_C5500 = 0x8E
        case EM_TI_ARP32 = 0x8F
        case EM_TI_PRU = 0x90
        // 0x91 - 0x9F reserved for future use
        case EM_MMDSP_PLUS = 0xA0
        case EM_CYPRESS_M8C = 0xA1
        case EM_R32C = 0xA2
        case EM_TRIMEDIA = 0xA3
        case EM_QDSP6 = 0xA4
        case EM_8051 = 0xA5
        case EM_STXP7X = 0xA6
        case EM_NDS32 = 0xA7
        case EM_ECOG1 = 0xA8
        case EM_MAXQ30 = 0xA9
        case EM_XIMO16 = 0xAA
        case EM_MANIK = 0xAB
        case EM_CRAYNV2 = 0xAC
        case EM_RX = 0xAD
        case EM_METAG = 0xAE
        case EM_MCST_ELBRUS = 0xAF
        case EM_ECOG16 = 0xB0
        case EM_CR16 = 0xB1
        case EM_ETPU = 0xB2
        case EM_SLE9X = 0xB3
        case EM_L10M = 0xB4
        case EM_K10M = 0xB5
        // 0xB6 : Reserved for future use
        case EM_AARCH64 = 0xB7
        // 0xB8 : Reserved for future use
        case EM_AVR32 = 0xB9
        case EM_STM8 = 0xBA
        case EM_TILE64 = 0xBB
        case EM_TILEPRO = 0xBC
        case EM_MICROBLAZE = 0xBD
        case EM_CUDA = 0xBE
        case EM_TILEGX = 0xBF
        case EM_CLOUDSHIELD = 0xC0
        case EM_COREA_1ST = 0xC1
        case EM_COREA_2ND = 0xC2
        case EM_ARC_COMPACT2 = 0xC3
        case EM_OPEN8 = 0xC4
        case EM_RL78 = 0xC5
        case EM_VIDEOCORE5 = 0xC6
        case EM_78KOR = 0xC7
        case EM_56800EX = 0xC8
        case EM_BA1 = 0xC9
        case EM_BA2 = 0xCA
        case EM_XCORE = 0xCB
        case EM_MCHP_PIC = 0xCC
        case EM_INTEL205 = 0xCD
        case EM_INTEL206 = 0xCE
        case EM_INTEL207 = 0xCF
        case EM_INTEL208 = 0xD0
        case EM_INTEL209 = 0xD1
        case EM_KM32 = 0xD2
        case EM_KMX32 = 0xD3
        case EM_KMX16 = 0xD4
        case EM_KMX8 = 0xD5
        case EM_KVARC = 0xD6
        case EM_CDP = 0xD7
        case EM_COGE = 0xD8
        case EM_COOL = 0xD9
        case EM_NORC = 0xDA
        case EM_CSR_KALIMBA = 0xDB
        case EM_Z80 = 0xDC
        case EM_VISIUM = 0xDD
        case EM_FT32 = 0xDE
        case EM_MOXIE = 0xDF
        case EM_AMDGPU = 0xE0
        // 0xE1 - 0xF2 : Unallocated
        case EM_RISCV = 0xF3

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
            case .EM_PPC64:
                return "64-bit PowerPC"
            case .EM_S390:
                return "IBM System/390 Processor"
            case .EM_SPU:
                return "IBM SPU/SPC"
            case .EM_V800:
                return "NEC V800"
            case .EM_FR20:
                return "Fujitsu FR20"
            case .EM_RH32:
                return "TRW RH-32"
            case .EM_RCE:
                return "Motorola RCE"
            case .EM_ARM:
                return "ARM 32-bit architecture (AARCH32)"
            case .EM_SH:
                return "Hitachi SH"
            case .EM_SPARCV9:
                return "SPARC Version 9"
            case .EM_TRICORE:
                return "Siemens TriCore embedded processor"
            case .EM_ARC:
                return "Argonaut RISC Core, Argonaut Technologies Inc."
            case .EM_H8_300:
                return "Hitachi H8/300"
            case .EM_H8_300H:
                return "Hitachi H8/300H"
            case .EM_H8S:
                return "Hitachi H8S"
            case .EM_H8_500:
                return "Hitachi H8/500"
            case .EM_IA_64:
                return "Intel IA-64 processor architecture"
            case .EM_MIPS_X:
                return "Stanford MIPS-X"
            case .EM_COLDFIRE:
                return "Motorola ColdFire"
            case .EM_68HC12:
                return "Motorola M68HC12"
            case .EM_MMA:
                return "Fujitsu MMA Multimedia Accelerator"
            case .EM_PCP:
                return "Siemens PCP"
            case .EM_NCPU:
                return "Sony nCPU embedded RISC processor"
            case .EM_NDR1:
                return "Denso NDR1 microprocessor"
            case .EM_STARCORE:
                return "Motorola Star*Core processor"
            case .EM_ME16:
                return "Toyota ME16 processor"
            case .EM_ST100:
                return "STMicroelectronics ST100 processor"
            case .EM_TINYJ:
                return "Advanced Logic Corp. TinyJ embedded processor family"
            case .EM_X86_64:
                return "AMD x86-64 architecture"
            case .EM_PDSP:
                return "Sony DSP Processor"
            case .EM_PDP10:
                return "Digital Equipment Corp. PDP-10"
            case .EM_PDP11:
                return "Digital Equipment Corp. PDP-11"
            case .EM_FX66:
                return "Siemens FX66 microcontroller"
            case .EM_ST9PLUS:
                return "STMicroelectronics ST9+ 8/16 bit microcontroller"
            case .EM_ST7:
                return "STMicroelectronics ST7 8-bit microcontroller"
            case .EM_68HC16:
                return "Motorola MC68HC16 Microcontroller"
            case .EM_68HC11:
                return "Motorola MC68HC11 Microcontroller"
            case .EM_68HC08:
                return "Motorola MC68HC08 Microcontroller"
            case .EM_68HC05:
                return "Motorola MC68HC05 Microcontroller"
            case .EM_SVX:
                return "Silicon Graphics SVx"
            case .EM_ST19:
                return "STMicroelectronics ST19 8-bit microcontroller"
            case .EM_VAX:
                return "Digital VAX"
            case .EM_CRIS:
                return "Axis Communications 32-bit embedded processor"
            case .EM_JAVELIN:
                return "Infineon Technologies 32-bit embedded processor"
            case .EM_FIREPATH:
                return "Element 14 64-bit DSP Processor"
            case .EM_ZSP:
                return "LSI Logic 16-bit DSP Processor"
            case .EM_MMIX:
                return "Donald Knuth's educational 64-bit processor"
            case .EM_HUANY:
                return "Harvard University machine-independent object files"
            case .EM_PRISM:
                return "SiTera Prism"
            case .EM_AVR:
                return "Atmel AVR 8-bit microcontroller"
            case .EM_FR30:
                return "Fujitsu FR30"
            case .EM_D10V:
                return "Mitsubishi D10V"
            case .EM_D30V:
                return "Mitsubishi D30V"
            case .EM_V850:
                return "NEC v850"
            case .EM_M32R:
                return "Mitsubishi M32R"
            case .EM_MN10300:
                return "Matsushita MN10300"
            case .EM_MN10200:
                return "Matsushita MN10200"
            case .EM_PJ:
                return "picoJava"
            case .EM_OPENRISC:
                return "OpenRISC 32-bit embedded processor"
            case .EM_ARC_COMPACT:
                return "ARC International ARCompact processor (old spelling/synonym: EM_ARC_A5)"
            case .EM_XTENSA:
                return "Tensilica Xtensa Architecture"
            case .EM_VIDEOCORE:
                return "Alphamosaic VideoCore processor"
            case .EM_TMM_GPP:
                return "Thompson Multimedia General Purpose Processor"
            case .EM_NS32K:
                return "National Semiconductor 32000 series"
            case .EM_TPC:
                return "Tenor Network TPC processor"
            case .EM_SNP1K:
                return "Trebia SNP 1000 processor"
            case .EM_ST200:
                return "STMicroelectronics (www.st.com) ST200 microcontroller"
            case .EM_IP2K:
                return "Ubicom IP2xxx microcontroller family"
            case .EM_MAX:
                return "MAX Processor"
            case .EM_CR:
                return "National Semiconductor CompactRISC microprocessor"
            case .EM_F2MC16:
                return "Fujitsu F2MC16"
            case .EM_MSP430:
                return "Texas Instruments embedded microcontroller msp430"
            case .EM_BLACKFIN:
                return "Analog Devices Blackfin (DSP) processor"
            case .EM_SE_C33:
                return "S1C33 Family of Seiko Epson processors"
            case .EM_SEP:
                return "Sharp embedded microprocessor"
            case .EM_ARCA:
                return "Arca RISC Microprocessor"
            case .EM_UNICORE:
                return "Microprocessor series from PKU-Unity Ltd. and MPRC of Peking University"
            case .EM_EXCESS:
                return "eXcess: 16/32/64-bit configurable embedded CPU"
            case .EM_DXP:
                return "Icera Semiconductor Inc. Deep Execution Processor"
            case .EM_ALTERA_NIOS2:
                return "Altera Nios II soft-core processor"
            case .EM_CRX:
                return "National Semiconductor CompactRISC CRX microprocessor"
            case .EM_XGATE:
                return "Motorola XGATE embedded processor"
            case .EM_C166:
                return "Infineon C16x/XC16x processor"
            case .EM_M16C:
                return "Renesas M16C series microprocessors"
            case .EM_DSPIC30F:
                return "Microchip Technology dsPIC30F Digital Signal Controller"
            case .EM_CE:
                return "Freescale Communication Engine RISC core"
            case .EM_M32C:
                return "Renesas M32C series microprocessors"
            case .EM_TSK3000:
                return "Altium TSK3000 core"
            case .EM_RS08:
                return "Freescale RS08 embedded processor"
            case .EM_SHARC:
                return "Analog Devices SHARC family of 32-bit DSP processors"
            case .EM_ECOG2:
                return "Cyan Technology eCOG2 microprocessor"
            case .EM_SCORE7:
                return "Sunplus S+core7 RISC processor"
            case .EM_DSP24:
                return "New Japan Radio (NJR) 24-bit DSP Processor"
            case .EM_VIDEOCORE3:
                return "Broadcom VideoCore III processor"
            case .EM_LATTICEMICO32:
                return "RISC processor for Lattice FPGA architecture"
            case .EM_SE_C17:
                return "Seiko Epson C17 family"
            case .EM_TI_C6000:
                return "The Texas Instruments TMS320C6000 DSP family"
            case .EM_TI_C2000:
                return "The Texas Instruments TMS320C2000 DSP family"
            case .EM_TI_C5500:
                return "The Texas Instruments TMS320C55x DSP family"
            case .EM_TI_ARP32:
                return "Texas Instruments Application Specific RISC Processor, 32bit fetch"
            case .EM_TI_PRU:
                return "Texas Instruments Programmable Realtime Unit"
            case .EM_MMDSP_PLUS:
                return "STMicroelectronics 64bit VLIW Data Signal Processor"
            case .EM_CYPRESS_M8C:
                return "Cypress M8C microprocessor"
            case .EM_R32C:
                return "Renesas R32C series microprocessors"
            case .EM_TRIMEDIA:
                return "NXP Semiconductors TriMedia architecture family"
            case .EM_QDSP6:
                return "QUALCOMM DSP6 Processor"
            case .EM_8051:
                return "Intel 8051 and variants"
            case .EM_STXP7X:
                return "STMicroelectronics STxP7x family of configurable and extensible RISC processors"
            case .EM_NDS32:
                return "Andes Technology compact code size embedded RISC processor family"
            case .EM_ECOG1:
                return "Cyan Technology eCOG1X family"
            case .EM_MAXQ30:
                return "Dallas Semiconductor MAXQ30 Core Micro-controllers"
            case .EM_XIMO16:
                return "New Japan Radio (NJR) 16-bit DSP Processor"
            case .EM_MANIK:
                return "M2000 Reconfigurable RISC Microprocessor"
            case .EM_CRAYNV2:
                return "Cray Inc. NV2 vector architecture"
            case .EM_RX:
                return "Renesas RX family"
            case .EM_METAG:
                return "Imagination Technologies META processor architecture"
            case .EM_MCST_ELBRUS:
                return "MCST Elbrus general purpose hardware architecture"
            case .EM_ECOG16:
                return "Cyan Technology eCOG16 family"
            case .EM_CR16:
                return "National Semiconductor CompactRISC CR16 16-bit microprocessor"
            case .EM_ETPU:
                return "Freescale Extended Time Processing Unit"
            case .EM_SLE9X:
                return "Infineon Technologies SLE9X core"
            case .EM_L10M:
                return "Intel L10M"
            case .EM_K10M:
                return "Intel K10M"
            case .EM_AARCH64:
                return "ARM 64-bit architecture (AARCH64)"
            case .EM_AVR32:
                return "Atmel Corporation 32-bit microprocessor family"
            case .EM_STM8:
                return "STMicroeletronics STM8 8-bit microcontroller"
            case .EM_TILE64:
                return "Tilera TILE64 multicore architecture family"
            case .EM_TILEPRO:
                return "Tilera TILEPro multicore architecture family"
            case .EM_MICROBLAZE:
                return "Xilinx MicroBlaze 32-bit RISC soft processor core"
            case .EM_CUDA:
                return "NVIDIA CUDA architecture"
            case .EM_TILEGX:
                return "Tilera TILE-Gx multicore architecture family"
            case .EM_CLOUDSHIELD:
                return "CloudShield architecture family"
            case .EM_COREA_1ST:
                return "KIPO-KAIST Core-A 1st generation processor family"
            case .EM_COREA_2ND:
                return "KIPO-KAIST Core-A 2nd generation processor family"
            case .EM_ARC_COMPACT2:
                return "Synopsys ARCompact V2"
            case .EM_OPEN8:
                return "Open8 8-bit RISC soft processor core"
            case .EM_RL78:
                return "Renesas RL78 family"
            case .EM_VIDEOCORE5:
                return "Broadcom VideoCore V processor"
            case .EM_78KOR:
                return "Renesas 78KOR family"
            case .EM_56800EX:
                return "Freescale 56800EX Digital Signal Controller (DSC)"
            case .EM_BA1:
                return "Beyond BA1 CPU architecture"
            case .EM_BA2:
                return "Beyond BA2 CPU architecture"
            case .EM_XCORE:
                return "XMOS xCORE processor family"
            case .EM_MCHP_PIC:
                return "Microchip 8-bit PIC(r) family"
            case .EM_INTEL205, .EM_INTEL206, .EM_INTEL207, .EM_INTEL208, .EM_INTEL209:
                return "Reserved by Intel"
            case .EM_KM32:
                return "KM211 KM32 32-bit processor"
            case .EM_KMX32:
                return "KM211 KMX32 32-bit processor"
            case .EM_KMX16:
                return "KM211 KMX16 16-bit processor"
            case .EM_KMX8:
                return "KM211 KMX8 8-bit processor"
            case .EM_KVARC:
                return "KM211 KVARC processor"
            case .EM_CDP:
                return "Paneve CDP architecture family"
            case .EM_COGE:
                return "Cognitive Smart Memory Processor"
            case .EM_COOL:
                return "Bluechip Systems CoolEngine"
            case .EM_NORC:
                return "Nanoradio Optimized RISC"
            case .EM_CSR_KALIMBA:
                return "CSR Kalimba architecture family"
            case .EM_Z80:
                return "Zilog Z80"
            case .EM_VISIUM:
                return "Controls and Data Services VISIUMcore processor"
            case .EM_FT32:
                return "FTDI Chip FT32 high performance 32-bit RISC architecture"
            case .EM_MOXIE:
                return "Moxie processor family"
            case .EM_AMDGPU:
                return "AMD GPU architecture"
            case .EM_RISCV:
                return "RISC-V"
            }
        }
    }
}
