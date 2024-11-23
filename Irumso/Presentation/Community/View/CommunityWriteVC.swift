//
//  CommunityWriteVC.swift
//  Irumso
//
//  Created by 김은상 on 11/23/24.
//

import UIKit

final class CommunityWriteVC: UIViewController {
    //MARK: - Properties
    private lazy var titleInputTextField: UITextField = UITextField().then {
        $0.backgroundColor = .white
        $0.placeholder = "제목을 적어주세요."
        $0.layer.addBorder([.bottom], color: .black, width: 1)
        $0.frame.size.width = 200
        $0.frame.size.height = 30
    }
    
    private let serviceTypeSelectionLabel: UILabel = UILabel().then {
        $0.text = "지원금 분야"
        $0.font = UIFont.customFont(.goormSans500, size: 20)
        $0.textColor = .black
    }
    
    private lazy var serviceTypeSelectionView: UIView = UIView().then {
        $0.backgroundColor = UIColor(hexCode: "D3EAD1")
        $0.layer.cornerRadius = 4
        
    }
    
    private let downTriangleImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(systemName: "arrowtriangle.down.fill")
        $0.tintColor = UIColor(hexCode: "63B85F")
        $0.contentMode = .scaleAspectFit
    }
    
    private let addPictureLabel: UILabel = UILabel().then {
        $0.text = "사진추가"
        $0.font = UIFont.customFont(.goormSans500, size: 20)
        $0.textColor = .black
    }
    
    private lazy var addPictureButton: UIButton = UIButton().then {
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("사진 첨부하기(최대 10장)", for: .normal)
        $0.setImage(UIImage(named: "album"), for: .normal)
        $0.backgroundColor = UIColor(hexCode: "D3EAD1")
        $0.layer.cornerRadius = 4
    }
    
    private let mainTextLabel: UILabel = UILabel().then {
        $0.text = "본문"
        $0.font = UIFont.customFont(.goormSans500, size: 20)
        $0.textColor = .black
    }
    
    private lazy var mainTextView: UITextView = UITextView().then {
        $0.isScrollEnabled = false
        $0.backgroundColor = UIColor(hexCode: "D3EAD1")
        $0.layer.cornerRadius = 4
    }
    
    private lazy var writeButton: UIButton = UIButton().then {
        $0.backgroundColor = UIColor(hexCode: "63B85F")
        $0.setTitle("올리기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCommunityWritingVC()
        self.view.backgroundColor = .white
        
        self.view.addSubviews(views: [self.titleInputTextField,
                                      self.serviceTypeSelectionLabel,
                                      self.serviceTypeSelectionView,
                                      self.addPictureLabel,
                                      self.addPictureButton,
                                      self.mainTextView,
                                      self.mainTextLabel,
                                      self.writeButton])
        
        self.serviceTypeSelectionView.addSubview(self.downTriangleImageView)
        
        self.titleInputTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
            $0.height.equalTo(30)
        }
        
        self.serviceTypeSelectionLabel.snp.makeConstraints {
            $0.leading.equalTo(self.titleInputTextField.snp.leading)
            $0.top.equalTo(self.titleInputTextField.snp.bottom).offset(20)
            $0.trailing.equalTo(self.titleInputTextField)
            $0.height.equalTo(20)
        }
        
        self.serviceTypeSelectionView.snp.makeConstraints {
            $0.top.equalTo(self.serviceTypeSelectionLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.titleInputTextField)
            $0.height.equalTo(30)
        }
        
        self.downTriangleImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-10)
        }
         
        self.addPictureLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.serviceTypeSelectionLabel)
            $0.top.equalTo(self.serviceTypeSelectionView.snp.bottom).offset(20)
            $0.height.equalTo(20)
        }
        
        self.addPictureButton.snp.makeConstraints {
            $0.top.equalTo(self.addPictureLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.titleInputTextField)
            $0.height.equalTo(30)
        }
        
        self.mainTextLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.addPictureLabel)
            $0.top.equalTo(self.addPictureButton.snp.bottom).offset(10)
            $0.height.equalTo(30)
        }
        
        self.mainTextView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.addPictureButton)
            $0.top.equalTo(self.mainTextLabel.snp.bottom).offset(10)
            $0.height.equalTo(300)
        }
        
        self.writeButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.mainTextView)
            $0.top.equalTo(self.mainTextView.snp.bottom).offset(20)
            $0.height.equalTo(50)
        }
      
    }
    

    

}


extension CommunityWriteVC {
    private func configureCommunityWritingVC() {
        self.view.backgroundColor = .white
    }
}
