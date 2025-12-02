import Foundation

extension UInt8 {
    var asString: String {
        let leadingZeroBitString = String(repeating: "0", count: leadingZeroBitCount)

        guard leadingZeroBitCount < bitWidth else {
            return leadingZeroBitString
        }

        return leadingZeroBitString + .init(self, radix: 2)
    }
}
