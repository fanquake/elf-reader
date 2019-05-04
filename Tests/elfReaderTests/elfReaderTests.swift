import XCTest
@testable import elfReader

struct Resource {

    let name: String
    let ext: String

    init(name: String, ext: String) {
        self.name = name
        self.ext = ext
    }

    var url: URL {
        let baseURL = URL(fileURLWithPath: #file).deletingLastPathComponent().deletingLastPathComponent()
        let res = baseURL.appendingPathComponent("Resources")
        return res.appendingPathComponent(name).appendingPathExtension(ext)
    }

    var data: Data? {
        return try? Data(contentsOf: self.url)
    }
}

final class elfReaderTests: XCTestCase {

    func testExample() {

        guard let testData = Resource(name: "sample", ext: "o").data else { return }

        guard let elf = try? elfReader(data: testData) else { return }

        dump(elf)

        XCTAssertEqual(elf.magic, "7F 45 4C 46 02 01 01 00 00 00 00 00 00 00 00 00")
        XCTAssertEqual(elf.endianess, elfReader.Endianess.littleEndian)
        XCTAssertEqual(elf.architecture, elfReader.Architecture.elf64)
        XCTAssertEqual(elf.machine, elfReader.InstructionSet.EM_X86_64)
        XCTAssertEqual(elf.osABI, elfReader.operatingSystemABI.systemv)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
