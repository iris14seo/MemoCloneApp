//
//  IntroGuideViewController.swift
//  MemoCloneApp
//
//  Created by MUN JEONG SEO on 2021/02/23.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
// MARK: 참고 페이지
/*
   페이지컨트롤 사용하기: https://moonibot.tistory.com/29
   제스쳐 사용하기: https://zeddios.tistory.com/345
   스와이프 제스쳐(방향별로 인스턴스 생성해서 등록): https://app-developer.tistory.com/183
   */

import UIKit

typealias IntroGuidePage = IntroGuideViewController
class IntroGuideViewController: UIViewController {
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: View lifecycle
    
    @IBOutlet weak var guideImgView: UIImageView!
    @IBOutlet weak var imgPageControl: UIPageControl!
    @IBOutlet weak var closeButton: UIButton!
    
    //Test Data
    let imgList: [String] = ["yellowImage", "orangeImage", "pinkImage", "greenImage", "blueImage", "purpleImage"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initStyle()
        setViewGesture()
        setImageView()
        setBottomBTN()
        setImgPageControl()
    }
    
    // set style
    
    private func initStyle() {
        view.do {
            $0.backgroundColor = getKeyColor()
        }
    }
    
    private func setViewGesture() {
        let leftSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeAction(_:)))
        let rightSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeAction(_:)))
        
        leftSwipeGestureRecognizer.direction = .left
        rightSwipeGestureRecognizer.direction = .right
        
        view.addGestureRecognizer(leftSwipeGestureRecognizer)
        view.addGestureRecognizer(rightSwipeGestureRecognizer)
    }
    
    private func setBottomBTN() {
        closeButton.do {
            $0.backgroundColor = .black
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 22.0)
            $0.setTitle("건너뛰기", for: .normal)
        }
    }
    
    private func setImageView() {
        guideImgView.do {
            $0.isUserInteractionEnabled = false
            $0.image = UIImage(named: self.imgList[0])
        }
    }
    
    private func setImgPageControl() {
        imgPageControl.do {
            $0.numberOfPages = self.imgList.count
            $0.currentPage = 0
            $0.pageIndicatorTintColor = .lightGray
            $0.currentPageIndicatorTintColor = .black
        }
    }
    
    @IBAction func handleCloseButtonTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handlePageControlChanged(_ sender: Any) {
        guideImgView.image = UIImage(named: self.imgList[imgPageControl.currentPage])
    }
    
    @objc func handleSwipeAction(_ sender: UISwipeGestureRecognizer) {
        guard imgList.count == imgPageControl.numberOfPages else {
            return
        }
        
        switch sender.direction {
        case .right:
            print("right gesture")
            
            guard self.imgPageControl.currentPage != 0 else {
                return
            }
            
            self.imgPageControl.currentPage -= 1
            guideImgView.image = UIImage(named: self.imgList[imgPageControl.currentPage])
            
        case .left:
            print("left gesture")
            
            guard self.imgPageControl.currentPage != self.imgList.count else {
                return
            }
            
            self.imgPageControl.currentPage += 1
            guideImgView.image = UIImage(named: self.imgList[imgPageControl.currentPage])
            
        default :
            print("other gesture")
            break
        }
    }
    
}
