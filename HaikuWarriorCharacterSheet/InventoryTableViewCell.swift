//
//  InventoryTableViewCell.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 9/1/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

import UIKit

class InventoryTableViewCell: UITableViewCell {
    var inventoryKey: String = "" {
        didSet {
            self.textLabel?.text = inventoryKey.humanize()
            self.detailTextLabel?.text = String(describing: globalInventory.value(forKey: inventoryKey)!)
        }
    }
    var inventoryCount: Int {
        get {
            return globalInventory.value(forKey: inventoryKey) as? Int ?? 0
        }
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
