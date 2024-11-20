//
//  SurveyButton.swift
//  Irumso
//
//  Created by 김은상 on 11/20/24.
//

import UIKit

class SurveyButton: UIButton {
    
    init(text: String) {
        super.init(frame: .zero)
        self.configureSurveyButton(text: text)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureSurveyButton(text: "")
    }
    

    private func configureSurveyButton(text: String) {
        self.setTitle(text, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(.black, for: .selected)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        self.backgroundColor = UIColor(named: "buttonColor") ?? .systemBlue
        self.layer.cornerRadius = 8
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
