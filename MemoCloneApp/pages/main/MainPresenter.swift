//
//  MainPresenter.swift
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

protocol MainPresentationLogic {
    func presentMainPage(response: Main.앱진입.Response)
    func presentRegisterSuccess(response: Main.회원가입.Response)
    func presentRegisterFail()
    func presentSignInSuccess(response: Main.로그인.Response)
    func presentSignInFail()
    func presentSignOutSuccess()
    func presentSignOutFail()
}

class MainPresenter: MainPresentationLogic {
    weak var viewController: MainDisplayLogic?
    
    // MARK: Do something
    
    func presentMainPage(response: Main.앱진입.Response)   {
        var viewModel = Main.앱진입.ViewModel()
        viewModel.isFirstLaunch = response.isFirstLaunch
        viewModel.isAutoSinInSuccess = response.isAutoSinInSuccess
        viewModel.currentUserId = response.currentUserId
        
        viewController?.displayStartPage(viewModel: viewModel)
    }
    
    func presentRegisterSuccess(response: Main.회원가입.Response) {
        var viewModel = Main.회원가입.ViewModel()
        viewModel.hasCurrentUser = response.hasCurrentUser
        viewModel.currentUserId = response.currentUserId
        
        viewController?.displayRegisterSuccess(viewModel: viewModel)
    }
    
    func presentRegisterFail() {
        viewController?.displayRegisterFail()
    }
    
    func presentSignInSuccess(response: Main.로그인.Response) {
        var viewModel = Main.로그인.ViewModel()
        viewModel.currentUserId = response.currentUserId
        
        viewController?.displaySignInSuccess(viewModel: viewModel)
    }
    
    func presentSignInFail() {
        viewController?.displaySignInFail()
    }
    
    func presentSignOutSuccess() {
        viewController?.displaySignOutSuccess()
    }
    
    func presentSignOutFail() {
        viewController?.displaySignOutFail()
    }
    
}
