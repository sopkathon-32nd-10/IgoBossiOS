//
//  PayService.swift
//  iOS
//
//  Created by 류희재 on 2023/05/21.
//

import Foundation

import Alamofire

enum PayService{
    case postPayInfo(PayRequest)
}

extension PayService: BaseTargetType {
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .postPayInfo:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .postPayInfo:
            return "user"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .postPayInfo(let request):
            return .body(request)
        }
    }
}




