//
//  Inventory.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 9/1/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

import Foundation

class Inventory: NSObject, NSCoding {
    var pears = 0
    var grapes = 1
    var peaches = 2
    var chickenLegs = 3
    
    override init() { }
    
    required init(coder aDecoder: NSCoder) {
        self.pears = aDecoder.decodeInteger(forKey: "pears")
        self.grapes = aDecoder.decodeInteger(forKey: "grapes")
        self.peaches = aDecoder.decodeInteger(forKey: "peaches")
        self.chickenLegs = aDecoder.decodeInteger(forKey: "chickenLegs")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(pears, forKey: "pears")
        aCoder.encode(grapes, forKey: "grapes")
        aCoder.encode(peaches, forKey: "peaches")
        aCoder.encode(chickenLegs, forKey: "chickenLegs")
    }
    
    static func loadInventory() -> Inventory {
        print("loading Inventory...")
        if let archivedInventory = UserDefaults.standard.value(forKey: "inventory") {
            let unarchivedInventory = NSKeyedUnarchiver.unarchiveObject(with: archivedInventory as! Data)
            if let inventory = unarchivedInventory as? Inventory {
                return inventory
            }
        }
        return Inventory()
    }
    
    func save() {
        let archivedInventory = NSKeyedArchiver.archivedData(withRootObject: self)
        UserDefaults.standard.set(archivedInventory, forKey: "inventory")
    }
}

var globalInventory = Inventory.loadInventory()
