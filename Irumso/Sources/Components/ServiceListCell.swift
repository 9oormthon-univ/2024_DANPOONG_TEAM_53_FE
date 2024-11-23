//
//  ServiceListCell.swift
//  Irumso
//
//  Created by 김은상 on 11/23/24.
//

import UIKit

class ServiceListCell: UITableViewCell {
    static let reuseIdentifier: String = "ServiceListCell"
    
    private lazy var baseView: UIView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 8
        
    }
    
    lazy var serviceNameLabel: UILabel = UILabel().then {
        $0.font = UIFont.customFont(.goormSans700, size: 16)
        $0.textColor = .darkGray
        $0.textAlignment = .left
        $0.text = "유아학비 (누리과정) 지원"
        
    }

    private let heartImageView = UIImageView().then {
        $0.image = UIImage(systemName: "heart")
        $0.tintColor = .systemRed
        $0.contentMode = .scaleAspectFit
    }
    
    private let heartCount = UILabel().then {
        $0.text = "158"
        $0.textColor = .darkGray
        $0.textAlignment = .left
    }
    
    private let eyeImageView = UIImageView().then {
        $0.image = UIImage(systemName: "eye")
        $0.tintColor = .darkGray
        $0.contentMode = .scaleAspectFit
    }
    
    private let viewCount = UILabel().then {
        $0.text = "8"
        $0.textColor = .darkGray
        $0.textAlignment = .left
    }
    
    private let serviceTypeLabel: UILabel = UILabel().then {
        $0.text = "보육/교육"
        $0.font = UIFont.customFont(.goormSans700, size: 13)
        $0.textAlignment = .left
    }
    
    private let serviceDetailLabel: UILabel = UILabel().then {
        $0.text = "유치원에 다니는 만 3-5세 아동에게 유야학비, 방과후과정비 등 지원"
        $0.numberOfLines = 1
        $0.textAlignment = .left
        $0.textColor = .darkGray
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureServiceListCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension ServiceListCell {
    private func configureServiceListCell() {
        self.backgroundColor = .white
        self.addSubview(self.baseView)
        
        
        
        self.baseView.addSubviews(views: [self.serviceNameLabel, self.serviceTypeLabel, self.serviceDetailLabel, self.heartCount, self.heartImageView, self.eyeImageView, self.viewCount])
        
        self.baseView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-15)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        self.viewCount.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(10)
            $0.height.equalTo(30)
            $0.width.equalTo(30)
        }
        
        self.eyeImageView.snp.makeConstraints {
            $0.trailing.equalTo(self.viewCount.snp.leading).offset(-5)
            $0.centerY.equalTo(self.viewCount.snp.centerY)
            $0.height.width.equalTo(20)
            
        }
        
        self.heartCount.snp.makeConstraints {
            $0.trailing.equalTo(self.eyeImageView.snp.leading).offset(-5)
            $0.centerY.equalTo(self.eyeImageView.snp.centerY)
            $0.width.height.equalTo(30)
        }
        
        self.heartImageView.snp.makeConstraints {
            $0.trailing.equalTo(self.heartCount.snp.leading).offset(-5)
            $0.centerY.equalTo(self.heartCount.snp.centerY)
            $0.width.height.equalTo(20)
    
        }
        
        
        self.serviceNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalTo(self.heartImageView.snp.leading).offset(-10)
            $0.height.equalTo(35)
            $0.centerY.equalTo(self.heartImageView.snp.centerY)
        }
        
        
        self.serviceTypeLabel.snp.makeConstraints {
            $0.leading.equalTo(self.serviceNameLabel.snp.leading)
            $0.top.equalTo(self.serviceNameLabel.snp.bottom).offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        
        }
        
        self.serviceDetailLabel.snp.makeConstraints {
            $0.leading.equalTo(self.serviceNameLabel.snp.leading)
            $0.top.equalTo(self.serviceTypeLabel.snp.bottom).offset(10)
            $0.height.equalTo(30)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        
    }
    func updateUIForRecommendCell() {
        self.eyeImageView.isHidden = true
        self.viewCount.isHidden = true
        self.baseView.backgroundColor = UIColor(hexCode: "D0E4CE")
        self.heartCount.isHidden = true
        self.heartImageView.snp.remakeConstraints {
            $0.trailing.equalToSuperview().offset(-10)
            $0.top.equalToSuperview().offset(10)
            $0.height.width.equalTo(15)
        }
    }
}
