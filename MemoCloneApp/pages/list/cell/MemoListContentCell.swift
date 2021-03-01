//
//  MemoListContentCell.swift
//  MemoCloneApp
//
//  Created by MUN JEONG SEO on 2021/02/27.
//

import UIKit

class MemoListContentCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    private func initStyle() {
        titleLabel.do {
            $0.text = ""
            $0.font = .boldSystemFont(ofSize: 15)
            $0.textColor = .black
            $0.textAlignment = .left
        }

        contentLabel.do {
            $0.text = ""
            $0.font = .systemFont(ofSize: 13)
            $0.textColor = .darkGray
            $0.textAlignment = .left
        }
        
        contentView.do {
            $0.backgroundColor = UIColorFromRGB("f5e2c4")
        }
    }
    
    func updateData(title: String?, content: String?, savedDate: String) {
        
        if let title = title {
            titleLabel.text = title
        } else {
            titleLabel.text = "제목 없음"
        }
        
        if let content = content {
            let contentWithDate = savedDate + content //가공하기
            contentLabel.text = contentWithDate
        } else {
            contentLabel.text = "\(savedDate) 내용 없음"
        }
    }
    
}
