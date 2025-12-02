import Foundation

extension Bool {
    init(_ byte: UInt8) {
        self = byte != .zero
    }
}
