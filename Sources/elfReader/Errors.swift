import Foundation

extension elfReader {

    enum parseError: Error {
        case fileIdentifier
        case noArchBit
        case notELF
        case noEndianBit
        case invalidInstructionSet
        case unknownOS
        case invalidElfVersion
    }
}
