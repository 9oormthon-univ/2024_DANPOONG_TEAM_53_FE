//
//  CommentCell.swift
//  Irumso
//
//  Created by 김은상 on 11/21/24.
//

import UIKit

final class CommentCell: UITableViewCell {
    static let reuseIdentifier: String = "CommentCell"
    
    private let nickNameLabel = UILabel().then {
        $0.text = "김아무개"
        $0.font = UIFont.customFont(.goormSans500, size: 15)
    
    }
    
    private lazy var profileImageView = UIImageView().then {
        $0.image = UIImage(systemName: "person")
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 3
        $0.clipsToBounds = true
        
    }
    
    private let commentTextView = UITextView().then {
        $0.text = "공동인증서로 로그인 먼저 하시면 보일거예요."
        $0.font = UIFont.customFont(.goormSans500, size: 15)
    }
    
    private let commentRegisterDateLabel = UILabel().then {
        $0.text = "11/21 16:21"
        $0.font = UIFont.customFont(.goormSans400, size: 8)
        $0.textColor = UIColor.systemGray5
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureCommentCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension CommentCell {
    private func configureCommentCell() {
        self.addSubview(self.contentView)
        self.contentView.addSubviews(views: [self.profileImageView, self.nickNameLabel, self.commentTextView, self.commentRegisterDateLabel])
        
        self.contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(15)
        }
        
        self.nickNameLabel.snp.makeConstraints {
            $0.top.equalTo(self.profileImageView.snp.top)
            $0.bottom.equalTo(self.profileImageView.snp.bottom)
            $0.leading.equalTo(self.profileImageView.snp.trailing).offset(10)
            $0.width.equalTo(100)
        }
        
        self.commentTextView.snp.makeConstraints {
            $0.leading.equalTo(self.profileImageView.snp.leading)
            $0.top.equalTo(self.profileImageView.snp.bottom).offset(5)
            $0.height.equalTo(30)
            $0.trailing.equalToSuperview()
            
        }
        
        self.commentRegisterDateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(self.commentTextView.snp.bottom).offset(5)
            
        }
        
    }
}
