//
//  CommunitySearchBar.swift
//  Irumso
//
//  Created by 김은상 on 11/21/24.
//

import UIKit
import SnapKit
import Then

final class CommunitySearchBar: UIView {
    
    private let searchIcon = UIImageView().then {
        $0.image = UIImage(systemName: "magnifyingglass")
        $0.tintColor = .darkGray
        $0.contentMode = .scaleAspectFit
    }
    
    
    private let searchPostTextField = UITextField().then {
        $0.placeholder = "게시글 검색"
        $0.font = UIFont.customFont(.goormSans500, size: 14)
        $0.borderStyle = .none
        $0.clearButtonMode = .whileEditing
    }
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.congifureSearchBar()
        self.configureSearchBarConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func congifureSearchBar() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hexCode: "D3EAD1").cgColor
        self.addSubview(searchIcon)
        self.addSubview(searchPostTextField)
    }
    
    private func configureSearchBarConstraints() {
        self.searchIcon.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-10)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(25)
        }
        
        self.searchPostTextField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalTo(self.searchIcon.snp.leading).offset(-5)
        }
    }
}
