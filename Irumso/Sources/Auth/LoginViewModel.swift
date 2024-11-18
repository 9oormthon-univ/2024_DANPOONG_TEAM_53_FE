//
//  LoginViewModel.swift
//  Irumso
//
//  Created by dezxcvb on 11/18/24.
//

import Foundation
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewModel {
    
    var kakaoToken: OAuthToken? {
        didSet {
            guard let kakaoToken = self.kakaoToken else { return }
            //UserDefaults.standard.setValue(kakaoToken, forKey: "kakaoToken")
        }
    }
    var isLogin: Bool = false
    var name: String = ""
    var email: String = ""
    var profile: URL? = URL(string: "")
    
    init() {
        
    }
    
    func loginWithKakaoTalkApp() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("LoginWithKakaoTalk() success.")
                    
                    // 성공 시 동작 구현
                    _ = oauthToken
                    
                    // 회원가입 성공 시 토큰 저장
                    self.kakaoToken = oauthToken
                    // 로그인 상태 변경
                    self.isLogin = true
                }
                continuation.resume(returning: false)
            }
        }
    }
    
    func loginWithKakaoAccount() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("LoginWithKakaoAccount() success.")
                    
                    // 성공 시 동작 구현
                    _ = oauthToken
                    
                    // 회원가입 성공 시 토큰 저장
                    self.kakaoToken = oauthToken
                    // 로그인 상태 변경
                    self.isLogin = true
                }
                continuation.resume(returning: false)
            }
        }
    }
    
    func kakaoLogin() {
        Task {
            if (UserApi.isKakaoTalkLoginAvailable()) {
                isLogin = await loginWithKakaoTalkApp()
            } else {
                isLogin = await loginWithKakaoAccount()
            }
        }
    }
    
    func kakaoLogout() {
        UserApi.shared.logout { (error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
            }
        }
    }
    
    func getUserInfo() {
        UserApi.shared.me { (user, error) in
            if let error = error {
                print(error)
            } else {
                print("me() success.")
                
                // 성공 시 동작 구현
                _ = user
                
                guard let userId = user?.id else { return }
                guard let name = user?.kakaoAccount?.name else { return }
                guard let email = user?.kakaoAccount?.email else { return }
                guard let profileImageUrl = user?.kakaoAccount?.profile?.profileImageUrl else { return }
                guard let nickname = user?.kakaoAccount?.profile?.nickname else { return }
                
                print("-----------------------userInfo----------------------------")
                print("이름")
                print(name)
                print("이메일")
                print(email)
                print("프로필 이미지")
                print(profileImageUrl)
                print("닉네임")
                print(nickname)
                print("-----------------------userInfo----------------------------")
            }
        }
    }
}
