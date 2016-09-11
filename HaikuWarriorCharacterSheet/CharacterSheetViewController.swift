//
//  CharacterSheetViewController.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 8/31/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

import UIKit

class CharacterSheetViewController: UIViewController {
    var characterTable: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.title = "Character"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("reloading character table")
        characterTable.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        configureViews()
        configureLayout()
    }
}
