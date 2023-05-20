//
//  HomeService.swift
//  iOS
//
//  Created by 류희재 on 2023/05/21.
//

import Foundation

import Alamofire

enum HomeService{
    case getUserInfo
}

extension HomeService: BaseTargetType {
    var parameters: RequestParams {
        switch self{
        case .getUserInfo:
            return .none
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getUserInfo:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getUserInfo:
            return "user/1"
        }
    }
}



