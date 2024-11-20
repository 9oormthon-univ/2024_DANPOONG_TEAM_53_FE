//
//  SurveyVC.swift
//  Irumso
//
//  Created by 김은상 on 11/20/24.
//

import UIKit
import Then
import SnapKit

final class SurveyVC: UIViewController {
    //MARK: - Properties
    private let genderLabel = UILabel().then { $0.text = "성별" }
    private let jobLabel = UILabel().then { $0.text = "직업" }
    private let ageLabel = UILabel().then { $0.text = "나이" }
    private let medianIncomeLabel = UILabel().then { $0.text = "중위소득" }
    private lazy var surveyLabels = [self.genderLabel, self.jobLabel,
                                     self.ageLabel, self.medianIncomeLabel]
  
    
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureServeyVCUI()

    }
    
    
    //MARK: - Helpers
    
    
    //MARK: - Actions

}



//MARK: - Extensions
extension SurveyVC {
    private func configureServeyVCUI() {
        self.view.backgroundColor = .white
        self.configureLabels()
        self.view.addSubviews(views: self.surveyLabels)
        self.configureConstraints()
        
        
    }
    
    private func configureLabels() {
        self.surveyLabels.forEach {
            $0.textColor = .black
            $0.font = .boldSystemFont(ofSize: 24)
            $0.textAlignment = .left
        }
    }
    
    private func configureConstraints() {
        self.genderLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.top.equalToSuperview().offset(120)
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
        SurveyVC().toPreview()
    }
}
