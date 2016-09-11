//
//  CharacterStatTableViewCell.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 9/1/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

import UIKit

class CharacterStatTableViewCell: UITableViewCell {
    let statLabel = UILabel()
    let statValue = UILabel()
    let plusButton = UIButton()
    let minusButton = UIButton()
    var stat: Int = 0 {
        didSet {
            statValue.text = String(stat)
        }
    }
    var statKey: String = "" {
        didSet {
            statLabel.text = humanizeLabel(statKey)
            self.stat = globalCharacter.value(forKey: statKey) as! Int
        }
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(.white, for: .normal)
        plusButton.titleLabel?.font = UIFont.buttonFont()
        plusButton.backgroundColor = .green
        plusButton.addTarget(self, action: #selector(increase), for: .touchUpInside)
        
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor(.white, for: .normal)
        minusButton.titleLabel?.font = UIFont.buttonFont()
        minusButton.backgroundColor = .red
        minusButton.addTarget(self, action: #selector(decrease), for: .touchUpInside)
        
        statValue.textAlignment = .center
        statValue.font = UIFont.labelFont()
        
        statLabel.font = UIFont.labelFont()
        
        configureLayout()
    }
    
    func increase() {
        guard statKey != "currentHP" || (statKey == "currentHP" && stat < globalCharacter.maxHP) else { return }
        stat = stat + 1
        updateCharacter()
        let currentColor = contentView.backgroundColor
        UIView.animate(withDuration: 0.2, animations: {
            self.contentView.backgroundColor = UIColor(colorLiteralRed: 0, green: 1, blue: 0, alpha: 0.5)
        }, completion: { completed in
            UIView.animate(withDuration: 0.2) {
                self.contentView.backgroundColor = currentColor
            }
        })
    }
    
    func decrease() {
        guard stat > 0 || self.statKey == "currentHP" else { return }
        stat = stat - 1
        updateCharacter()
        let currentColor = contentView.backgroundColor
        UIView.animate(withDuration: 0.2, animations: {
            self.contentView.backgroundColor = UIColor(colorLiteralRed: 1, green: 0, blue: 0, alpha: 0.5)
            }, completion: { completed in
                UIView.animate(withDuration: 0.2) {
                    self.contentView.backgroundColor = currentColor
                }
        })

    }
    
    func updateCharacter() {
        globalCharacter.setValue(stat, forKey: statKey)
        globalCharacter.save()
    }
    
    // MARK:
    // MARK: unused
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

    // MARK:
    // MARK: layout
    func configureLayout() {
        contentView.addSubview(statLabel)
        contentView.addSubview(statValue)
        contentView.addSubview(plusButton)
        contentView.addSubview(minusButton)
        
        statLabel.translatesAutoresizingMaskIntoConstraints = false
        statValue.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        
//        let margins = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            
            plusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            plusButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            plusButton.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            plusButton.widthAnchor.constraint(equalTo: contentView.heightAnchor),
            
            statValue.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -16),
            statValue.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            statValue.widthAnchor.constraint(equalToConstant: 44),
            
            minusButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            minusButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            minusButton.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            minusButton.widthAnchor.constraint(equalTo: contentView.heightAnchor),
            
            statLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 16),
            statLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
        ])
    }
    
    func humanizeLabel(_ label: String) -> String {
        switch label {
        case "maxHP":
            return "Maximum HP"
        case "currentHP":
            return "Current HP"
        default:
            return label.humanize()
        }
    }
}
