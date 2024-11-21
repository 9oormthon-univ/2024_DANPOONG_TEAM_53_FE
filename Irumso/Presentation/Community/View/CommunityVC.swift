//
//  CommunityVC.swift
//  Irumso
//
//  Created by 김은상 on 11/20/24.
//

import UIKit

final class CommunityVC: UIViewController {

    private lazy var communitySearchBar = CommunitySearchBar()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.view.addSubview(communitySearchBar)
        self.configureCommunityVCUI()
    }
    


}


extension CommunityVC {
    private func configureCommunityVCUI() {
        self.communitySearchBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalToSuperview().offset(33)
            $0.trailing.equalToSuperview().offset(-33)
            $0.height.equalTo(42)
        }
    }
    
    
}
