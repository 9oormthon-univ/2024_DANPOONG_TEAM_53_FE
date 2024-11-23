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
    
    private lazy var maleButton = SurveyButton(text: "남자")
    private lazy var femaleButton = SurveyButton(text: "여자")
    
    private lazy var studentButton = SurveyButton(text: "학생")
    private lazy var workerButton = SurveyButton(text: "근로자")
    private lazy var joblessButton = SurveyButton(text: "실직자")
    
    private lazy var ageInputTextField = UITextField().then {
        $0.backgroundColor = UIColor(hexCode: "F0F0F0")
        $0.keyboardType = .numberPad
        $0.layer.cornerRadius = 8
        $0.textAlignment = .right
        $0.delegate = self
    }
    
    private let ageAttributeLabel1 = UILabel().then {
        $0.text = "만"
        $0.font = .systemFont(ofSize: 20)
        $0.textAlignment = .center
    }
    
    private let ageAttributeLabel2 = UILabel().then {
        $0.text = "세"
        $0.font = .systemFont(ofSize: 20)
        $0.textAlignment = .center
    }
    
    
    private lazy var incomeRange1Button = SurveyButton(text: "0~50%")
    private lazy var incomeRange2Button = SurveyButton(text: "51~75%")
    private lazy var incomeRange3Button = SurveyButton(text: "76~100%")
    private lazy var incomeRange4Button = SurveyButton(text: "101~200%")
    private lazy var incomeRange5Button = SurveyButton(text: "200% 초과")
    
    private lazy var genderButtons = [self.maleButton, self.femaleButton]
    private lazy var jobButtons = [self.studentButton, self.workerButton, self.joblessButton]
    private lazy var incomeButtons = [self.incomeRange1Button, self.incomeRange2Button,
                                      self.incomeRange3Button, self.incomeRange4Button,
                                      self.incomeRange5Button]
    
    private lazy var surveyCompleteButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.backgroundColor = UIColor(hexCode: "D4883B")
        $0.layer.cornerRadius = 8
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(surveyCompleteButtonDidTapped), for: .touchUpInside)
    }
    
    private var isFormValid: Bool {
        let isGenderSelected = genderButtons.contains { $0.isSelected }
        let isJobSelected = jobButtons.contains { $0.isSelected }
        let isIncomeSelected = incomeButtons.contains { $0.isSelected }
        
        let isAgeEntered = !(ageInputTextField.text?.isEmpty ?? true)
        
        return isGenderSelected && isJobSelected && isIncomeSelected && isAgeEntered
    }
    
    
    
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureServeyVCUI()
        self.configureButtonActions()
        self.updateSurveyCompleteButtonState()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //MARK: - Helpers
    private func configureButtonActions() {
        genderButtons.forEach { button in
            button.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)
        }
        
        jobButtons.forEach { button in
            button.addTarget(self, action: #selector(jobButtonTapped(_:)), for: .touchUpInside)
        }
        
        incomeButtons.forEach { button in
            button.addTarget(self, action: #selector(incomeButtonTapped(_:)), for: .touchUpInside)
        }
        
        ageInputTextField.addTarget(self, action: #selector(ageTextFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    private func updateButtonSelection(for group: [SurveyButton], selectedButton: SurveyButton) {
        group.forEach { button in
            button.updateSelectionState(isSelected: button == selectedButton)
        }
    }
    
    private func updateSurveyCompleteButtonState() {
        print(isFormValid)
        surveyCompleteButton.isEnabled = isFormValid
        surveyCompleteButton.backgroundColor = isFormValid ? UIColor(hexCode: "D4883B") : UIColor(hexCode: "C6C6C6")
    }
    
    
    
    
    //MARK: - Actions
    @objc private func surveyCompleteButtonDidTapped() {
        print("Debug: \(#function)")
        
        guard let myGender = self.genderButtons.filter({ $0.isSelected == true }).first?.text,
              let myJob = self.jobButtons.filter({ $0.isSelected == true }).first?.text,
              let myIncome = self.incomeButtons.filter({ $0.isSelected == true }).first?.text,
              let myAge = self.ageInputTextField.text else { return }
        
        print("Debug: MyGender: \(myGender)")
        print("Debug: myJob: \(myJob)")
        print("Debug: myIncome: \(myIncome)")
        print("Debug: myAge: \(myAge)")
        
    }
    
    @objc private func genderButtonTapped(_ sender: SurveyButton) {
        updateButtonSelection(for: genderButtons, selectedButton: sender)
        updateSurveyCompleteButtonState()
    }
    
    @objc private func jobButtonTapped(_ sender: SurveyButton) {
        updateButtonSelection(for: jobButtons, selectedButton: sender)
        updateSurveyCompleteButtonState()
    }
    
    @objc private func incomeButtonTapped(_ sender: SurveyButton) {
        updateButtonSelection(for: incomeButtons, selectedButton: sender)
        updateSurveyCompleteButtonState()
    }
    @objc private func ageTextFieldDidChange(_ textField: UITextField) {
        updateSurveyCompleteButtonState() // 상태 업데이트
    }
}



//MARK: - Extensions

extension SurveyVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacterSet = CharacterSet.decimalDigits
        if string.rangeOfCharacter(from: allowedCharacterSet.inverted) != nil {
            return false
        }
        
        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        return updatedText.count <= 2
    }
    
}



extension SurveyVC { // UI관련 extension
    private func configureServeyVCUI() {
        self.view.backgroundColor = .white
        self.configureLabels()
        self.view.addSubviews(views: self.surveyLabels)
        self.view.addSubviews(views: self.genderButtons)
        self.view.addSubviews(views: self.jobButtons)
        self.view.addSubviews(views: [self.ageAttributeLabel1, self.ageAttributeLabel2])
        self.view.addSubviews(views: self.incomeButtons)
        self.view.addSubviews(views: [self.ageInputTextField, self.surveyCompleteButton])
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
            $0.top.equalToSuperview().offset(90)
        }
        
        self.maleButton.snp.makeConstraints {
            $0.leading.equalTo(self.genderLabel.snp.leading)
            $0.top.equalTo(self.genderLabel.snp.bottom).offset(15)
            $0.height.equalTo(32)
        }
        
        self.femaleButton.snp.makeConstraints {
            $0.leading.equalTo(self.maleButton.snp.trailing).offset(25)
            $0.top.equalTo(self.maleButton)
            $0.height.equalTo(32)
        }
        
        self.jobLabel.snp.makeConstraints {
            $0.leading.equalTo(self.genderLabel)
            $0.top.equalTo(self.maleButton.snp.bottom).offset(30)
        }
        
        self.studentButton.snp.makeConstraints {
            $0.leading.equalTo(jobLabel)
            $0.top.equalTo(self.jobLabel.snp.bottom).offset(15)
            $0.height.equalTo(32)
        }
        
        self.workerButton.snp.makeConstraints {
            $0.leading.equalTo(self.studentButton.snp.trailing).offset(25)
            $0.top.equalTo(self.studentButton)
            $0.height.equalTo(32)
        }
        
        self.joblessButton.snp.makeConstraints {
            $0.leading.equalTo(self.workerButton.snp.trailing).offset(25)
            $0.top.equalTo(self.studentButton)
            $0.height.equalTo(32)
        }
        
        self.ageLabel.snp.makeConstraints {
            $0.leading.equalTo(self.genderLabel)
            $0.top.equalTo(self.studentButton.snp.bottom).offset(30)
        }
        
        self.ageAttributeLabel1.snp.makeConstraints {
            $0.leading.equalTo(self.ageLabel)
            $0.top.equalTo(self.ageLabel.snp.bottom).offset(30)
        }
        
        self.ageInputTextField.snp.makeConstraints {
            $0.centerY.equalTo(self.ageAttributeLabel1.snp.centerY)
            $0.leading.equalTo(self.ageAttributeLabel1.snp.trailing).offset(10)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
        
        self.ageAttributeLabel2.snp.makeConstraints {
            $0.leading.equalTo(self.ageInputTextField.snp.trailing).offset(10)
            $0.top.equalTo(self.ageAttributeLabel1)
        }
        
        self.medianIncomeLabel.snp.makeConstraints {
            $0.leading.equalTo(self.genderLabel)
            $0.top.equalTo(self.ageAttributeLabel1.snp.bottom).offset(30)
        }
        
        self.incomeRange1Button.snp.makeConstraints {
            $0.leading.equalTo(self.studentButton)
            $0.top.equalTo(self.medianIncomeLabel.snp.bottom).offset(15)
            $0.height.equalTo(32)
        }
        
        self.incomeRange2Button.snp.makeConstraints {
            $0.leading.equalTo(self.incomeRange1Button.snp.trailing).offset(10)
            $0.top.equalTo(self.medianIncomeLabel.snp.bottom).offset(15)
            $0.height.equalTo(32)
        }
        
        self.incomeRange3Button.snp.makeConstraints {
            $0.leading.equalTo(self.incomeRange2Button.snp.trailing).offset(10)
            $0.top.equalTo(self.medianIncomeLabel.snp.bottom).offset(15)
            $0.height.equalTo(32)
        }
        
        self.incomeRange4Button.snp.makeConstraints {
            $0.leading.equalTo(self.studentButton)
            $0.top.equalTo(self.incomeRange1Button.snp.bottom).offset(10)
            $0.height.equalTo(32)
        }
        
        self.incomeRange5Button.snp.makeConstraints {
            $0.leading.equalTo(self.incomeRange4Button.snp.trailing).offset(10)
            $0.top.equalTo(self.incomeRange4Button)
            $0.height.equalTo(32)
        }
        
        self.surveyCompleteButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(45)
            $0.trailing.equalToSuperview().offset(-45)
            $0.bottom.equalToSuperview().offset(-50)
            $0.height.equalTo(48)
        }
    }
}



