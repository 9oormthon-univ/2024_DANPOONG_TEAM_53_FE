//
//  HomeCVCell.swift
//  Irumso
//
//  Created by 김은상 on 11/23/24.
//

import UIKit

class HomeCVCell: UICollectionViewCell {
    static let reuseIdentifier: String = "HomeCVCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureHomeCVCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeCVCell {
    private func configureHomeCVCell() {
        self.backgroundColor = .color5
    }
}
