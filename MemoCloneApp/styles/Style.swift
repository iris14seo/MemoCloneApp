//
//  Style.swift
//  MemoCloneApp
//
//  Created by MUN JEONG SEO on 2021/02/25.
//

import Foundation
import UIKit

enum AppColor: String {
    case keyColor = "F6EEDF"
    case grayLineColor = "d4d4d4"
}

public func UIColorFromRGB(_ hex:String, _ a:Float = 1.0) -> UIColor {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int = UInt32()
    Scanner(string: hex).scanHexInt32(&int)
    
    let r, g, b: UInt32
    switch hex.length {
    case 3: // RGB (12-bit)
        (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
        (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
    default:
        (r, g, b) = (1, 1, 0)
    }
    
    return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(255 * a) / 255)
}


public func getKeyColor() -> UIColor{
    //    return UIColorFromRGB(AppStyle.KEY_COLOR)
    return  UIColorFromRGB(AppColor.keyColor.rawValue) //연한 노랑색
}

public func setNavigationBar(navigationItem: UINavigationItem?,
                             navigationController: UINavigationController?,
                             title: String = "",
                             font: UIFont = .boldSystemFont(ofSize: 16.0),
                             textColor: UIColor = .black, hideTitleAtFirst: Bool = false) {

    guard let navigationItem = navigationItem, let navigationController = navigationController else {
        return
    }

    // attributes
    let textAttributes = [NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.font: font]

    // title text
    navigationItem.titleView = hideTitleAtFirst ? UILabel() : nil//hide navigationItem titleView at first
    
    navigationItem.title = title
    navigationController.navigationBar.titleTextAttributes = textAttributes

    // transparent view
    navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    navigationController.navigationBar.shadowImage = UIImage()
    navigationController.navigationBar.isTranslucent = true

    // navigationItem bar //MARK: 커스텀 하는 함수 만들기(작업중)
    navigationController.navigationBar.tintColor = textColor
}

public func showNavigationBarTitle(navigationItem: UINavigationItem?, navigationController: UINavigationController?) {
    guard let navigationItem = navigationItem, let navigationController = navigationController else {
        return
    }
    
    // title text
    navigationController.beginAppearanceTransition(true, animated: true)
    navigationItem.titleView = nil
}

public func hideNavigationBarTitle(navigationItem: UINavigationItem?, navigationController: UINavigationController?) {
    guard let navigationItem = navigationItem, let navigationController = navigationController else {
        return
    }
    
    // title text
    navigationController.beginAppearanceTransition(true, animated: true)
    navigationItem.titleView = UILabel()
}

public func setTabBarController(tabBarController: UITabBarController, backgroungColor: UIColor = .clear) {
    //tabBarController.tabBar.backgroundColor = backgroungColor //MARK: vs backgroundImage
    tabBarController.tabBar.backgroundImage = UIImage(color: backgroungColor)
    tabBarController.tabBar.backgroundColor = backgroungColor
}

public func setTabBar(tabBar: UITabBar, addShadow: Bool = false, addTopLine: Bool = false) {
    // 기본 그림자 스타일을 초기화해야 커스텀 스타일을 적용할 수 있다.
    //https://velog.io/@leejh3224/iOS-TabBar-shadow-%EC%BB%A4%EC%8A%A4%ED%84%B0%EB%A7%88%EC%9D%B4%EC%A7%95-trjugzee87

    //shadow
    if addShadow {
        tabBar.layer.applyShadow(color: .gray, alpha: 0.2, x: 0, y: 0, blur: 12)
    }

    //top line
    if addTopLine {
        tabBar.layer.addBorder(edge: .top, color: UIColorFromRGB(AppColor.grayLineColor.rawValue), thickness: 1.0)
    }
}
