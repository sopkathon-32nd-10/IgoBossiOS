//
//  Check.swift
//  iOS
//
//  Created by 변희주 on 2023/05/20.
//

import UIKit

struct Check {
    let checkBoxButton: String
    let title: String
    let content: String
    var checkTapped: Bool
}

extension Check {
    static func dummy() -> [Check] {
        return [Check(checkBoxButton: "", title: "외국인근로자 고용허가기간 신청서", content: "일하고자 하는 회사가 외국인을 채용할 수 있는지\n 확인할 때 필요해요.", checkTapped: false),
                Check(checkBoxButton: "", title: "근로계약서", content: "회사에서 일하기 전에 근로 조건에 대해 회사와 함께\n 작성하는 문서에요.", checkTapped: false),
                Check(checkBoxButton: "", title: "여권 사본", content: "외국을 방문하는 국민에게 정부가 발행하는\n 증명서류에요.", checkTapped: false),
                Check(checkBoxButton: "", title: "건강진단결과서 (보건증)", content: "보건위생에 문제가 없다는 것을 증명하는 서류에요.", checkTapped: false),
                Check(checkBoxButton: "", title: "출국만기보험", content: "1년 이상 근무한 외국인의 이직, 출국 시 지급할\n 퇴직금 적립 보험이에요.", checkTapped: false),
                Check(checkBoxButton: "", title: "보증보험", content: "돈을 빌리고 갚지 않았을 때 돈 빌려준 사람의 손해를\n 줄이는 보험이에요.", checkTapped: false),
                Check(checkBoxButton: "", title: "귀국비용보험", content: "외국인 근로자가 귀국 시 필요한 비용을 충당하기 위해\n 외국인이 가입해야 하는 보험이에요.", checkTapped: false),
                Check(checkBoxButton: "", title: "상해보험", content: "급격하고도 우연한 사고로 신체에 상해를 입었을 경우\n 소정의 보험금을 지급하는 보험이에요.", checkTapped: false),
                Check(checkBoxButton: "", title: "통장 사본", content: "은행에서 돈을 예금한 사람에게 출납의 상태를\n 적어 주는 장부에요.", checkTapped: false),
                Check(checkBoxButton: "", title: "외국인 등록증 사본", content: "외국인 신분을 보장하기 위해 출입국관리사무소에서\n 등록절차를 통해 발급하는 문서에요.", checkTapped: false)]}
}
