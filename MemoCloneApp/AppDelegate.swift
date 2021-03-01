//
//  AppDelegate.swift
//  MemoCloneApp
//
//  Created by MUN JEONG SEO on 2021/02/08.
//

import UIKit
import Firebase
//import CoreData
//import UserNotifications
//import Reachability

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let splashPage = SplashPage()
    let mainPage = MainPage()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 메인 페이지 루트vc 세팅
        let navigationVC = UINavigationController(rootViewController: mainPage)
        
        //MARK: 탭바 제거
        /*let tabBarVC = UITabBarController()
        
        tabBarVC.viewControllers = [navigationVC]
        tabBarVC.tabBar.backgroundColor(.systemBackground)
        setTabBar(tabBar: tabBarVC.tabBar, addTopLine: true)*/
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationVC//tabBarVC
        window?.makeKeyAndVisible()
        
        // 스플래시 페이지 띄우기
        splashPage.modalPresentationStyle = .overFullScreen
        mainPage.present(splashPage, animated: false, completion: nil)
        
        // 데이터 세팅
        initFireBase()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        signOut()
    }
    
    func initFireBase() {
        FirebaseApp.configure()
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("signing out 에러: \(signOutError)")
        }
    }
}
