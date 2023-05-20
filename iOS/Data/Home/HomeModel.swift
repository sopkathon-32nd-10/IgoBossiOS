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
    var name: String?
    var birth: String?
    var nationality: String?
    var profileImg: String?
    var workspace: String?
    var workingMonths: Int?
}
