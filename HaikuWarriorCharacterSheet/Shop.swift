//
//  Shop.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 9/1/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

import Foundation

enum ShopItem {
    case knaveGlaive
    case tranquilGlaive
    case curvyGlaive
    case groovyGlaive
    case partyGlaive
    case spiritGlaive
    case peach
    case grapes
    case pear
    case chickenLeg
    case bicepOil
    case luckyCream
    
    var cost: Int {
        if self == .knaveGlaive { return 1 }
        if [.peach, .bicepOil, .luckyCream].contains(self) { return 3 }
        if self == .grapes { return 4 }
        if self == .pear { return 5 }
        if [.tranquilGlaive, .curvyGlaive, .groovyGlaive, .chickenLeg].contains(self) {
            return 7
        }
        return 13
    }
    
}

class Shop {
    static let items: [ShopItem] = [.knaveGlaive, .tranquilGlaive, .curvyGlaive,
                                    .groovyGlaive, .partyGlaive, .spiritGlaive,
                                    .peach, .grapes, .pear, .chickenLeg,
                                    .bicepOil, .luckyCream]
}
