//
//  InventoryViewController+Layout.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 9/1/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

import UIKit

extension InventoryViewController {
    func configureViews() {
        inventoryTable.delegate = self
        inventoryTable.dataSource = self
        inventoryTable.register(InventoryTableViewCell.self, forCellReuseIdentifier: "InventoryCell")
        
        view.addSubview(inventoryTable)
    }
    
    func configureLayout() {
        inventoryTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inventoryTable.topAnchor.constraint(equalTo: view.topAnchor),
            inventoryTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            inventoryTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            inventoryTable.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
