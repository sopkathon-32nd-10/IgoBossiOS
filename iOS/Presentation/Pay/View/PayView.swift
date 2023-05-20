//
//  PayView.swift
//  iOS
//
//  Created by 류희재 on 2023/05/21.
//

import UIKit

import SnapKit
import Then

class PayView: UIView {

    //MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let payTitleLabel = UILabel()
    public let payTextField = UITextField()
    private let workTimeLabel = UILabel()
    public let workTimeTextField = UITextField()
    private let workDayLabel = UILabel()
    public let workDayTextField = UITextField()
    public lazy var calculateButton = UIButton()
    

    //MARK: - Life Cycles

    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        hierarchy()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Custom Method

    private func style() {
        self.do {
            $0.backgroundColor = .soptWhite
        }
        titleLabel.do {
            $0.text = "근로기준 \n적합도 계산기"
            $0.textColor = .soptGrey500
            $0.font = .soptHeadLine1
            $0.numberOfLines = 2
            $0.textAlignment = .left
        }
        
        subTitleLabel.do {
            $0.text = "적합한 임금과 근무시간인지 확인해드릴게요."
            $0.textColor = .soptGrey500
            $0.font = .soptBody3
            $0.textAlignment = .left
        }
        
        payTitleLabel.do {
            $0.text = "월급 입력"
            $0.textColor = .soptGrey500
            $0.font = .soptTitle2
            $0.textAlignment = .left
        }
        
        payTextField.do {
            $0.placeholder = "원"
            $0.attributedPlaceholder = NSAttributedString(string: "원", attributes: [NSAttributedString.Key.foregroundColor : UIColor.soptGrey400])
            $0.backgroundColor = .soptGrey000
            $0.textColor = .soptGrey600
            $0.makeCornerRadius(ratio: 10)
            $0.addLeftPadding(inset: 18)
            $0.makeCornerBorder(borderWidth: 1, borderColor: .soptGrey300)
        }
        
        workTimeLabel.do {
            $0.text = "하루 근무 시간"
            $0.textColor = .soptGrey500
            $0.font = .soptTitle2
            $0.textAlignment = .left
        }
        
        workTimeTextField.do {
            $0.placeholder = "시간"
            $0.attributedPlaceholder = NSAttributedString(string: "시간", attributes: [NSAttributedString.Key.foregroundColor : UIColor.soptGrey400])
            $0.backgroundColor = .soptGrey000
            $0.textColor = .soptGrey600
            $0.makeCornerRadius(ratio: 10)
            $0.addLeftPadding(inset: 18)
            $0.makeCornerBorder(borderWidth: 1, borderColor: .soptGrey300)
        }
        
        workDayLabel.do {
            $0.text = "한달 근무 일수"
            $0.textColor = .soptGrey500
            $0.font = .soptTitle2
            $0.textAlignment = .left
        }
        
        workDayTextField.do {
            $0.placeholder = "일"
            $0.attributedPlaceholder = NSAttributedString(string: "일", attributes: [NSAttributedString.Key.foregroundColor : UIColor.soptGrey400])
            $0.backgroundColor = .soptGrey000
            $0.makeCornerRadius(ratio: 10)
            $0.addLeftPadding(inset: 18)
            $0.makeCornerBorder(borderWidth: 1, borderColor: .soptGrey300)
        }
        
        calculateButton.do {
            $0.setTitle("계산하기", for: .normal)
            $0.setTitleColor(.soptGrey300, for: .normal)
            $0.backgroundColor = .soptGrey100
            $0.makeCornerRadius(ratio: 10)
        }
    }
    
    private func hierarchy() {
        self.addSubviews(
            titleLabel,
            subTitleLabel,
            payTitleLabel,
            payTextField,
            workTimeLabel,
            workTimeTextField,
            workDayLabel,
            workDayTextField,
            calculateButton
        )
    }

    private func layout() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(36)
            $0.top.equalToSuperview().offset(91)
        }
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(36)
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(9)
        }
        payTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(36)
            $0.top.equalTo(self.subTitleLabel.snp.bottom).offset(32)
        }
        payTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(36)
            $0.top.equalTo(self.payTitleLabel.snp.bottom).offset(9)
            $0.width.equalTo(303)
            $0.height.equalTo(46)
        }
        workTimeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(36)
            $0.top.equalTo(self.payTextField.snp.bottom).offset(20)
        }
        workTimeTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(36)
            $0.top.equalTo(self.workTimeLabel.snp.bottom).offset(9)
            $0.width.equalTo(303)
            $0.height.equalTo(46)
        }
        workDayLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(36)
            $0.top.equalTo(self.workTimeTextField.snp.bottom).offset(20)
        }
        workDayTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(36)
            $0.top.equalTo(self.workDayLabel.snp.bottom).offset(9)
            $0.width.equalTo(303)
            $0.height.equalTo(46)
        }
        calculateButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(36)
            $0.top.equalTo(self.workDayTextField.snp.bottom).offset(142)
            $0.width.equalTo(303)
            $0.height.equalTo(46)
        }
    }
}


