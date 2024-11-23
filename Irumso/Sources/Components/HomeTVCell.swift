//
//  HomeTVCell.swift
//  Irumso
//
//  Created by 김은상 on 11/22/24.
//

import UIKit

struct ImageData {
    let image: UIImage?
    let url: URL?
}


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
    
    
    private var data: [ImageData] = [ImageData(image: UIImage(named: "imagecopy0"),
                                               url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202411210002")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy1"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202411210001")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy2"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202411150001")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy3"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202411140001")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy4"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202411040002")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy5"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202411010001")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy6"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202410280001")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy7"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202410220001")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy8"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202410170002")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy9"),
                                                                                url: URL(string: " https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202410150001")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy10"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202410110003")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy11"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202410110002")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy12"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202410020001")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy13"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202409260002")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy14"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202409260001")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy15"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202409090001")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy16"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202408290002")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy17"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202408230001")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy18"),
                                                                                url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202408070001")),
                                     
                                     ImageData(image: UIImage(named: "imagecopy19"),
                                               url: URL(string: "https://www.youthcenter.go.kr/jynTips/jynTipsDetail.do?tipsId=202407100001"))]
    // ImageData 모델 사용
    private lazy var infiniteData: [ImageData] = {
        var extendedData = data
        extendedData.insert(data.last!, at: 0)  // 앞에 마지막 데이터를 추가
        extendedData.append(data.first!)         // 뒤에 첫 번째 데이터를 추가
        return extendedData
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let initialOffset = homeCollectionView.contentSize.width / 3 - homeCollectionView.bounds.width / 2
        if homeCollectionView.contentOffset == .zero {
            homeCollectionView.setContentOffset(CGPoint(x: initialOffset, y: 0), animated: false)
        }
    }
}


extension HomeTVCell {
    func configureHomeTVCell() {
        self.backgroundColor = .white
        self.addSubviews(views: [self.indexLabel, self.serviceNameLabel,
                                 self.cellImageView, self.countLabel])
        
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
        return self.infiniteData.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCVCell.reuseIdentifier, for: indexPath) as! HomeCVCell
        let actualIndex = (indexPath.item - 1 + data.count) % data.count
        let imageData = infiniteData[actualIndex]
        cell.configure(with: imageData.image, url: imageData.url)
        
        
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.bounds.width
        let currentPage = Int(scrollView.contentOffset.x / pageWidth)
        
        // 왼쪽 끝으로 갔을 때
        if currentPage == 0 {
            let newOffset = CGPoint(x: CGFloat(data.count) * pageWidth, y: 0)
            scrollView.setContentOffset(newOffset, animated: false)
        }
        // 오른쪽 끝으로 갔을 때
        else if currentPage == infiniteData.count - 1 {
            let newOffset = CGPoint(x: pageWidth, y: 0)
            scrollView.setContentOffset(newOffset, animated: false)
        }
    }
    
}
