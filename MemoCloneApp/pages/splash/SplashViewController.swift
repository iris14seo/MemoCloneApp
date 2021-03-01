//
//  SplashViewController.swift
//  MemoCloneApp
//
//  Created by MUN JEONG SEO on 2021/02/25.
//
//MARK: 참고한 페이지 목록
/*
   모달로 화면 띄우기: https://etst.tistory.com/87
   애니메이션: https://jinnify.tistory.com/66
*/

import UIKit

typealias SplashPage = SplashViewController
class SplashViewController: UIViewController {
    
    let windowHeight = Double(UIScreen.main.bounds.height)
    let windowWidth = Double(UIScreen.main.bounds.width)
    let labelHeight : Double = 40
    let labelWidth : Double = 128
    let splashLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 1
        lb.font = .boldSystemFont(ofSize: 24.0)
        lb.textColor = .black
        lb.text = ""
        return lb
    }()
    
    let splashText : String = "MEMO APP"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initStyle()
        delay(2, closure: {
            //execute code
            UIView.animate(withDuration: 1.5, animations: {
                // duration 동안 애니메이션이 동작하는 구간
                self.splashLabel.alpha = 1
                self.splashLabel.text = self.splashText
                self.splashLabel.frame = CGRect(x: (self.windowWidth - self.labelWidth) / 2, y: (self.windowHeight / 2) - self.labelHeight, width: self.labelWidth, height: self.labelHeight)
            }, completion: { finished in
                // 애니메이션 종료 후 동작하는 구간
                sleep(UInt32(0.5))
                self.dismiss(animated: false, completion: nil)
            })
        })
        
    }
    
    private func initStyle() {
        self.view.do {
            $0.backgroundColor = getKeyColor()
            $0.addSubview(splashLabel)
        }
        self.splashLabel.do {
            $0.alpha = 0
            $0.frame = CGRect(x: (windowWidth/2 + labelWidth/2), y: (windowHeight / 2) - labelHeight, width: labelWidth, height: labelHeight)
        }
    }
    
}

extension SplashViewController {
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
}
