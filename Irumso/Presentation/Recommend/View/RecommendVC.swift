//
//  RecommendVC.swift
//  Irumso
//
//  Created by 김은상 on 11/20/24.
//

import UIKit

class RecommendVC: UIViewController {
    
    private let commentLabel: UILabel = UILabel().then {
        $0.text = "나와 딱 맞는 지원금을\n추천받아보세요!"
        $0.font = UIFont.customFont(.goormSans700, size: 30)
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.textColor = .black
    }
    
    private lazy var recommendButton: UIButton = UIButton().then {
        $0.setTitle("추천받기", for: .normal)
        $0.backgroundColor = UIColor(hexCode: "63B85F")
        $0.layer.cornerRadius = 14
        $0.addTarget(self, action: #selector(recommendButtonDidTapped), for: .touchUpInside)
    }
    
    private let rumiImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "rumi")
        $0.contentMode = .scaleAspectFit
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureRecommendVC()

    }

    @objc func recommendButtonDidTapped() {
        let recommendDetailVC = RecommendDetailVC()
        recommendDetailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(recommendDetailVC, animated: true)
    }
    
}


extension RecommendVC {
    private func configureRecommendVC() {
        self.view.backgroundColor = .white
        self.view.addSubviews(views: [self.rumiImageView, self.commentLabel, self.recommendButton])
        
        self.rumiImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(250)
            $0.width.equalTo(113.33)
            $0.height.equalTo(151.69)
        }
        
        self.commentLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(100)
            $0.width.equalTo(200)
        }
        
        self.recommendButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.commentLabel.snp.bottom).offset(10)
            $0.height.equalTo(59)
            $0.width.equalTo(170)
        }
    }
}
