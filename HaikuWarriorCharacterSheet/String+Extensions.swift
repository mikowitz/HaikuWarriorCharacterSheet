//
//  String+Extensions.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 9/1/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

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
