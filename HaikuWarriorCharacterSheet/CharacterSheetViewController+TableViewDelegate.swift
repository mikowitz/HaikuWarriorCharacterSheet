//
//  CharacterSheetViewController+TableViewDelegate.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 9/1/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

import UIKit

extension CharacterSheetViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return buildStatCellForKey("maxHP", in: tableView, at: indexPath)
        }
        if indexPath.row == 1 {
            return buildStatCellForKey("currentHP", in: tableView, at: indexPath)
        }
        if indexPath.row == 2 {
            let cell = WeaponTableViewCell(style: .value1, reuseIdentifier: "WeaponCell")
            return cell
//            let cell = tableView.dequeueReusableCell(withIdentifier: "WeaponCell", for: indexPath) as! WeaponTableViewCell
//            return cell
        }
        if indexPath.row == 3 {
            return buildStatCellForKey("survival", in: tableView, at: indexPath)
        }
        if indexPath.row == 4 {
            return buildStatCellForKey("treasureHunting", in: tableView, at: indexPath)
        }
        if indexPath.row == 5 {
            return buildStatCellForKey("foraging", in: tableView, at: indexPath)
        }
        if indexPath.row == 6 {
            return buildStatCellForKey("luck", in: tableView, at: indexPath)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Coming soon..."
        return cell
    }
    
    func buildStatCellForKey(_ key: String, in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatCell", for: indexPath) as! CharacterStatTableViewCell
        cell.statKey = key
        return cell
    }
}
