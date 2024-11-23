//
//  UIFont+Extension.swift
//  Irumso
//
//  Created by dezxcvb on 11/20/24.
//

import UIKit

extension UIFont {
    static func customFont(_ name: CustomFontType, size: CGFloat) -> UIFont? {
        switch name {
        case .goormSans400:
            return UIFont(name: "goormSansOTF4", size: size)
        case .goormSans500:
            return UIFont(name: "goormSansOTF5", size: size)
        case .goormSans700:
            return UIFont(name: "goormSansOTF7", size: size)
        }
    }
}


enum CustomFontType: String {
    case goormSans400
    case goormSans500
    case goormSans700
}
