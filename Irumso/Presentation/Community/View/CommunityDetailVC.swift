//
//  CommunityDetailVC.swift
//  Irumso
//
//  Created by 김은상 on 11/21/24.
//

import UIKit
import SnapKit
import Then

final class CommunityDetailVC: UIViewController {
    //MARK: - Properties
    private let communityDetailScrollView = UIScrollView().then {
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = false
    }
    
    private let communityContentView = UIView()
    
    private let serviceKindLabel = UILabel().then {
        $0.text = "#의료"
        $0.font = UIFont.customFont(.goormSans400, size: 10)
    }
    
    private let dateLabel = UILabel().then {
        $0.text = "2024/11/21"
        $0.font = UIFont.customFont(.goormSans400, size: 10)
    }
    
    private let communityTitleLabel = UILabel().then {
        $0.text = "코로나19 긴급 지원금 관련 질문"
        $0.font = UIFont.customFont(.goormSans700, size: 30)
        $0.textAlignment = .left
    }
    
    private let detailTextView = UITextView().then {
        $0.text = "코로나 19 긴급 지원금 관련해서 질문 드립니다. \n아래 이미지 첨부한데에서 어디로 들어가야 신청 가능한가요?"
        $0.font = UIFont.customFont(.goormSans400, size: 20)
    }
    
    private let communityImageView1 = UIImageView().then {
        $0.image = nil
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 8
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    private let communityImageView2 = UIImageView().then {
        $0.image = nil
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    private let communityImageView3 = UIImageView().then {
        $0.image = nil
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
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
    
    private lazy var commentTableView = UITableView().then {
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 80
        $0.delegate = self
        $0.dataSource = self
        $0.isScrollEnabled = false
        $0.register(CommentCell.self, forCellReuseIdentifier: CommentCell.reuseIdentifier)
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCommunityDetailVCUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateTableViewHeight()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateTableViewHeight()
    }
    
    
    //MARK: - Helpers
    
    
    //MARK: - Actions
    
}

extension CommunityDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.reuseIdentifier, for: indexPath) as! CommentCell
        
        cell.selectionStyle = .none
        
        
        return cell
    }
    
    
    
    
    
    
}


extension CommunityDetailVC {
    private func configureCommunityDetailVCUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.communityDetailScrollView)
        
        self.communityDetailScrollView.addSubview(self.communityContentView)
        
        self.communityDetailScrollView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
            $0.width.equalToSuperview()
        }
        
        self.communityContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        
        self.communityContentView.addSubviews(views: [self.serviceKindLabel, self.dateLabel,
                                                      self.communityTitleLabel, self.detailTextView,
                                                      self.communityImageView1, self.communityImageView2,
                                                      self.communityImageView3, self.heartImageView,
                                                      self.heartCount, self.commentCount,
                                                      self.commentImageView, self.commentTableView])
        
        
        self.communityDetailScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        self.communityContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(self.communityDetailScrollView.snp.width)
            $0.bottom.equalTo(self.commentTableView.snp.bottom).offset(30)
            
        }
        
        self.serviceKindLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.top.equalToSuperview().offset(50)
            $0.height.equalTo(30)
            $0.width.equalTo(200)
        }
        
        self.dateLabel.snp.makeConstraints {
            $0.top.equalTo(self.serviceKindLabel.snp.top)
            $0.trailing.equalTo(self.communityContentView.snp.trailing).offset(-10)
        }
        
        self.communityTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.serviceKindLabel.snp.bottom).offset(5)
            $0.leading.equalTo(self.serviceKindLabel.snp.leading)
        }
        
        self.detailTextView.snp.makeConstraints {
            $0.leading.equalTo(self.serviceKindLabel.snp.leading)
            $0.trailing.equalTo(self.dateLabel.snp.trailing)
            $0.top.equalTo(self.communityTitleLabel.snp.bottom).offset(15)
            $0.height.equalTo(100)
        }
        
        
        self.communityImageView1.snp.makeConstraints {
            $0.leading.equalTo(self.serviceKindLabel.snp.leading)
            $0.top.equalTo(self.detailTextView.snp.bottom).offset(20)
            $0.width.height.equalTo(100)
        }
        
        self.heartImageView.snp.makeConstraints {
            $0.leading.equalTo(self.serviceKindLabel.snp.leading)
            $0.top.equalTo(self.communityImageView1.snp.bottom).offset(10)
            $0.width.height.equalTo(20)
        }
        
        self.heartCount.snp.makeConstraints {
            $0.centerY.equalTo(self.heartImageView.snp.centerY)
            $0.leading.equalTo(self.heartImageView.snp.trailing).offset(5)
            $0.width.equalTo(50)
        }
        
        self.commentImageView.snp.makeConstraints {
            $0.centerY.equalTo(self.heartImageView.snp.centerY)
            $0.leading.equalTo(self.heartCount.snp.trailing)
            $0.width.height.equalTo(20)
        }
        
        self.commentCount.snp.makeConstraints {
            $0.centerY.equalTo(self.commentImageView.snp.centerY)
            $0.leading.equalTo(self.commentImageView.snp.trailing).offset(5)
            $0.width.equalTo(100)
            
        }
        
        self.commentTableView.snp.makeConstraints {
            $0.leading.equalTo(self.communityContentView.snp.leading).offset(15)
            $0.trailing.equalTo(self.communityContentView.snp.trailing).offset(-15)
            $0.top.equalTo(self.commentCount.snp.bottom).offset(30)
            $0.height.equalTo(0)
        }
        
        
    }
    private func updateTableViewHeight() {
        self.commentTableView.reloadData()

        DispatchQueue.main.async {
            let tableViewHeight = self.commentTableView.contentSize.height
            
            self.commentTableView.snp.updateConstraints {
                $0.height.equalTo(tableViewHeight)
            }
            
            self.communityContentView.snp.updateConstraints {
                $0.bottom.equalTo(self.commentTableView.snp.bottom).offset(30)
            }
            
            self.view.layoutIfNeeded()

        }
    }
    
}


