//
//  PayAPI.swift
//  iOS
//
//  Created by 류희재 on 2023/05/21.
//

import Foundation

import Alamofire

class PayAPI: BaseAPI {
    static let shared = PayAPI()

    private override init() {}
}

extension PayAPI{
    
    public func postPayInfo(request: PayRequest, completion: @escaping (NetworkResult<Any>) -> Void) {
        AFManager.request(HomeService.getUserInfo).responseData { response in
            self.disposeNetwork(response,
                                dataModel: PayResponse.self,
                                completion: completion)
        }
    }
}


