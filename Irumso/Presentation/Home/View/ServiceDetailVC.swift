//
//  ServiceDetailVC.swift
//  Irumso
//
//  Created by 김은상 on 11/23/24.
//

import UIKit

final class ServiceDetailVC: UIViewController {
    
    private let serviceDetailScrollView = UIScrollView().then {
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = false
    }
    
    private let serviceContentView = UIView()
    
    private let serviceDetailTopView = ServiceDetailTopView()
    
    private let targetForServiceButton: UIButton = UIButton().then {
        $0.setTitle("지원대상", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    private let targetForServiceBottomView = UIView().then {
        $0.backgroundColor = UIColor(hexCode: "EBEBED")
    }
    
    private lazy var selectionStandardButton: UIButton = UIButton().then {
        $0.setTitle("선정기준", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    private let selectionStandardBottomView = UIView().then {
        $0.backgroundColor = UIColor(hexCode: "EBEBED")
    }
    
    private let seviceContentButton: UIButton = UIButton().then {
        $0.setTitle("지원내용", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    private let serviceContentBottomView = UIView().then {
        $0.backgroundColor = UIColor(hexCode: "EBEBED")
    }
    
    private lazy var buttonStackView: UIStackView = UIStackView(arrangedSubviews: [targetForServiceButton, selectionStandardButton, seviceContentButton]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    private lazy var serviceDetailTextView: UITextView = UITextView().then {
        $0.isEditable = false
        $0.isScrollEnabled = false
        $0.text = "지원대상 :\n국공립 및 ㄴㅇ라눙라눙라누아루나우란우라눙랑란우란우ㅏ룬아루ㅏㄴㅇ루ㅏㄴ우란우랑누란아루"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureServiceDetailVC()
      
    }
    
    @objc func imageButtonTapped() {
        //북마크
        
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        switch sender.currentTitle {
        case "지원대상":
            self.targetForServiceBottomView.backgroundColor = .black
            self.selectionStandardBottomView.backgroundColor = UIColor(hexCode: "EBEBED")
            self.serviceContentBottomView.backgroundColor = UIColor(hexCode: "EBEBED")
            self.serviceDetailTextView.text = "지원대상"
        case "선정기준":
            self.targetForServiceBottomView.backgroundColor = UIColor(hexCode: "EBEBED")
            self.selectionStandardBottomView.backgroundColor = .black
            self.serviceContentBottomView.backgroundColor = UIColor(hexCode: "EBEBED")
            self.serviceDetailTextView.text = "선정기준~~!~!~"
        case "지원내용":
            self.targetForServiceBottomView.backgroundColor = UIColor(hexCode: "EBEBED")
            self.selectionStandardBottomView.backgroundColor = UIColor(hexCode: "EBEBED")
            self.serviceContentBottomView.backgroundColor = .black
            self.serviceDetailTextView.text = "지원내용 블라블바르아른아른아르"
        default:
            break
            
        }
    }
}

extension ServiceDetailVC {
    private func configureServiceDetailVC() {
        let imageButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(imageButtonTapped))
        
        // 네비게이션 바에 추가
        navigationItem.rightBarButtonItem = imageButton
        
        self.view.backgroundColor = .white
        self.title = "지원금 상세 정보"
        self.view.addSubview(self.serviceDetailScrollView)
        
        self.serviceDetailScrollView.addSubview(self.serviceContentView)
        

        self.serviceDetailScrollView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
            $0.width.equalToSuperview()
        }
        
        self.serviceContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.serviceContentView.addSubviews(views: [
            self.serviceDetailTopView,
            self.buttonStackView,
            self.serviceContentBottomView,
            self.selectionStandardBottomView,
            self.targetForServiceBottomView,
            self.serviceDetailTextView])
        
        self.serviceDetailScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        self.serviceContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(self.serviceDetailScrollView.snp.width)
            $0.bottom.equalTo(self.serviceDetailTextView.snp.bottom).offset(150)
            
        }
        
        self.serviceDetailTopView.snp.makeConstraints {
            $0.leading.equalTo(self.serviceContentView.snp.leading)
            $0.trailing.equalTo(self.serviceContentView.snp.trailing)
            $0.top.equalTo(self.serviceContentView.snp.top)
            $0.height.equalTo(250)
        }
        
        self.buttonStackView.snp.makeConstraints {
            $0.top.equalTo(self.serviceDetailTopView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        self.targetForServiceBottomView.snp.makeConstraints {
            $0.top.equalTo(self.buttonStackView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(2)
            $0.width.equalTo(self.view.frame.width/3)
        }
        
        self.selectionStandardBottomView.snp.makeConstraints {
            $0.top.equalTo(self.buttonStackView.snp.bottom)
            $0.leading.equalTo(self.targetForServiceButton.snp.trailing)
            $0.height.equalTo(2)
            $0.width.equalTo(self.view.frame.width/3)
        }
        
        self.serviceContentBottomView.snp.makeConstraints {
            $0.top.equalTo(self.buttonStackView.snp.bottom)
            $0.leading.equalTo(self.selectionStandardBottomView.snp.trailing)
            $0.height.equalTo(2)
            $0.width.equalTo(self.view.frame.width/3)
        }
        
        self.serviceDetailTextView.snp.makeConstraints {
            $0.top.equalTo(self.buttonStackView.snp.bottom).offset(2)
            $0.leading.equalTo(self.serviceContentView.snp.leading).offset(20)
            $0.trailing.equalTo(self.serviceContentView.snp.trailing).offset(-20)
            $0.height.equalTo(500)
        }
        
    }
}


