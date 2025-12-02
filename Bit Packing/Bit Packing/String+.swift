import Foundation

extension String {
    var array: [Self] {
        let characters = Array(self)

        return characters.map { "\($0)" }
    }
}
