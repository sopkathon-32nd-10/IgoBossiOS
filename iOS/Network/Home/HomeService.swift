//
//  HomeService.swift
//  iOS
//
//  Created by 류희재 on 2023/05/21.
//

import Foundation

import Alamofire

enum HomeService{
    case getUserInfo(HomeRequest)
}

extension HomeService: BaseTargetType {
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getUserInfo:
            return .get
    }
    
    var path: String {
        switch self {
        case .getNowPlaying:
            return "user"
    }
    
    var parameters: RequestParams {
        switch self {
        case .getNowPlaying(let request):
                return .query(request)
    }
}



