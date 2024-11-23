//
//  sd.swift
//  Irumso
//
//  Created by 김은상 on 11/23/24.
//

import UIKit

class MyPageButton: UIButton {
    // MARK: - Initializer
    init(image: UIImage?, title: String) {
        super.init(frame: .zero)
        setupUI(image: image, title: title)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Properties
    private var action: (() -> Void)?

    // MARK: - Setup UI
    private func setupUI(image: UIImage?, title: String) {
        var config = UIButton.Configuration.plain()
        
        config.image = image
        config.image?.withTintColor(.white)
        config.title = title
        
        
        config.imagePlacement = .top
        config.imagePadding = 5
        
        config.baseForegroundColor = .white
        config.titleAlignment = .center
        
        let titleAttributes = AttributeContainer([
            .font: UIFont.boldSystemFont(ofSize: 12), // 원하는 폰트 설정
            .foregroundColor: UIColor.white // 텍스트 색상
        ])
        
        config.attributedTitle = AttributedString(title, attributes: titleAttributes)
        
        self.configuration = config
    }
}
