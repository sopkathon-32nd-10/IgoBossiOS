//
//  CheckModel.swift
//  iOS
//
//  Created by 류희재 on 2023/05/21.
//

import UIKit

struct CheckRequest: Codable {
    let userId: Int
}

// MARK: - CheckResponse
struct CheckResponse: Codable {
    let progress: Int
    let checkListData: [CheckListDatum]
}

// MARK: - CheckListDatum
struct CheckListDatum: Codable {
    let id: Int
    let status: Bool
    let detail: Detail
}

// MARK: - Detail
struct Detail: Codable {
    let checkID: Int
    let title, content: String

    enum CodingKeys: String, CodingKey {
        case checkID = "checkId"
        case title, content
    }
}
