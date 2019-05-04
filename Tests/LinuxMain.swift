import XCTest

import elfReaderTests

var tests = [XCTestCaseEntry]()
tests += elfReaderTests.allTests()
XCTMain(tests)
