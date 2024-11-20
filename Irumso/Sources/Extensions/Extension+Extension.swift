//
//  Extension+Extension.swift
//  Irumso
//
//  Created by dezxcvb on 11/18/24.
//

import UIKit

extension UIView {
    func addSubviews(views: [UIView]) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
