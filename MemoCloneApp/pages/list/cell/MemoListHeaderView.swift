//
//  MemoListHeaderView.swift
//  MemoCloneApp
//
//  Created by MUN JEONG SEO on 2021/02/27.
//

import UIKit

class MemoListHeaderView: CustomXibView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
       super.awakeFromNib()
        
       //custom logic goes here
        initStyle()
    }
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    
    func initStyle() {
        contentView.do {
            $0.backgroundColor = .clear
        }
        
        headerLabel.do {
            $0.text = "리스트 페이지"
            $0.font = .boldSystemFont(ofSize: 24)
            $0.textColor = .black
            $0.textAlignment = .left
        }
    }
}
