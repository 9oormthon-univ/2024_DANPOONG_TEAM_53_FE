//
//  AuthViewModel.swift
//  Irumso
//
//  Created by dezxcvb on 11/20/24.
//

import Foundation
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser
    
final class AuthViewModel {
    @Published var isLogin: Bool = false
    
    init() {
        print("authVM init()")
    }
    

//    var kakaoToken: OAuthToken? {
//        didSet {
//            guard let kakaoToken = self.kakaoToken else { return }
//            //UserDefaults.standard.setValue(kakaoToken, forKey: "kakaoToken")
//        }
//    }
    
    func loginWithKakaoTalkApp() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                } else {
                    print("LoginWithKakaoTalk() success.")
                    
                    // 회원가입 성공 시 토큰 저장
                    UserDefaults.standard.set(oauthToken, forKey: "accessToken")
                    // 사용자 정보 불러오기
                    self.getUserInfo()
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    func loginWithKakaoAccount() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                } else {
                    print("LoginWithKakaoAccount() success.")
                    
                    // 회원가입 성공 시 토큰 저장
                    UserDefaults.standard.set(oauthToken, forKey: "accessToken")
                    // 사용자 정보 불러오기
                    self.getUserInfo()
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    @MainActor
    func kakaoLogin() {
        Task {
            if (UserApi.isKakaoTalkLoginAvailable()) {
                self.isLogin = await loginWithKakaoTalkApp()
            } else {
                self.isLogin = await loginWithKakaoAccount()
            }
        }
    }
    
    @MainActor
    func kakaoLogout() {
        Task {
            self.isLogin = await self.handleKakaoLogout()
        }
    }
    
    func handleKakaoLogout() async -> Bool {
        await withCheckedContinuation { continuation in
            UserApi.shared.logout { (error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: true)
                }
                else {
                    print("logout() success.")
                    continuation.resume(returning: false)
                }
            }
        }
    }
    
    func checkToken() {
        if (AuthApi.hasToken()) {
            UserApi.shared.accessTokenInfo { (_, error) in
                if let error = error {
                    if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true  {
                        // 로그인 필요
                    }
                    else {
                        // 기타 에러
                    }
                }
                else {
                    // 토큰 유효성 체크 성공(필요 시 토큰 갱신됨)
                    print("checkToken() success.")
                }
            }
        } else {
            // 로그인 필요
        }
    }
    
    func getUserInfo() {
        UserApi.shared.me { (user, error) in
            if let error = error {
                print(error)
            } else {
                print("me() success.")

                // 사용자 정보 출력
                // guard let userId = user?.id else { return }
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
