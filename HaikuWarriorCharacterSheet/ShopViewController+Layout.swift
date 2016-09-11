//
//  ShopViewController+Layout.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 9/1/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

import UIKit

extension ShopViewController {
    func configureViews() {
        shopTable.delegate = self
        shopTable.dataSource = self
        shopTable.register(ShopTableViewCell.self, forCellReuseIdentifier: "ShopCell")
        
        view.addSubview(shopTable)
    }
    
    func configureLayout() {
        shopTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shopTable.topAnchor.constraint(equalTo: view.topAnchor),
            shopTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            shopTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            shopTable.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
