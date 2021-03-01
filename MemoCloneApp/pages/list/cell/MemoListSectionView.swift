//
//  MemoListSectionView.swift
//  MemoCloneApp
//
//  Created by MUN JEONG SEO on 2021/02/27.
//

import UIKit

//MARK: 고정 섹션일 경우 버튼 액션에 따라 셀이 fold and stretch 되어야한다.
protocol MemoListSectionCellDelegate {
    func handlFoldAndStretchButtonTap(isFolded: Bool)
}

enum MemoListSectionStyle {
    case FixVersion, NormalVersion
}

class MemoListSectionView: UITableViewHeaderFooterView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        initStyle()
    }
    
    @IBOutlet weak var sectionTitleLabel: UILabel!
    @IBOutlet weak var sectionArrowButton: UIButton!
    
    var delegate: MemoListSectionCellDelegate?
    
    private var sectionStyle: MemoListSectionStyle = .NormalVersion
    private var isFolded: Bool = false
    
    private func initStyle() {
        
        sectionTitleLabel.do {
            $0.font = .boldSystemFont(ofSize: 18)
            $0.textColor = .black
            $0.textAlignment = .left
        }
        
        self.contentView.do {
            $0.backgroundColor = .clear
        }
    }
    
    func updateSectionData(style: MemoListSectionStyle = .NormalVersion, isFolded : Bool = false) {
        if style == .FixVersion {
            sectionTitleLabel.text = "고정된 메모"
            sectionArrowButton.isHidden = false
            sectionArrowButton.imageView?.image = isFolded ? UIImage(named: "rightArrow") : UIImage(named: "bottomArrow")
            self.isFolded = isFolded
        } else {
            sectionTitleLabel.text = "메모"
            sectionArrowButton.isHidden = true
        }
    }
    
    @IBAction func handlFoldAndStretchButtonTap(_ sender: Any) {
        isFolded = !isFolded
        
        UIView.animate(withDuration: 0.25, animations: {
            if self.isFolded {
                self.sectionArrowButton.imageView?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
            } else {
                self.sectionArrowButton.imageView?.transform = CGAffineTransform(rotationAngle: 0)
            }
        }, completion: { finished in
            if finished {
                self.delegate?.handlFoldAndStretchButtonTap(isFolded: self.isFolded)
            }
        })
        
    }
    
}

