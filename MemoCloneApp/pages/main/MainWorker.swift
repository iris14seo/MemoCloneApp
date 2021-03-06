//
//  MainWorker.swift
//  MemoCloneApp
//
//  Created by MUN JEONG SEO on 2021/02/22.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

typealias AutoSignInCompletionHandler = (APIResult<User?>) -> Void
typealias AuthUserCompletionHandler = (APIResult<AuthDataResult?>) -> Void
typealias SignOutCompletionHandler = (APIResult<Bool>) -> Void

protocol MainProtocol {
    func requestAutoSignIn(completionHandler: @escaping (User?, CustomError?) -> Void)
    func requestAutoSignIn(completionHandler: @escaping AutoSignInCompletionHandler)
    
    func signInUser(id: String, pw: String, completionHandler: @escaping (AuthDataResult?, CustomError?) -> Void)
    func signInUser(id: String, pw: String, completionHandler: @escaping AuthUserCompletionHandler)
    
    func signOut(completionHandler: @escaping (Bool, CustomError?) -> Void)
    func signOut(completionHandler: @escaping SignOutCompletionHandler)
    
    func registerUser(id: String, pw: String, completionHandler: @escaping (AuthDataResult?, CustomError?) -> Void)
    func registerUser(id: String, pw: String, completionHandler: @escaping AuthUserCompletionHandler)
}

class MainWorker: MainProtocol {
    // 자동 로그인 API
    func requestAutoSignIn(completionHandler: @escaping (User?, CustomError?) -> Void) {
        if let user = Auth.auth().currentUser {
            completionHandler(User(uid: user.uid, email: user.email), nil)
        } else {
            completionHandler(nil, CustomError(errorCode: "1", errorMsg: "자동 로그인 실패"))
        }
    }
    
    func requestAutoSignIn(completionHandler: @escaping AutoSignInCompletionHandler) {
        if let user = Auth.auth().currentUser {
            completionHandler(APIResult.Success(result: User(uid: user.uid, email: user.email)))
        } else {
            completionHandler(APIResult.Failure(error: CustomError(errorCode: "1", errorMsg: "자동 로그인 실패")))
        }
    }
    
    // 로그인 API
    func signInUser(id: String, pw: String, completionHandler: @escaping (AuthDataResult?, CustomError?) -> Void) {
        Auth.auth().signIn(withEmail: id, password: pw) {(authResult, error) in
            if let error = error {
                completionHandler(nil, CustomError(errorCode: "3", errorMsg: "\(error.localizedDescription))"))
            } else {
                completionHandler(authResult, nil)
            }
        }
    }
    
    func signInUser(id: String, pw: String, completionHandler: @escaping AuthUserCompletionHandler) {
        Auth.auth().signIn(withEmail: id, password: pw) {(authResult, error) in
            if let error = error {
                completionHandler(APIResult.Failure(error: CustomError(errorCode: "3", errorMsg: "\(error.localizedDescription))")))
            } else {
                completionHandler(APIResult.Success(result: authResult))
            }
        }
    }
    
    // 로그아웃 API
    func signOut(completionHandler: @escaping (Bool, CustomError?) -> Void) {
        do {
            try Auth.auth().signOut()
            completionHandler(true, nil) //MARK: 어떻게 고칠지 고민중
        } catch let signOutError as NSError {
            completionHandler(false, CustomError(errorCode: "4", errorMsg: "\(signOutError)"))
        }
    }
    
    func signOut(completionHandler: @escaping SignOutCompletionHandler) {
        do {
            try Auth.auth().signOut()
            completionHandler(APIResult.Success(result: true)) //MARK: 어떻게 고칠지 고민중
        } catch let signOutError as NSError {
            completionHandler(APIResult.Failure(error: CustomError(errorCode: "4", errorMsg: "\(signOutError)")))
        }
    }
    
    // 회원가입 API
    func registerUser(id: String, pw: String, completionHandler: @escaping (AuthDataResult?, CustomError?) -> Void) {
        Auth.auth().createUser(withEmail: id, password: pw) {(authResult, error) in
            if let error = error {
                completionHandler(nil, CustomError(errorCode: "2", errorMsg: "\(error.localizedDescription))"))
            } else {
                completionHandler(authResult, nil)
            }
        }
    }
        
    func registerUser(id: String, pw: String, completionHandler: @escaping AuthUserCompletionHandler) {
        Auth.auth().createUser(withEmail: id, password: pw) {(authResult, error) in
            if let error = error {
                completionHandler(APIResult.Failure(error: CustomError(errorCode: "2", errorMsg: "\(error.localizedDescription))")))
            } else {
                completionHandler(APIResult.Success(result: authResult))
            }
        }
    }
}
