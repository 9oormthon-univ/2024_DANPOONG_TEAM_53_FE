//
//  HomeTVCell.swift
//  Irumso
//
//  Created by 김은상 on 11/22/24.
//

import UIKit

class HomeTVCell: UITableViewCell {
    
    static let reuseIdentifier: String = "HomeTVCell"
    
    lazy var indexLabel: UILabel = UILabel().then {
        $0.textColor = UIColor.darkGray
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.textAlignment = .center
    }
    
    lazy var serviceNameLabel: UILabel = UILabel().then {
        $0.textColor = UIColor.darkGray
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textAlignment = .left
    }
    
    let cellImageView = UIImageView().then {
        $0.image = UIImage(systemName: "eye.fill")
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .darkGray
    }
    
    lazy var countLabel: UILabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = UIColor.darkGray
        $0.textAlignment = .right
    }
    
    private let customFlowLayout = CustomFlowLayout()
    
    lazy var homeCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: customFlowLayout).then {
        $0.delegate = self
        $0.dataSource = self
        $0.decelerationRate = .fast
        $0.showsHorizontalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .always
        $0.register(HomeCVCell.self, forCellWithReuseIdentifier: HomeCVCell.reuseIdentifier)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension HomeTVCell {
    func configureHomeTVCell() {
        self.backgroundColor = .white
        self.addSubviews(views: [self.indexLabel, self.serviceNameLabel, self.cellImageView, self.countLabel])
        
        self.indexLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.width.equalTo(30)
        }
        
        self.countLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(20)
        }
        
        self.cellImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(self.countLabel.snp.leading).offset(-5)
            $0.width.height.equalTo(20)
        }
        
        
        self.serviceNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.indexLabel.snp.trailing).offset(10)
            $0.trailing.equalTo(self.cellImageView.snp.leading).offset(-20)
            $0.height.equalTo(20)
        }
    }
    
    func configureHomeTVCellForFirstSection() {
        self.addSubview(self.homeCollectionView)
        self.homeCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
extension HomeTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCVCell.reuseIdentifier, for: indexPath) as! HomeCVCell
        
        return cell
    }
    
    
}
