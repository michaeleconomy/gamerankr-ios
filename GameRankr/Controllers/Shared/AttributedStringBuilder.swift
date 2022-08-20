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
    
    func add(_ s: String, color: UIColor? = nil, fontSize: Int? = nil) {
        let add = NSMutableAttributedString(string: s)
        if let color = color {
            add.addAttribute(.foregroundColor, value: color, range: NSRange(location: 0, length: add.length))
        }
        if let fontSize = fontSize {
            let font = UIFont.systemFont(ofSize: CGFloat(fontSize))
            add.addAttribute(.font, value: font, range: NSRange(location: 0, length: add.length))
        }
        string.append(add)
    }
    
    func add(_ s: AttributedStringBuilder) {
        string.append(s.string)
    }
}

class PredefinedColors {
    static let grey = UIColor(#colorLiteral(red: 0.4027910157, green: 0.4027910157, blue: 0.4027910157, alpha: 1))
    static let starRed = UIColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
    static let starGrey = UIColor(#colorLiteral(red: 0.7, green: 0.7, blue: 0.7, alpha: 1))
}
