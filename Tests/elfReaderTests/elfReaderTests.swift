import XCTest
@testable import elfReader

final class elfReaderTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(elfReader().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
