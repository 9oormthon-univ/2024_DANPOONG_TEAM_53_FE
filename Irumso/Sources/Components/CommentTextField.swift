//
//  CommentTextField.swift
//  Irumso
//
//  Created by 김은상 on 11/22/24.
//

import UIKit

final class CommentTextField: UIView {
    
    private let commentBaseView: UIView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 13
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.clipsToBounds = true
    }
    
    private lazy var commentTextView: UITextView = UITextView().then {
        $0.backgroundColor = .clear
        $0.text = "댓글을 입력하세요.."
        
    }
    
    private lazy var registerCommentButton: UIButton = UIButton().then {
        $0.setTitle("등록", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 6
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureCommentTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension CommentTextField {
    private func configureCommentTextField() {
        self.backgroundColor = .white
        self.addSubview(self.commentBaseView)
        self.commentBaseView.addSubviews(views: [self.commentTextView, self.registerCommentButton])
        
        self.commentBaseView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.top.equalToSuperview().offset(5)
            $0.height.equalTo(45)
        }
        
        self.registerCommentButton.snp.makeConstraints {
            $0.top.equalTo(self.commentBaseView.snp.top).offset(7.5)
            $0.trailing.equalTo(self.commentBaseView.snp.trailing).offset(-5)
            $0.height.equalTo(30)
            $0.width.equalTo(60)
        }
        
        self.commentTextView.snp.makeConstraints {
            $0.top.equalTo(self.registerCommentButton.snp.top)
            $0.leading.equalTo(self.commentBaseView.snp.leading).offset(5)
            $0.bottom.equalTo(self.registerCommentButton.snp.bottom)
            $0.trailing.equalTo(self.registerCommentButton.snp.leading).offset(-5)
        }
        
        
    }
}


