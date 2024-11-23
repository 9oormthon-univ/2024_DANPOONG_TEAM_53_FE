//
//  ServiceListByViewVC.swift
//  Irumso
//
//  Created by 김은상 on 11/23/24.
//

import UIKit



final class ServiceListVC: UIViewController {
    
    private lazy var serviceListTableViewByView: UITableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.rowHeight = 150
        $0.register(ServiceListCell.self, forCellReuseIdentifier: ServiceListCell.reuseIdentifier)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureServiceListByViewVCUI()

    }

}


extension ServiceListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let serviceDetailVC = ServiceDetailVC()
        serviceDetailVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(serviceDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ServiceListCell.reuseIdentifier, for: indexPath) as! ServiceListCell
        
        return cell
    }
}

extension ServiceListVC {
    private func configureServiceListByViewVCUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.serviceListTableViewByView)
        
        self.serviceListTableViewByView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
}

