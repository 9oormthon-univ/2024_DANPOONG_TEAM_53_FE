//
//  SignInVC.swift
//  Irumso
//
//  Created by 김은상 on 11/19/24.
//

import UIKit
import Then
import SnapKit

final class SignInVC: UIViewController {
    
    
    private lazy var kakaoLogInButton = UIButton().then {
        $0.setImage(UIImage(named: "kakao_login_large_wide")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(kakaoLogInButtonDidTapped), for: .touchUpInside)
    }
    
    
    private let authViewModel = AuthViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authViewModel.checkToken { hasToken in
            if hasToken {
                let homeVC = HomeVC()
                self.navigationController?.pushViewController(homeVC, animated: true)
            } else {
                self.configureSignInVC()
            }
        }
    }
    

    @objc func kakaoLogInButtonDidTapped() {
        print("Debug: \(#function)")
        // 카카오 로그인 시도
        self.authViewModel.kakaoLogin()
        Task {
            // 로그인 완료 후 상태 확인
            if self.authViewModel.isLogin {
                print("로그인 성공!")
                self.authViewModel.getUserInfo()
                
                
                // 필요하면 다음 화면으로 전환
                // let nextVC = NextViewController()
                // self.navigationController?.pushViewController(nextVC, animated: true)
            } else {
                print("로그인 실패.")
            }
        }
        
    }

}



extension SignInVC {
    private func configureSignInVC() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.kakaoLogInButton)
        
        self.kakaoLogInButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            $0.height.equalTo(50)
        }

        self.kakaoLogInButton.imageView?.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
