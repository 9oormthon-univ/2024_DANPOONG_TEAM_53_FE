//
//  MyPageVC.swift
//  Irumso
//
//  Created by 김은상 on 11/20/24.
//

import UIKit

final class MyPageVC: UIViewController {
    
    private let userImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "user-default-image")?.withRenderingMode(.alwaysOriginal)
        $0.contentMode = .scaleAspectFit
    }
    
    private let userNameLabel: UILabel = UILabel().then {
        $0.text = "김나박이루미"
        $0.font = UIFont.customFont(.goormSans400, size: 13)
        $0.textColor = .darkGray
        $0.textAlignment = .center
    }
    
    private lazy var menuButtonsView: UIStackView = UIStackView(arrangedSubviews: [self.editMyInfomationButton, self.askButton, self.reviewButton]).then {
        $0.backgroundColor = UIColor(hexCode: "63B85F")
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    private lazy var editMyInfomationButton: MyPageButton = MyPageButton(image: UIImage(systemName: "doc.text.fill"),
                                                                         title: "정보수정")
    
    private lazy var askButton: MyPageButton = MyPageButton(image: UIImage(systemName: "questionmark.circle.fill"),
                                                                         title: "문의하기")
    
    private lazy var reviewButton: MyPageButton = MyPageButton(image: UIImage(named: "happy"), title: "리뷰남기기")
    
    private let baseView1: UIView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 18
    }
    
    private let baseView2: UIView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 18
    }
    
    private let serviceLabel: UILabel = UILabel().then {
        $0.font = UIFont.customFont(.goormSans400, size: 16)
        $0.text = "지원금"
        $0.textColor = .systemGray2
    }
    
    private let label1: UILabel = UILabel().then {
        $0.text = "최근 본 지원금"
        $0.textColor = .black
        $0.font = UIFont.customFont(.goormSans700, size: 18)
        $0.textAlignment = .left
    }

    private let label2: UILabel = UILabel().then {
        $0.text = "좋아요 한 지원금"
        $0.textColor = .black
        $0.font = UIFont.customFont(.goormSans700, size: 18)
        $0.textAlignment = .left
    }
    
    private let siteLabel: UILabel = UILabel().then {
        $0.font = UIFont.customFont(.goormSans400, size: 16)
        $0.text = "지원금"
        $0.textColor = .systemGray2
    }
    
    private let separator1: UIView = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    private let separator2: UIView = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    private let label3: UILabel = UILabel().then {
        $0.text = "정부24 바로가기"
        $0.textColor = .black
        $0.font = UIFont.customFont(.goormSans700, size: 18)
        $0.textAlignment = .left
    }
    
    private let label4: UILabel = UILabel().then {
        $0.text = "보조금24 바로가기"
        $0.textColor = .black
        $0.font = UIFont.customFont(.goormSans700, size: 18)
        $0.textAlignment = .left
    }
    
    private lazy var chevronButton1: UIButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.tintColor = .darkGray
        $0.tag = 1
    }
    
    private lazy var chevronButton2: UIButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.tintColor = .darkGray
        $0.tag = 2
    }
    
    private lazy var chevronButton3: UIButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.tintColor = .darkGray
        $0.tag = 3
    }
    
    private lazy var chevronButton4: UIButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.tintColor = .darkGray
        $0.tag = 4
    }
    
    
    private lazy var logoutButton: UIButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(.darkGray, for: .normal)
        $0.backgroundColor = .clear
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureMyPageVC()

    }
    
   

}



extension MyPageVC {
    private func configureMyPageVC() {
        self.view.backgroundColor = UIColor(hexCode: "F4F3F7")
        
        self.view.addSubviews(views: [
            self.userImageView, self.userNameLabel, self.menuButtonsView, self.baseView1, self.baseView2, self.logoutButton
            
        ])
        
        self.baseView1.addSubviews(views: [serviceLabel, separator1, label1, label2, chevronButton1, chevronButton2])
        
        self.baseView2.addSubviews(views: [siteLabel, separator2, label3, label4, chevronButton3, chevronButton4])
        
        

        
        self.userImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(30)
            $0.width.height.equalTo(150)
        }
        
        self.userNameLabel.snp.makeConstraints {
            $0.centerX.equalTo(self.userImageView.snp.centerX)
            $0.top.equalTo(self.userImageView.snp.bottom).offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        }
        
        self.menuButtonsView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
            $0.top.equalTo(self.userNameLabel.snp.bottom).offset(10)
            $0.height.equalTo(68)
        }
        
        self.baseView1.snp.makeConstraints {
            $0.top.equalTo(self.menuButtonsView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
            $0.height.equalTo(128)
        }
     
        self.baseView2.snp.makeConstraints {
            $0.top.equalTo(self.baseView1.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
            $0.height.equalTo(128)
        }
        
        self.serviceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.top.equalToSuperview().offset(20)
            $0.height.equalTo(20)
        }
        
        self.label1.snp.makeConstraints {
            $0.leading.equalTo(self.serviceLabel)
            $0.top.equalTo(self.serviceLabel.snp.bottom).offset(10)
        }
        
        self.chevronButton1.snp.makeConstraints {
            $0.centerY.equalTo(self.label1.snp.centerY)
            $0.trailing.equalToSuperview().offset(-15)
            $0.width.height.equalTo(20)
        }
        
        self.separator1.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(self.label1.snp.bottom).offset(10)
        }
        
       
        
        self.label2.snp.makeConstraints {
            $0.leading.equalTo(self.label1)
            $0.top.equalTo(self.label1.snp.bottom).offset(25)
        }
        
        self.chevronButton2.snp.makeConstraints {
            $0.centerY.equalTo(self.label2.snp.centerY)
            $0.trailing.equalToSuperview().offset(-15)
            $0.width.height.equalTo(20)
        }
        
        self.siteLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.top.equalToSuperview().offset(20)
            $0.height.equalTo(20)
        }
        
        self.label3.snp.makeConstraints {
            $0.leading.equalTo(self.siteLabel)
            $0.top.equalTo(self.siteLabel.snp.bottom).offset(10)
        }
        
        self.chevronButton3.snp.makeConstraints {
            $0.centerY.equalTo(self.label3.snp.centerY)
            $0.trailing.equalToSuperview().offset(-15)
            $0.width.height.equalTo(20)
        }
        
        self.separator2.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(self.label3.snp.bottom).offset(10)
        }
        
       
        
        self.label4.snp.makeConstraints {
            $0.leading.equalTo(self.label3)
            $0.top.equalTo(self.label3.snp.bottom).offset(25)
        }
        
        self.chevronButton4.snp.makeConstraints {
            $0.centerY.equalTo(self.label4.snp.centerY)
            $0.trailing.equalToSuperview().offset(-15)
            $0.width.height.equalTo(20)
        }
        self.logoutButton.snp.makeConstraints {
            $0.trailing.equalTo(self.baseView2.snp.trailing)
            $0.top.equalTo(self.baseView2.snp.bottom).offset(30)
        }
    }
}
import SwiftUI

extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
    
    func toPreview() -> some View {
        Preview(viewController: self)
    }
}


import SwiftUI

struct VCPreView: PreviewProvider {
    static var previews: some View {
        MyPageVC().toPreview()
    }
}
