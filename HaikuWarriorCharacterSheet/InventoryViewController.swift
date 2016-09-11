//
//  InventoryViewController.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 8/31/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController {
    var inventoryTable: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.title = "Inventory"
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        inventoryTable.reloadData()
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
