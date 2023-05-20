//
//  CheckAPI.swift
//  iOS
//
//  Created by 류희재 on 2023/05/21.
//

import Foundation

import Alamofire

class CheckAPI: BaseAPI {
    static let shared = CheckAPI()

    private override init() {}
}

extension CheckAPI{
    
    public func getCheck(completion: @escaping (NetworkResult<Any>) -> Void) {
        AFManager.request(CheckService.getCheck(CheckRequest(userId: 1))).responseData { response in
            self.disposeNetwork(response,
                                dataModel: CheckResponse.self,
                                completion: completion)
        }
    }
}



