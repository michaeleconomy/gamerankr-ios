//
//  AttributedStringBuilder.swift
//  GameRankr
//
//  Created by Michael Economy on 8/19/22.
//  Copyright © 2022 Michael. All rights reserved.
//

import Foundation
import UIKit

class AttributedStringBuilder {
    let string = NSMutableAttributedString()
    
    func add(_ s: String, color: UIColor? = nil) {
        let add = NSMutableAttributedString(string: s)
        if let color = color {
            add.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(location: 0, length: add.length))
        }
        string.append(add)
    }
}

class PredefinedColors {
    static let grey = UIColor(#colorLiteral(red: 0.3042527437, green: 0.3042527437, blue: 0.3042527437, alpha: 1))
}
