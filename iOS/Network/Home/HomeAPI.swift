//
//  HomeAPI.swift
//  iOS
//
//  Created by 류희재 on 2023/05/21.
//

import Foundation

import Alamofire

class HomeAPI: BaseAPI {
    static let shared = HomeAPI()

    private override init() {}
}

extension HomeAPI{
    
    public func getUserInfo(completion: @escaping (NetworkResult<Any>) -> Void) {
        AFManager.request(HomeService.getUserInfo).responseData { response in
            self.disposeNetwork(response,
                                dataModel: HomeResponse.self,
                                completion: completion)
        }
    }
}

