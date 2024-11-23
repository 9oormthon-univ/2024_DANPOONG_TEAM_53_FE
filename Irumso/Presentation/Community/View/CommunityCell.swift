//
//  CommunityCell.swift
//  Irumso
//
//  Created by 김은상 on 11/21/24.
//

import UIKit

class CommunityCell: UITableViewCell {
    static let reuseIdentifier: String = "CommunityCell"
    
    private let communityThumbnailImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(systemName: "person.fill")
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 5
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private let communityTitleLabel: UILabel = UILabel().then {
        $0.text = "타이틀 테스트입니다."
        $0.font = UIFont.customFont(.goormSans700, size: 16)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    private let dateLabel: UILabel = UILabel().then {
        $0.text = "2024-11-21"
        $0.font = UIFont.customFont(.goormSans500, size: 14)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    private let userNameLabel: UILabel = UILabel().then {
        $0.text = "2024-11-21"
        $0.font = UIFont.customFont(.goormSans500, size: 14)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    private let heartImageView = UIImageView().then {
        $0.image = UIImage(systemName: "heart")
        $0.tintColor = .darkGray
        $0.contentMode = .scaleAspectFit
    }
    
    private let heartCount = UILabel().then {
        $0.text = "158"
        $0.textColor = .darkGray
        $0.textAlignment = .left
    }
    
    private let commentImageView = UIImageView().then {
        $0.image = UIImage(systemName: "bubble.right")
        $0.tintColor = .darkGray
        $0.contentMode = .scaleAspectFit
    }
    
    private let commentCount = UILabel().then {
        $0.text = "8"
        $0.textColor = .darkGray
        $0.textAlignment = .left
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureCommunityCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CommunityCell {
    private func configureCommunityCellUI() {
        self.addSubview(self.contentView)
        [self.communityThumbnailImageView, self.communityTitleLabel, self.dateLabel, self.heartImageView, self.heartCount, self.commentImageView, self.commentCount, self.userNameLabel].forEach { self.contentView.addSubview($0) }
        
        self.contentView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        self.communityThumbnailImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(24)
            $0.width.height.equalTo(80)
        }
        
        self.communityTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.communityThumbnailImageView.snp.top).offset(5)
            $0.leading.equalTo(self.communityThumbnailImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-100)
        }
        
        self.userNameLabel.snp.makeConstraints {
            $0.leading.equalTo(self.communityThumbnailImageView.snp.trailing).offset(10)
            $0.top.equalTo(self.communityTitleLabel.snp.bottom).offset(5)
        }
        
        self.dateLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.communityThumbnailImageView.snp.bottom).offset(-5)
            $0.leading.equalTo(self.communityThumbnailImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-100)
        }
        
        self.heartCount.snp.makeConstraints {
            $0.centerY.equalTo(self.communityTitleLabel.snp.centerY)
            $0.trailing.equalToSuperview().offset(-10)
            $0.width.equalTo(40)
            $0.height.equalTo(20)
        }
        
        self.heartImageView.snp.makeConstraints {
            $0.centerY.equalTo(self.communityTitleLabel.snp.centerY)
            $0.trailing.equalTo(self.heartCount.snp.leading).offset(-5)
            $0.width.height.equalTo(20)
        }
        
        self.commentCount.snp.makeConstraints {
            $0.top.equalTo(self.heartImageView.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.width.equalTo(40)
            $0.height.equalTo(20)
        }
        
        self.commentImageView.snp.makeConstraints {
            $0.centerY.equalTo(self.commentCount.snp.centerY)
            $0.trailing.equalTo(self.commentCount.snp.leading).offset(-5)
            $0.width.height.equalTo(20)
        }
        
    }
}
