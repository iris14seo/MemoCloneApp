//
//  Seeds.swift
//  MemoCloneAppTests
//
//  Created by MUN JEONG SEO on 2021/03/07.
//

@testable import MemoCloneApp
import XCTest

struct Seeds {
    struct Uid {
        static let uid1 = "uiduiduiduiduid1"
    }
    
    struct MemoDatas {
        static let memoOne = MemoData(dictionary: ["uid": "uiduiduiduiduid1", "key": "-MUqK23KDFSADK3445", "title": "제목1", "content":"메모내용메모내용메모내용메모내용메모내용1", "updatedDate": 1614745476, "isFixed": true])
        static let memoTwo = MemoData(dictionary: ["uid": "uiduiduiduiduid1", "key": "-MUqK23KDFSAADF998", "title": "", "content":"메모내용메모내용메모내용메모내용메모내용2", "updatedDate": 1614745477, "isFixed": false])
        static let memoThree = MemoData(dictionary: ["uid": "uiduiduiduiduid1", "key": "-MUqK23KDF23DFA445", "title": "제목3", "content":"", "updatedDate": 1614745478, "isFixed": true])
        static let memoFour = MemoData(dictionary: ["uid": "uiduiduiduiduid1", "key": "-MUqK23KDFSAADF998", "title": "", "content":"", "updatedDate": 1614748651, "isFixed": false])
    }
    
    struct WrittenMemoData {
        static let writtenMemoOne = MemoDetail.WrittenMemoData(title: "제목1", content: "내용내용내용1", isFixed: false)
        static let writtenMemoTwo = MemoDetail.WrittenMemoData(title: nil, content: "내용내용내용2", isFixed: true)
        static let writtenMemoThree = MemoDetail.WrittenMemoData(title: "제목3", content: nil, isFixed: false)
        static let writtenMemoFour = MemoDetail.WrittenMemoData(title: nil, content: nil, isFixed: false)
    }
    
    struct Keys {
        static let keyOne = "-MUqK23KDFSADK3445"
        static let keyTWO = ""
    }
}
