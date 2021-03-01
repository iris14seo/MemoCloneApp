//
//  String+Extension.swift
//  MemoCloneApp
//
//  Created by MUN JEONG SEO on 2021/02/25.
//

import Foundation

extension String {
    
    var localized: String {
        let localizedString: String = NSLocalizedString(self, comment: "")
        return localizedString
    }
    
    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    public var length : Int{
        return Int(self.count)
    }
    
}

