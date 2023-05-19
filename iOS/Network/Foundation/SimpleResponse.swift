//
//  SimpleResponse.swift
//  iOS
//
//  Created by 류희재 on 2023/05/20.
//

import Foundation

struct SimpleResponse: Codable {
    var status: Int
    var success: Bool
    var message: String?
}

