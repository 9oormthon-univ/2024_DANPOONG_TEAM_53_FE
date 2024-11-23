//
//  RecommendDetailVC.swift
//  Irumso
//
//  Created by 김은상 on 11/24/24.
//

import UIKit

class RecommendDetailVC: UIViewController {
    
    private let topCommentLabel: UILabel = UILabel().then {
        $0.text = "원하는 정보를 검색해보세요!"
        $0.font = UIFont.customFont(.goormSans400, size: 15)
        $0.textAlignment = .center
    }
    
    private lazy var recommendSearchBar = CommunitySearchBar()
    
    private lazy var recommendTableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.register(ServiceListCell.self, forCellReuseIdentifier: ServiceListCell.reuseIdentifier)
        $0.backgroundColor = .white
        $0.rowHeight = 150
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureRecommendDetailVCUI()
    }
    

   

}

extension RecommendDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ServiceListCell.reuseIdentifier  , for: indexPath) as! ServiceListCell
        cell.updateUIForRecommendCell()
        return cell
    }
    
    
    
    
}


extension RecommendDetailVC {
    private func configureRecommendDetailVCUI() {
        self.view.backgroundColor = .white
        self.view.addSubviews(views: [self.topCommentLabel, self.recommendSearchBar, self.recommendTableView])
        
        self.topCommentLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(250)
            $0.height.equalTo(30)
        }
        
        self.recommendSearchBar.snp.makeConstraints {
            $0.top.equalTo(self.topCommentLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(33)
            $0.trailing.equalToSuperview().offset(-33)
            $0.height.equalTo(42)
        }
        
        self.recommendTableView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(self.recommendSearchBar.snp.bottom).offset(30)
        }
        
    }
}
