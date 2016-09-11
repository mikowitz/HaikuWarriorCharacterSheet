//: Playground - noun: a place where people can play

import Foundation

extension String {
    func humanize() -> String {
        var newStr = ""
        for (i, chr) in self.characters.enumerated() {
            var nextChar = "\(chr)"
            if i == 0 {
                nextChar = nextChar.uppercased()
            } else {
                if "A" <= nextChar && nextChar <= "Z" {
                    newStr += " "
                }
            }
            newStr += nextChar
        }
        return newStr
    }
}

"OnionGlaive".humanize()

"treasureHunting".humanize()

"luck".humanize()
