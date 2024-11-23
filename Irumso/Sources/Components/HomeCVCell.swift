//
//  HomeCVCell.swift
//  Irumso
//
//  Created by 김은상 on 11/23/24.
//

import UIKit

class HomeCVCell: UICollectionViewCell {
    static let reuseIdentifier: String = "HomeCVCell"
    
    lazy var collectionImageView: UIImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 6
        $0.isUserInteractionEnabled = true
        $0.clipsToBounds = true
    }
    
    var url: URL?
    var didTapImageView: ((URL) -> Void)? // 클로저로 URL 전달
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureHomeCVCell()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewDidTapped))
        self.collectionImageView.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func configure(with image: UIImage?, url: URL?) {
        collectionImageView.image = image
        self.url = url
    }
    @objc private func imageViewDidTapped() {
        guard let url = self.url else { return }
        didTapImageView?(url) // 클로저 호출로 URL 전달
    }
    
}

extension HomeCVCell {
    private func configureHomeCVCell() {
        self.backgroundColor = .white
        self.addSubview(self.collectionImageView)
        
        self.collectionImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}



import WebKit

class WebViewController: UIViewController {
    private let webView = WKWebView()
    private let url: URL
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        webView.load(URLRequest(url: url))
    }
}


extension HomeTVCell {
    
}
