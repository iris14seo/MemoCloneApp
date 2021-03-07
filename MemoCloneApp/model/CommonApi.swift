//
//  CommonApi.swift
//  MemoCloneApp
//
//  Created by MUN JEONG SEO on 2021/03/06.
//

import Foundation

//MARK: Firebase Api
public enum APIResult<U> {
    case Success(result: U)
    case Failure(error: CustomError)
}

public struct CustomError {
    var errorCode: String?
    var errorMsg: String?
    
    init(errorCode: String?, errorMsg: String? = "시스템 에러가 발생하였습니다.") {
        self.errorCode = errorCode
        self.errorMsg = errorMsg
    }
}
