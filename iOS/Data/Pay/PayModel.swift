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
    let stdResult: Bool
    let workingHoursStd: Bool
    let workingHours: Int
    let wageStd: Bool
    let wage: Int
}
