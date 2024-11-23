//
//  CommunityVC.swift
//  Irumso
//
//  Created by 김은상 on 11/20/24.
//

import UIKit

final class CommunityVC: UIViewController {

    private lazy var communitySearchBar = CommunitySearchBar()
    
    private lazy var communityTableView = UITableView().then {
        $0.estimatedRowHeight = 150
        $0.rowHeight = 150
        $0.delegate = self
        $0.dataSource = self
        $0.register(CommunityCell.self, forCellReuseIdentifier: CommunityCell.reuseIdentifier)
    }
    
    private lazy var communityWriteButton: UIButton = UIButton(type: .custom).then {
        $0.backgroundColor = UIColor(hexCode: "63B85F")
        $0.setImage(UIImage(systemName: "pencil"), for: .normal) // 이미지 설정
        $0.imageView?.tintColor = .white
        $0.layer.cornerRadius = 27.5 // 버튼의 반지름을 크기에 맞게 설정
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.3
        $0.layer.shadowRadius = 10
        $0.layer.shadowOffset = CGSize(width: 0, height: 10)
        $0.imageView?.contentMode = .scaleAspectFit // 이미지 비율 유지
        $0.addTarget(self, action: #selector(communityWriteButtonDidTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureCommunityVCUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.isTabBarHidden = false
    }
    
    @objc private func communityWriteButtonDidTapped() {
        print("Debug: \(#function)")
        let communityWriteVC = CommunityWriteVC()
        communityWriteVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(communityWriteVC, animated: true)
    }


}

extension CommunityVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommunityCell.reuseIdentifier, for: indexPath) as! CommunityCell
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let communityDetailVC = CommunityDetailVC()
        
        communityDetailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(communityDetailVC, animated: true)
        
    }
    
}


extension CommunityVC {
    private func configureCommunityVCUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(communitySearchBar)
        self.view.addSubview(communityTableView)
        self.view.addSubview(communityWriteButton)
        self.communitySearchBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalToSuperview().offset(33)
            $0.trailing.equalToSuperview().offset(-33)
            $0.height.equalTo(42)
        }
        
        self.communityTableView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(self.communitySearchBar.snp.bottom).offset(30)
        }
        
        self.communityWriteButton.snp.makeConstraints {
            $0.width.height.equalTo(55)
            $0.trailing.equalToSuperview().offset(-15)
            $0.bottom.equalToSuperview().offset(-110)
        }
        
    }
    
    
}
