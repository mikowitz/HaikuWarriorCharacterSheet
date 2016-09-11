//
//  ShopViewController+TableViewDelegate.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 9/1/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

import UIKit

extension ShopViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopCell", for: indexPath) as! ShopTableViewCell
        let item = Shop.items[indexPath.row]

        cell.textLabel?.text = String(describing: item).humanize()
        cell.detailTextLabel?.text = "\(item.cost) C"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        let item = Shop.items[indexPath.row]
        return item.cost <= globalCharacter.coins
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let buy = UITableViewRowAction(style: .default, title: "Buy") { action, index in
            print(indexPath)
            self.buyItem(at: indexPath)
        }
        buy.backgroundColor = .green
        return [buy]
    }
    
    func buyItem(at indexPath: IndexPath) {
        let item = Shop.items[indexPath.row]
        switch indexPath.row {
        case 0:
            globalCharacter.weapon = .KnaveGlaive
        case 1:
            globalCharacter.weapon = .TranquilGlaive
        case 2:
            globalCharacter.weapon = .CurvyGlaive
        case 3:
            globalCharacter.weapon = .GroovyGlaive
        case 4:
            globalCharacter.weapon = .PartyGlaive
        case 5:
            globalCharacter.weapon = .SpiritGlaive
        case 6:
            globalInventory.peaches = globalInventory.peaches + 1
        case 7:
            globalInventory.grapes = globalInventory.grapes + 1
        case 8:
            globalInventory.pears = globalInventory.pears + 1
        case 9:
            globalInventory.chickenLegs = globalInventory.chickenLegs + 1
        case 10:
            globalCharacter.maxHP = globalCharacter.maxHP + 1
        case 11:
            let newLuck = globalCharacter.luck + 4
            if newLuck > globalCharacter.maxLuck {
                globalCharacter.luck = globalCharacter.maxLuck
            } else {
                globalCharacter.luck = newLuck
            }
        default:
            print("uh oh")
        }
        globalCharacter.coins = globalCharacter.coins - item.cost
        globalCharacter.save()
        globalInventory.save()
        shopTable.reloadData()
        (self.tabBarController as! HaikuWarriorTabBarController).redraw()
    }
}
