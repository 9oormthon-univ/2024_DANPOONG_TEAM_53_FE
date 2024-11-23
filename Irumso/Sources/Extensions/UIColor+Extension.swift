//
//  UIColor+Extension.swift
//  Irumso
//
//  Created by dezxcvb on 11/20/24.
//

import UIKit

extension UIColor {
    convenience init(hexValue: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hexValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hexValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hexValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    class var c1: UIColor? { UIColor(named: "Color1") }
    class var c2: UIColor? { UIColor(named: "Color2") }
    class var c3: UIColor? { UIColor(named: "Color3") }
    class var c4: UIColor? { UIColor(named: "Color4") }
    class var c5: UIColor? { UIColor(named:"Color5") }
}
