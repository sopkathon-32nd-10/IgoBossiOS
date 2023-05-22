//
//  CheckService.swift
//  iOS
//
//  Created by 류희재 on 2023/05/21.
//

import Foundation

import Alamofire

enum CheckService{
    case getCheck(CheckRequest)
    case patchCheck(CheckRequest, Check)
}

extension CheckService: BaseTargetType {
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getCheck:
            return .get
        case .patchCheck(_, _):
            return .patch
        }
    }
    
    var path: String {
        switch self {
        case .getCheck:
            return "checklist"
        case .patchCheck(_, _):
            return "checklist"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getCheck(let request):
            return .query(request)
        case .patchCheck(let query, let body):
            return .both(query, body)
        }
    }
}





