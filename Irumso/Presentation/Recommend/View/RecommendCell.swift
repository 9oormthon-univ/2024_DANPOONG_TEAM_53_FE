//
//  RecommendCell.swift
//  Irumso
//
//  Created by 김은상 on 11/24/24.
//

import UIKit

class RecommendCell: UITableViewCell {
    static let reuseIdentifier: String = "RecommendCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureRecommendCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RecommendCell {
    private func configureRecommendCell() {
        self.backgroundColor = .white
    }
}
