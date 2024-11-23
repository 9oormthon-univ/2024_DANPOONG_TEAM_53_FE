//
//  MyPageCell.swift
//  Irumso
//
//  Created by 김은상 on 11/23/24.
//

import UIKit

class MyPageCell: UITableViewCell {
    static let reuseIndentifier: String = "MyPageCell"
    
    lazy var myPageTitleLabel: UILabel = UILabel().then {
        $0.font = UIFont.customFont(.goormSans700, size: 16)
        $0.textColor = UIColor.black
        $0.textAlignment = .left
    }
    
    lazy var chevronButton: UIButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.tintColor = .darkGray
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureMyPageCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension MyPageCell {
    private func configureMyPageCell() {
        self.backgroundColor = .white
        self.addSubviews(views: [self.myPageTitleLabel, self.chevronButton])
        
        self.myPageTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalTo(200)
        }
        
        self.chevronButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.height.equalTo(20)
        }
        
        
        
    }
}
