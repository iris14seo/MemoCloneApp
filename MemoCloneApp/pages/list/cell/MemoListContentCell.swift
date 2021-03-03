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
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .darkGray
            $0.textAlignment = .left
        }
        
        contentView.do {
            $0.backgroundColor = UIColorFromRGB("f5e2c4")
        }
    }
    
    func updateData(title: String?, content: String?, savedDate: Date?) {
        
        if let title = title {
            titleLabel.text = title
        } else {
            titleLabel.text = "제목 없음"
        }
        
        contentLabel.do {
            let formatDate = getFomattedDate(date: savedDate)
            let content = content ?? "내용 없음"
            
            let resultAttrText:NSMutableAttributedString = NSMutableAttributedString()
            let att1 = NSAttributedString(string: "\(formatDate)",
                                          attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12),
                                                       NSAttributedString.Key.foregroundColor: UIColor.darkGray])
            let att2 = NSAttributedString(string: "  \(content)",
                                          attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
                                                       NSAttributedString.Key.foregroundColor: UIColor.darkGray])
            resultAttrText.append(att1)
            resultAttrText.append(att2)
            $0.attributedText = resultAttrText
        }
        
    }
    
    private func getFomattedDate(date: Date?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy. MM. dd."
        dateFormatter.locale = Locale.init(identifier: "ko_KR")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        
        guard let date = date else {
            return ""
        }
        
        let savedDateFormat = dateFormatter.string(from: date)
        return savedDateFormat
    }
}
