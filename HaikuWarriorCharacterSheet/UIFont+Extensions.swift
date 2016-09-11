//
//  UIFont+Extensions.swift
//  HaikuWarriorCharacterSheet
//
//  Created by Michael Berkowitz on 9/11/16.
//  Copyright © 2016 Michael Berkowitz. All rights reserved.
//

import UIKit

extension UIFont {
    static func buttonFont() -> UIFont {
        return boldSystemFont(ofSize: 30)
    }
    
    static func labelFont() -> UIFont {
        return systemFont(ofSize: 20)
    }
}
