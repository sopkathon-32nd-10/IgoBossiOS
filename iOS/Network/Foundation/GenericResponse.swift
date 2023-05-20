//
//  GenericResponse.swift
//  iOS
//
//  Created by 류희재 on 2023/05/20.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
    var code: Int?
    var message: String?
    var data: T?
}

