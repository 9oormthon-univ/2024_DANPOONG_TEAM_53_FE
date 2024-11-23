//
//  HomeVC.swift
//  Irumso
//
//  Created by 김은상 on 11/20/24.
//

import UIKit

final class HomeVC: UIViewController {
    //MARK: - Properties
    private lazy var homeTableView: UITableView = UITableView(frame: .zero, style: .plain).then {
        $0.delegate = self
        $0.dataSource = self
        $0.separatorStyle = .none
        $0.register(HomeTVCell.self, forCellReuseIdentifier: HomeTVCell.reuseIdentifier)
    }
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureHomeVCUI()
    }

    
    
    
    //MARK: - Actions
    @objc func showDetailButtonDidTapped(_ sender: UIButton) {
        print("Debug: \(#function)")
        switch sender.tag {
        case 1:
            print("Debug : ByLike")
            let serviceListVC = ServiceListVC()
            serviceListVC.title = "많이 본 지원금 정보"
            serviceListVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(serviceListVC, animated: true)
            
        case 2:
            print("Debug : ByView")
            let serviceListVC = ServiceListVC()
            serviceListVC.title = "관심을 많이 가진 지원금 정보"
            serviceListVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(serviceListVC, animated: true)
        default:
            break
        }
        
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let serviceDetailVC = ServiceDetailVC()
        serviceDetailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(serviceDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 130
        case 1, 2:
            return 35
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1,2 :
            return 5
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTVCell.reuseIdentifier, for: indexPath) as! HomeTVCell
        
        
        switch indexPath.section {
        case 0:
            cell.configureHomeTVCellForFirstSection()
        
            return cell
        case 1:
            cell.configureHomeTVCell()
            cell.serviceNameLabel.text = "테스트입니다." + String(indexPath.row + 1)
            cell.countLabel.text = String(indexPath.row + 1) + "k"
            cell.indexLabel.text = String(indexPath.row + 1)
            
            return cell
        case 2:
            cell.configureHomeTVCell()
            cell.serviceNameLabel.text = "테스트입니다." + String(indexPath.row + 1)
            cell.countLabel.text = String(indexPath.row + 1) + "k"
            cell.indexLabel.text = String(indexPath.row + 1)
            cell.cellImageView.image = UIImage(systemName: "heart")
            return cell
        default:
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let homeTableViewSectionHeader = HomeTableSectionHeaderView()
        switch section {
        case 0:
            homeTableViewSectionHeader.updateSectionHeaderViewConstraints()
            homeTableViewSectionHeader.sectionTitleLabel.text = "다양한 종류의 지원금 정보를 찾아보세요!"
            return homeTableViewSectionHeader
        case 1:
            homeTableViewSectionHeader.showDetailButton.tag = 1
            homeTableViewSectionHeader.showDetailButton.addTarget(self, action: #selector(showDetailButtonDidTapped(_:)), for: .touchUpInside)
            homeTableViewSectionHeader.sectionTitleLabel.text = "현재 사람들이 많이 본 지원금 정보"
            return homeTableViewSectionHeader

        case 2:
            homeTableViewSectionHeader.showDetailButton.tag = 2
            homeTableViewSectionHeader.showDetailButton.addTarget(self, action: #selector(showDetailButtonDidTapped(_:)), for: .touchUpInside)
            homeTableViewSectionHeader.sectionTitleLabel.text = "현재 사람들이 관심을 준 지원금 정보"
            return homeTableViewSectionHeader

        default:
            homeTableViewSectionHeader.sectionTitleLabel.text = ""
            return homeTableViewSectionHeader

        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    
}


extension HomeVC {
    private func configureHomeVCUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.homeTableView)
        self.homeTableView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalToSuperview().offset(-10)
        }
        
    }
}
