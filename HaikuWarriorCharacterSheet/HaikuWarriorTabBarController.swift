//
//  HaikuWarriorTabBarController.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 8/31/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

import UIKit

class HaikuWarriorTabBarController: UITabBarController {
    var coinsCounter = UIBarButtonItem(title: "C: 0", style: .plain, target: nil, action: nil)
    var soulsCounter = UIBarButtonItem(title: "S: 0", style: .plain, target: nil, action: nil)
    
    var coinsPlus = UIBarButtonItem()
    var coinsMinus = UIBarButtonItem()
    var soulsPlus = UIBarButtonItem()
    var soulsMinus = UIBarButtonItem()

    var character: Character {
        get {
            return globalCharacter
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cresswell"

        coinsCounter.tintColor = .black
        soulsCounter.tintColor = .black
        
        coinsPlus = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(addCoin))
        coinsMinus = UIBarButtonItem(title: "-", style: .plain, target: self, action: #selector(substractCoin))
        soulsPlus = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(addSoul))
        soulsMinus = UIBarButtonItem(title: "-", style: .plain, target: self, action: #selector(subtractSoul))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        redraw()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HaikuWarriorTabBarController {
    func addCoin() {
        character.coins = character.coins + 1
        redraw()
    }
    
    func substractCoin() {
        guard character.coins > 0 else { return }
        character.coins = character.coins - 1
        redraw()
    }
    
    func addSoul() {
        character.souls = character.souls + 1
        redraw()
    }
    
    func subtractSoul() {
        guard character.souls > 0 else { return }
        character.souls = character.souls - 1
        redraw()
    }
    
    func redraw() {
        globalCharacter.save()
        coinsCounter = buildBarButtonItem(prefix: "C", value: character.coins)
        soulsCounter = buildBarButtonItem(prefix: "S", value: character.souls)
        navigationItem.leftBarButtonItems = [soulsMinus, soulsCounter, soulsPlus]
        navigationItem.rightBarButtonItems = [coinsPlus, coinsCounter, coinsMinus]

    }
    
    func buildBarButtonItem(prefix: String, value: Int) -> UIBarButtonItem {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("\(prefix): \(value)", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.sizeToFit()
        return UIBarButtonItem(customView: button)
        
    }
}
