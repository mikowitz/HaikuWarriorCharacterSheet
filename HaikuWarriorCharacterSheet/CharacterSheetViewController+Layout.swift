//
//  CharacterSheetViewController+Layout.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 9/1/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

import UIKit

extension CharacterSheetViewController {
    func configureViews() {
        characterTable.delegate = self
        characterTable.dataSource = self
        characterTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        characterTable.register(CharacterStatTableViewCell.self, forCellReuseIdentifier: "StatCell")
        characterTable.register(WeaponTableViewCell.self, forCellReuseIdentifier: "WeaponCell")
        view.addSubview(characterTable)
    }
    
    func configureLayout() {
        characterTable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterTable.topAnchor.constraint(equalTo: view.topAnchor),
            characterTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            characterTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            characterTable.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
    }
}
