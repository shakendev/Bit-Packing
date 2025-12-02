import Foundation

enum BitField {
    static func clear(_ byte: UInt8, at position: UInt8) -> UInt8 {
        byte & ~(1 << position)
    }

    static func read(_ byte: UInt8, at position: UInt8) -> UInt8 {
        (byte >> position) & 1
    }

    static func set(_ byte: UInt8, at position: UInt8) -> UInt8 {
        byte | (1 << position)
    }

    static func toggle(_ byte: UInt8, at position: UInt8) -> UInt8 {
        byte ^ (1 << position)
    }
}
