//
//  SurveyButton.swift
//  Irumso
//
//  Created by 김은상 on 11/20/24.
//

import UIKit

class SurveyButton: UIButton {
    
    private var normalBackgroundColor: UIColor = .white
    private var normalTextColor: UIColor = UIColor(hexCode: "555555")
    private var normalBorderColor = UIColor(hexCode: "CECECE")
    
    private var highlightedBackgroundColor: UIColor = UIColor(hexCode: "D4883B")
    private var highlightedTextColor: UIColor = .white
    private var highlightedBorderColor = UIColor(hexCode: "C57626")
    
    var text: String?
    
    init(text: String,
         normalBackgroundColor: UIColor = .white,
         highlightedBackgroundColor: UIColor = UIColor(hexCode: "D4883B"),
         normalTextColor: UIColor = UIColor(hexCode: "555555"),
         highlightedTextColor: UIColor = .white,
         normalBorderColor: UIColor = UIColor(hexCode: "CECECE"),
         highlightedBorderColor: UIColor = UIColor(hexCode: "C57626"),
         cornerRadius: CGFloat = 13) {
        super.init(frame: .zero)
        self.normalBackgroundColor = normalBackgroundColor
        self.highlightedBackgroundColor = highlightedBackgroundColor
        self.normalTextColor = normalTextColor
        self.highlightedTextColor = highlightedTextColor
        self.normalBorderColor = normalBorderColor
        self.highlightedBorderColor = highlightedBorderColor
        self.setTitle(text, for: .normal)
        self.text = text
        self.configureSurveyButton()
        self.updateButtonWidth() // 초기 설정 시 버튼 크기 업데이트
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureSurveyButton()
        self.updateButtonWidth() // 초기 설정 시 버튼 크기 업데이트
    }
    
    private func configureSurveyButton() {
        if #available(iOS 15.0, *) {
            var config = UIButton.Configuration.plain()
            config.baseBackgroundColor = normalBackgroundColor
            config.baseForegroundColor = normalTextColor
            config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8)
            
            self.configuration = config
            self.layer.cornerRadius = 8
            self.clipsToBounds = true
            self.layer.borderWidth = 1
            self.layer.borderColor = normalBorderColor.cgColor
        } else {
            // iOS 15 미만용
            self.backgroundColor = normalBackgroundColor
            self.setTitleColor(normalTextColor, for: .normal)
            self.layer.cornerRadius = 8
            self.clipsToBounds = true
            self.layer.borderWidth = 1
            self.layer.borderColor = normalBorderColor.cgColor
            self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
        
        
    }

    private func updateButtonWidth() {
        if #available(iOS 15.0, *) {
            self.sizeToFit()
            if let config = self.configuration {
                self.frame.size.width += config.contentInsets.leading + config.contentInsets.trailing
            }
        } else {
            self.sizeToFit()
            self.frame.size.width += self.contentEdgeInsets.left + self.contentEdgeInsets.right
        }
    }

    
    private func selectButton() {
        self.isSelected = true
        self.backgroundColor = self.highlightedBackgroundColor
        self.layer.borderColor = self.highlightedBorderColor.cgColor

        if #available(iOS 15.0, *) {
            var config = self.configuration ?? UIButton.Configuration.plain()
            config.baseBackgroundColor = self.highlightedBackgroundColor
            config.baseForegroundColor = self.highlightedTextColor
            self.configuration = config
        } else {
            self.setTitleColor(self.highlightedTextColor, for: .normal)
        }
    }

    private func deselectButton() {
        self.isSelected = false
        self.backgroundColor = self.normalBackgroundColor
        self.layer.borderColor = self.normalBorderColor.cgColor

        if #available(iOS 15.0, *) {
            var config = self.configuration ?? UIButton.Configuration.plain()
            config.baseBackgroundColor = self.normalBackgroundColor
            config.baseForegroundColor = self.normalTextColor
            self.configuration = config
        } else {
            self.setTitleColor(self.normalTextColor, for: .normal)
        }
    }

//    private func selectButton() {
//        self.isSelected = true
//        self.backgroundColor = self.highlightedBackgroundColor
//        self.layer.borderColor = self.highlightedBorderColor.cgColor
//        self.setTitleColor(self.highlightedTextColor, for: .normal)
//    }
//    
//    private func deselectButton() {
//        self.isSelected = false
//        self.backgroundColor = self.normalBackgroundColor
//        self.layer.borderColor = self.normalBorderColor.cgColor
//        self.setTitleColor(self.normalTextColor, for: .normal)
//    }
//    
    func updateSelectionState(isSelected: Bool) {
        if isSelected {
            selectButton()
        } else {
            deselectButton()
        }
    }
    
    
    override var intrinsicContentSize: CGSize {
        if #available(iOS 15.0, *) {
            guard let configuration = self.configuration else {
                return super.intrinsicContentSize
            }
            let textSize = super.intrinsicContentSize
            let width = textSize.width + configuration.contentInsets.leading + configuration.contentInsets.trailing
            let height = textSize.height + configuration.contentInsets.top + configuration.contentInsets.bottom
            return CGSize(width: width, height: height)
        } else {
            let textSize = super.intrinsicContentSize
            let width = textSize.width + contentEdgeInsets.left + contentEdgeInsets.right
            let height = textSize.height + contentEdgeInsets.top + contentEdgeInsets.bottom
            return CGSize(width: width, height: height)
        }
    }

}

