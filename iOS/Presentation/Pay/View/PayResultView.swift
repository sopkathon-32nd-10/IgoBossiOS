//
//  PayResult.swift
//  iOS
//
//  Created by 남유진 on 2023/05/21.
//

import UIKit

class PayResultView: UIView {

    private let resultView = UIView().then {
        $0.backgroundColor = .soptGrey100
        $0.layer.cornerRadius = 5
    }
    
    private let personImage = UIView().then {
        $0.backgroundColor = .soptGrey200
    }
//    private let resultImageView = UIImageView().then {
//
//    }

//    private let sectionView = UIView()
    
    private let timeTitle = UILabel().then {
        $0.text = "근로시간"
        $0.font = UIFont.soptTitle2
        $0.textColor = UIColor.soptGrey500
    }
    
    private let timeLabel = UILabel().then {
        $0.layer.backgroundColor = UIColor.soptGrey200.cgColor
    }
    
    private let timeunitLabel = UILabel().then {
        $0.text = "시간"
        $0.font = UIFont.soptTitle2
        $0.textColor = UIColor.soptGrey500
    }
    
    private let priceTitle = UILabel().then {
        $0.text = "환산한 시급"
        $0.font = UIFont.soptTitle2
        $0.textColor = UIColor.soptGrey500
    }
    
    private let priceLabel = UILabel().then {
        $0.layer.backgroundColor = UIColor.soptGrey200.cgColor
    }
    
    private let priceunitLabel = UILabel().then {
        $0.text = "원"
        $0.font = UIFont.soptTitle2
        $0.textColor = UIColor.soptGrey500
    }
    
    private let explainView = UIView().then {
        $0.backgroundColor = UIColor.soptGrey200
    }
    
    private var helpButton = UIButton().then {
        $0.backgroundColor = .soptGrey300
        $0.setTitle("도움받기", for: .normal)
        $0.titleLabel?.font = .soptTitle2
        $0.setTitleColor(UIColor.white, for: .normal) ///원래 000이었던 것
        $0.layer.cornerRadius = 5
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        
        addSubview(resultView)
        
        resultView.addSubviews(personImage, timeTitle, timeLabel, timeunitLabel, priceTitle, priceLabel, priceunitLabel, explainView, helpButton)
        
        resultView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(262)
            $0.height.equalTo(444)
        }
        
        personImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(76)
            $0.width.height.equalTo(90)
        }
        
        timeTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(67)
            $0.top.equalTo(personImage.snp.bottom).offset(33)
        }

        timeLabel.snp.makeConstraints {
            $0.leading.equalTo(timeTitle.snp.trailing).offset(6)
            $0.top.equalTo(timeTitle.snp.top)
            $0.width.equalTo(84)
            $0.height.equalTo(20)
        }
        
        timeunitLabel.snp.makeConstraints {
            $0.top.equalTo(timeTitle.snp.top)
            $0.leading.equalTo(timeLabel.snp.trailing).offset(6)
        }
        
        priceTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(67)
            $0.top.equalTo(timeTitle.snp.bottom).offset(29)
        }
        
        priceLabel.snp.makeConstraints {
            $0.leading.equalTo(priceTitle.snp.trailing).offset(6)
            $0.top.equalTo(priceTitle.snp.top)
            $0.width.equalTo(84)
            $0.height.equalTo(20)
        }
        
        priceunitLabel.snp.makeConstraints {
            $0.top.equalTo(priceTitle.snp.top)
            $0.leading.equalTo(priceLabel.snp.trailing).offset(4)
        }
        
        explainView.snp.makeConstraints {
            $0.top.equalTo(priceTitle.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(66)
        }
        
        helpButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(24)
            $0.width.equalTo(108)
            $0.height.equalTo(30)
        }
    }
    
    
}
