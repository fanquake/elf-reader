import Foundation

extension Data {
    func asHex() -> String {
        return self.map { String(format: "%02X", $0) }.joined()
    }

    func asAscii() -> String {
        return self.map { String(format: "%c", $0) }.joined()
    }

    func to<T>(type: T.Type) -> T? where T: ExpressibleByIntegerLiteral {
        var value: T = 0
        guard count >= MemoryLayout.size(ofValue: value) else { return nil }
        _ = Swift.withUnsafeMutableBytes(of: &value, { copyBytes(to: $0)} )
        return value
    }
}

extension String {
    func separate(every stride: Int = 2, with separator: Character = " ") -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
}
