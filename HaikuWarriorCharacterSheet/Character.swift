//
//  Character.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 8/31/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

import Foundation

class Character: NSObject, NSCoding {
    var currentHP = 16
    var maxHP = 16
    var survival = 9
    var treasureHunting = 10
    var foraging = 9
    var luck = 2
    var maxLuck = 2
    var coins = 0
    var souls = 0
    
    var weapon: Weapon = .OnionGlaive
    
    override init() { }
    
    required init(coder aDecoder: NSCoder) {
        self.currentHP = aDecoder.decodeInteger(forKey: "currentHP")
        self.maxHP = aDecoder.decodeInteger(forKey: "maxHP")
        self.survival = aDecoder.decodeInteger(forKey: "survival")
        self.treasureHunting = aDecoder.decodeInteger(forKey: "treasureHunting")
        self.foraging = aDecoder.decodeInteger(forKey: "foraging")
        self.luck = aDecoder.decodeInteger(forKey: "luck")
        self.maxLuck = aDecoder.decodeInteger(forKey: "maxLuck")
        
        self.coins = aDecoder.decodeInteger(forKey: "coins")
        self.souls = aDecoder.decodeInteger(forKey: "souls")
        
        if let weaponRawValue = aDecoder.decodeObject(forKey: "weapon") as? String {
            self.weapon = Weapon(rawValue: weaponRawValue)!
        } else {
            self.weapon = .OnionGlaive
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(currentHP, forKey: "currentHP")
        aCoder.encode(maxHP, forKey: "maxHP")
        aCoder.encode(survival, forKey: "survival")
        aCoder.encode(treasureHunting, forKey: "treasureHunting")
        aCoder.encode(foraging, forKey: "foraging")
        aCoder.encode(luck, forKey: "luck")
        aCoder.encode(maxLuck, forKey: "maxLuck")
        
        aCoder.encode(coins, forKey: "coins")
        aCoder.encode(souls, forKey: "souls")
        
        aCoder.encode(weapon.rawValue, forKey: "weapon")
    }
    
    static func loadCharacter() -> Character {
        print("loading Character...")
        if let archivedCharacter = UserDefaults.standard.value(forKey: "character") {
            let unarchivedCharacter = NSKeyedUnarchiver.unarchiveObject(with: archivedCharacter as! Data)
            if let character = unarchivedCharacter as? Character {
                return character
            }
        }
        return Character()
    }
    
    func save() {
        let archivedCharacter = NSKeyedArchiver.archivedData(withRootObject: self)
        UserDefaults.standard.set(archivedCharacter, forKey: "character")
    }
}

var globalCharacter = Character.loadCharacter()
