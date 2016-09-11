//
//  InventoryViewController+TableViewDelegate.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 9/1/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

import UIKit

extension InventoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InventoryCell", for: indexPath) as! InventoryTableViewCell
        cell.inventoryKey = items()[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let use = UITableViewRowAction(style: .default, title: "Use") { action, index in
            let cell = tableView.cellForRow(at: indexPath) as! InventoryTableViewCell
            globalInventory.setValue(cell.inventoryCount - 1, forKey: cell.inventoryKey)
            globalInventory.save()
            tableView.reloadData()
        }
        let get = UITableViewRowAction(style: .default, title: "Get") { action, index in
            let cell = tableView.cellForRow(at: indexPath) as! InventoryTableViewCell
            globalInventory.setValue(cell.inventoryCount + 1, forKey: cell.inventoryKey)
            globalInventory.save()
            tableView.reloadData()
        }

        use.backgroundColor = .blue
        get.backgroundColor = .green
        return [use, get]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if let cell = tableView.cellForRow(at: indexPath) as! InventoryTableViewCell? {
            return cell.inventoryCount > 0
        } else {
            return false
        }
    }
    
    func items() -> [String] {
        return ["pears", "grapes", "peaches", "chickenLegs"]
    }
}
