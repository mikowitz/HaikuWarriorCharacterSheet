//
//  WeaponTableViewCell.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 9/1/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

import UIKit

class WeaponTableViewCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
        print("init WeaponTableViewCell...")
        self.textLabel?.text = String(describing: globalCharacter.weapon).humanize()
        self.detailTextLabel?.text = globalCharacter.weapon.rawValue

        textLabel?.font = UIFont.labelFont()
        detailTextLabel?.font = UIFont.labelFont()
        detailTextLabel?.textAlignment = .center
        
        textLabel?.translatesAutoresizingMaskIntoConstraints = false
        detailTextLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            (textLabel?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.height + 24))!,
            (textLabel?.centerYAnchor.constraint(equalTo: contentView.centerYAnchor))!,
            
            (detailTextLabel?.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -(contentView.frame.height + 24)))!,
            (detailTextLabel?.centerYAnchor.constraint(equalTo: contentView.centerYAnchor))!,
            
            (detailTextLabel?.widthAnchor.constraint(equalToConstant: 44))!
        ])
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
