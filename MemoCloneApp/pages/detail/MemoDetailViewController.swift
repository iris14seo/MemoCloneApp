//
//  MemoDetailViewController.swift
//  MemoCloneApp
//
//  Created by MUN JEONG SEO on 2021/02/08.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MemoDetailDisplayLogic: class {
    func displaySaveSuccess()
    func displaySaveFail()
}

typealias MemoDetailPage = MemoDetailViewController
class MemoDetailViewController: UIViewController, MemoDetailDisplayLogic {
    var interactor: MemoDetailBusinessLogic?
    var router: (NSObjectProtocol & MemoDetailRoutingLogic & MemoDetailDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private var memoData: MemoData?
    private var isNewMemo: Bool = true
    private var key: String?
    
    init(data: MemoData) {
        //MARK: 커스톰 이니셜라이저 http://minsone.github.io/mac/ios/swift-initialization-summary
        self.memoData = data
        self.isNewMemo = false
        self.key = data.key
        
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = MemoDetailInteractor()
        let presenter = MemoDetailPresenter()
        let router = MemoDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initStyle()
        dataBind()
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    private func initStyle() {
        view.do {
            $0.backgroundColor = getKeyColor()
            
            let downSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeAction(_:)))
            downSwipeGestureRecognizer.direction = .down
            $0.addGestureRecognizer(downSwipeGestureRecognizer)
        }
        
        titleTextField.do {
            $0.font = .boldSystemFont(ofSize: 20.0)
            $0.textAlignment = .left
            $0.textColor = .black
            $0.text = ""
            $0.isUserInteractionEnabled = false
            $0.placeholder = "제목을 입력해주세요."
            $0.overrideUserInterfaceStyle = .light // 다크모드 대응
        }
        
        contentTextView.do {
            $0.font = .systemFont(ofSize: 17.0)
            $0.textAlignment = .left
            $0.textColor = .black
            $0.text = ""
            $0.isEditable = false
            $0.showsVerticalScrollIndicator = true
            $0.backgroundColor = .clear
            $0.delegate = self
            $0.overrideUserInterfaceStyle = .light // 다크모드 대응
        }
        
        initButton()
        initInteraction()
    }
    
    private func initButton() {
        if isNewMemo {
            editButton.isHidden = true
            saveButton.isHidden = false
        } else {
            editButton.isHidden = false
            saveButton.isHidden = true
        }
    }
    
    private func initInteraction() {
        titleTextField.isUserInteractionEnabled = isNewMemo
        contentTextView.isEditable = isNewMemo
    }
    
    private func setTextViewPlaceHolder() {
        let text = self.contentTextView.text
        
        if text == "내용을 입력해주세요." {
            self.contentTextView.text = ""
            self.contentTextView.textColor = .black
        } else if text == "" {
            self.contentTextView.text = "내용을 입력해주세요."
            self.contentTextView.textColor = .lightGray
        }
    }
   
    private func dataBind() {
        if isNewMemo {
            titleTextField.text = ""
            contentTextView.text = ""
            
            setNewMemo()
        } else {
            guard let data = self.memoData else {
                return
            }
            
            titleTextField.text = data.title
            contentTextView.text = data.content
        }
        
        setTextViewPlaceHolder()
    }
    
    private func setNewMemo() { //MARK: 네이밍 고민중
        titleTextField.becomeFirstResponder()
    }
    
    private func requestSaveMemoData() {
        var savedTitle: String?
        var savedContent: String?
        
        if let title = titleTextField.text, title.count > 0 {
            savedTitle = title.trimmingCharacters(in: .whitespaces)
        }
        
        if let content = contentTextView.text, content.count > 0 {
            savedContent = content.trimmingCharacters(in: .whitespaces)
        }
        
        let memoData = MemoDetail.WrittenMemoData(title: savedTitle, content: savedContent, isFixed: false)
        var request = MemoDetail.저장.Request()
        request.memoData = memoData
        
        self.interactor?.requestSaveMemoData(request: request, key: "-MUnVOkwCzqu4TU_9mVP")
    }
    
    @IBAction func handleEditBTNTap(_ sender: Any) {
        titleTextField.isUserInteractionEnabled = true
        contentTextView.isEditable = true
        
        editButton.isHidden = false
        saveButton.isHidden = true
        
        contentTextView.becomeFirstResponder()
    }
    
    @IBAction func handleSaveBTNTap(_ sender: Any) {
        requestSaveMemoData()
    }
    
    @objc func handleSwipeAction(_ sender: UISwipeGestureRecognizer) {
        // down swipe -> keyboard hide
        if sender.direction == .down {
            self.view.endEditing(true)
        }
    }
    
    // MARK: Do something
    
    func displaySaveSuccess() {
        let saveAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.router?.routeToListPage()
        }
        showOKAlert(vc: self, title: "저장 성공", message: "메모가 성공적으로 저장되었습니다.", okAction: saveAction)
    }
    
    func displaySaveFail() {
        showOKAlert(vc: self, title: "저장 실패", message: "에러가 발생하여 저장이 실패하였습니다.")
    }
    
}

extension MemoDetailViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        //MARK: [이슈] 내용작성 후 다 지웠을때 responder에서 벗어난 다음에만 감지하여 placeholder 적용됨 <- RX 추가해서 실시간 placeholder 적용하기
        if textView.text == "" {
            setTextViewPlaceHolder()
        }
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        setTextViewPlaceHolder()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        //개행 시 최초 응답자 제거
        if text == "/n" {
            textView.resignFirstResponder()
        }
        
        return true
    }
}
