//
//  PayModel.swift
//  iOS
//
//  Created by 류희재 on 2023/05/21.
//

import UIKit

struct PayRequest: Codable {
    let monthOfWage: Int
    let workingHours: Int
    let monthOfWorkingDays: Int
}

struct PayResponse: Codable {
    let stdResult: String
    let workingHoursStd: String
    let workingHours: String
    let wageStd: String
    let wage: String
}
