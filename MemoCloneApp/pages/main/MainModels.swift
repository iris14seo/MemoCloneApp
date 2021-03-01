//
//  MainModels.swift
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

enum Main {
    // MARK: Use cases - 처음 진입한 앱 여부 한단
    enum 앱진입 {
        struct Request {
        }
        struct Response  {
            var isFirstLaunch: Bool?
            var isAutoSinInSuccess: Bool?
            var currentUserId: String?
        }
        struct ViewModel {
            var isFirstLaunch: Bool?
            var isAutoSinInSuccess: Bool?
            var currentUserId: String?
        }
    }
    // MARK: Use cases - 회원가입 하기
    enum 회원가입 {
        struct Request {
        }
        struct Response  {
            var hasCurrentUser: Bool? //자동 로그인된 상태
            var currentUserId: String?
        }
        struct ViewModel {
            var hasCurrentUser: Bool? //자동 로그인된 상태
            var currentUserId: String?
        }
    }
    // MARK: Use cases - 로그인 하기
    enum 로그인 {
        struct Request {
        }
        struct Response  {
            var currentUserId: String?
        }
        struct ViewModel {
            var currentUserId: String?
        }
    }
    
}
