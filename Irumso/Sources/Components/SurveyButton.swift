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
    
    private var highlightedBackgroundColor: UIColor = UIColor(named: "color1") ?? UIColor.orange
    private var highlightedTextColor: UIColor = .white
    private var highlightedBorderColor = UIColor(hexCode: "C57626")

    
    init(text: String,
         normalBackgroundColor: UIColor = .systemBlue,
         highlightedBackgroundColor: UIColor = .darkGray,
         normalTextColor: UIColor = .white,
         highlightedTextColor: UIColor = .lightGray,
         normalBorderColor: UIColor = .darkGray,
         highlightedBorderColor: UIColor = .black) {
        super.init(frame: .zero)
        self.normalBackgroundColor = normalBackgroundColor
        self.highlightedBackgroundColor = highlightedBackgroundColor
        self.normalTextColor = normalTextColor
        self.highlightedTextColor = highlightedTextColor
        configureSurveyButton(text: text)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureSurveyButton(text: "")
    }
    

    private func configureSurveyButton(text: String) {
        self.setTitle(text, for: .normal)
                self.setTitleColor(normalTextColor, for: .normal)
                self.setTitleColor(highlightedTextColor, for: .highlighted)
                self.backgroundColor = normalBackgroundColor
                self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
                self.layer.cornerRadius = 10
                self.translatesAutoresizingMaskIntoConstraints = false
    }
}
