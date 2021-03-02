//
//  CommonModel.swift
//  MemoCloneApp
//
//  Created by MUN JEONG SEO on 2021/03/01.
//

import Foundation
import UIKit

public struct MemoData {
    var uid: String?
    var key: String?
//    var memoId: String?
    var title: String?
    var content: String?
    var updatedDate: Date?
    var isFixed: Bool
    
    init(dictionary: [String: Any]) {
        self.uid = dictionary["uid"] as? String
//        self.memoId = dictionary["memoId"] as? String
        self.title = dictionary["title"] as? String
        self.content = dictionary["content"] as? String
        let epocTime = TimeInterval(dictionary["updatedDate"] as? Int ?? 0)
        self.updatedDate = Date(timeIntervalSince1970: epocTime)
        self.isFixed = dictionary["isFixed"] as! Bool
    }
}
