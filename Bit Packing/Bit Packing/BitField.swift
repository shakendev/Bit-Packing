import Foundation

enum BitPackingOperations {
    static func clear<Number: UnsignedInteger>(_ number: Number, at position: UInt8) -> Number {
        number & ~(1 << position)
    }

    static func read<Number: UnsignedInteger>(_ number: Number, at position: UInt8) -> Number {
        (number >> position) & 1
    }

    static func set<Number: UnsignedInteger>(_ number: Number, at position: UInt8) -> Number {
        number | (1 << position)
    }

    static func toggle<Number: UnsignedInteger>(_ number: Number, at position: UInt8) -> Number {
        number ^ (1 << position)
    }
}
