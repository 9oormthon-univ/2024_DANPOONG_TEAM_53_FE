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
        //        $0.image = UIImage(systemName: "person")
        $0.backgroundColor = .darkGray
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        
    }
    
    private let commentLabel = UILabel().then {
        $0.text = "공동인증서로 로그인 먼저 하시면 보일거예요. 저도 이거 때문에 많이 해매서 알아요 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ\nㄴ\nㄴ\nㄴ\nㄴ\nㄴ\nㄴㅇㄹ\nㄴㅇㄹ\n ㄴㅇㄹ"
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = UIFont.customFont(.goormSans500, size: 18)
    }
    
    private let commentRegisterDateLabel = UILabel().then {
        $0.text = "11/21 16:21"
        $0.font = UIFont.customFont(.goormSans500, size: 8)
        $0.textColor = UIColor.darkGray
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
        self.sendSubviewToBack(self.contentView)
        self.addSubviews(views: [self.profileImageView, self.nickNameLabel, self.commentLabel, self.commentRegisterDateLabel])
        
        
        self.profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(20)
        }
        
        self.nickNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.profileImageView)
            $0.leading.equalTo(self.profileImageView.snp.trailing).offset(10)
            $0.trailing.lessThanOrEqualToSuperview().offset(-10)
        }
        
        self.commentLabel.snp.makeConstraints {
            $0.top.equalTo(self.profileImageView.snp.bottom).offset(5)
            $0.leading.equalTo(self.profileImageView)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalTo(self.commentRegisterDateLabel.snp.top).offset(-5)
        }
        
        self.commentRegisterDateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-5)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
    }
}
