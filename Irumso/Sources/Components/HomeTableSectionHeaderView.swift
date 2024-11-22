//
//  HomeTableSectionHeaderView.swift
//  Irumso
//
//  Created by 김은상 on 11/22/24.
//

import UIKit

final class HomeTableSectionHeaderView: UIView {
    
    let sectionTitleLabel: UILabel = UILabel().then {
        $0.text = "테스트입니다."
        $0.font = UIFont.customFont(.goormSans700, size: 35)
        
    }
    
    private lazy var showDetailButton: UIButton = UIButton().then {
        $0.setTitle("더보기", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.tintColor = .gray
        $0.semanticContentAttribute = .forceRightToLeft // 이미지가 오른쪽에 오도록 강제
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8) // 간격 조정
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureSectionHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSectionHeaderView() {
        self.addSubviews(views: [self.sectionTitleLabel, self.showDetailButton])
        self.backgroundColor = .white
        
        self.showDetailButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-5)
            $0.width.equalTo(100)
            $0.height.equalTo(25)
        }
        
        self.sectionTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(30)
            $0.trailing.equalTo(self.showDetailButton.snp.leading).offset(-10)
        }
        
    }
    
    func updateSectionHeaderViewConstraints() {
        self.showDetailButton.removeFromSuperview()
        
        self.sectionTitleLabel.snp.remakeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(30)
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
    
}


