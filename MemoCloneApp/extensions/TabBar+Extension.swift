//
//  TabBar+Extension.swift
//  MemoCloneApp
//
//  Created by MUN JEONG SEO on 2021/02/27.
//

import Foundation
import UIKit

extension UITabBar {
    func backgroundColor(_ color: UIColor, _ alpha: CGFloat = 1) { //static으로 하면 안됨
        // clear background
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = color
        UITabBar.appearance().alpha = alpha
        //UITabBar.appearance().isOpaque = true //불투명
        //UITabBar.appearance().isTranslucent = true//반투명
        
        /* iOS 13
         appearance(): ERROR Static member 'appearance' cannot be used on instance of type 'UITabBar'
         -> static 맴버여서 UITabBar 인스턴스에 사용불가
           
         tabBar.standardAppearance.shadowImage = UIImage()
         tabBar.standardAppearance.backgroundImage = UIImage()
         tabBar.standardAppearance.backgroundColor = backgroundColor
         */
    }
}
