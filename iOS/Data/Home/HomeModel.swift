//
//  HomeModel.swift
//  iOS
//
//  Created by 류희재 on 2023/05/21.
//

import UIKit

struct HomeRequest: Codable {
    let userID: Int
}

struct HomeResponse: Codable {
    let name: String
    let birth: String
    let nationality: String
    let profileImg: String
    let workspace: String
    let workingMonths: Int
}
