//
//  ServiceListByViewVC.swift
//  Irumso
//
//  Created by 김은상 on 11/23/24.
//

import UIKit

final class ServiceListByViewVC: UIViewController {
    
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

extension ServiceListByViewVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ServiceListCell.reuseIdentifier, for: indexPath) as! ServiceListCell
        
        return cell
    }
    
    
    
}


extension ServiceListByViewVC {
    private func configureServiceListByViewVCUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.serviceListTableViewByView)
        
        self.serviceListTableViewByView.snp.makeConstraints {
            $0.edges.equalToSuperview()
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
        ServiceListByViewVC().toPreview()
    }
}
