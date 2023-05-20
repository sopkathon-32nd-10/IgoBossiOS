//
//  PayResultView.swift
//  iOS
//
//  Created by 남유진 on 2023/05/21.
//

import UIKit

class PayResultView: UIView {

    private let resultView = UIView().then {
        $0.backgroundColor = .soptWhite
        $0.layer.cornerRadius = 10
    }
    
    public var backButton = UIButton().then {
        $0.setImage(UIImage(named: "btn_cancel"), for: .normal)
    }
    
    public let resultImageView = UIImageView().then {
        $0.image = UIImage(named: "logo")
    }
    
    public let warningImage = UIImageView()
    
    public let timeTitle = UILabel().then {
        $0.text = "근로시간"
        $0.font = UIFont.soptTitle2
        $0.textColor = UIColor.soptGrey500
    }

    public let timeLabel = UILabel().then {
        $0.text = "9"
        $0.font = UIFont.soptHeadLine2
        $0.textColor = UIColor.soptGrey600
    }

    private let timeunitLabel = UILabel().then {
        $0.text = "시간"
        $0.font = UIFont.soptTitle2
        $0.textColor = UIColor.soptGrey500
    }

    public let priceTitle = UILabel().then {
        $0.text = "환산한 시급"
        $0.font = UIFont.soptTitle2
        $0.textColor = UIColor.soptGrey500
    }
    
    public let warningImage2 = UIImageView()

    public let priceLabel = UILabel().then {
        $0.text = "8333"
        $0.font = UIFont.soptHeadLine2
        $0.textColor = UIColor.soptGrey600
    }

    private let priceunitLabel = UILabel().then {
        $0.text = "원"
        $0.font = UIFont.soptTitle2
        $0.textColor = UIColor.soptGrey500
    }

    private let explainView = UIView().then {
        $0.backgroundColor = UIColor.soptGrey100
        $0.layer.cornerRadius = 5
    }
    
    private let explainLabel = UILabel().then {
        $0.text = "복리후생비 및 시간외 근로수당 등은\n반영되지 않은 금액이며 규정에 따라\n주휴수당도 다르기 때문에 실제\n주급/월급과는 차이가 있습니다."
        $0.textAlignment = .center
        $0.font = UIFont.soptBody3
        $0.textColor = UIColor.soptGrey400
        $0.numberOfLines = 4
    }

    private var helpButton = UIButton().then {
        $0.backgroundColor = .soptYellow500
        $0.setTitle("도움받기", for: .normal)
        $0.titleLabel?.font = .soptTitle2
        $0.setTitleColor(UIColor.soptWhite, for: .normal)
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

        resultView.addSubviews(backButton, resultImageView, timeTitle, timeLabel, timeunitLabel, warningImage, warningImage2, priceTitle, priceLabel, priceunitLabel, explainView, helpButton)
        
        explainView.addSubview(explainLabel)

        resultView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(262)
            $0.height.equalTo(444)
        }

        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-18)
            $0.width.height.equalTo(18)
        }
        
        resultImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(76)
            $0.width.height.equalTo(61)
        }

        timeTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(86)
            $0.top.equalTo(resultImageView.snp.bottom).offset(41)
        }

        timeLabel.snp.makeConstraints {
            $0.leading.equalTo(timeTitle.snp.trailing).offset(10)
            $0.top.equalTo(resultImageView.snp.bottom).offset(36)
        }

        timeunitLabel.snp.makeConstraints {
            $0.top.equalTo(timeTitle.snp.top)
            $0.leading.equalTo(timeLabel.snp.trailing).offset(2)
        }
        
        warningImage.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.top.equalTo(priceTitle)
            $0.trailing.equalTo(priceTitle.snp.leading).offset(-5)
        }

        priceTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(67)
            $0.top.equalTo(timeTitle.snp.bottom).offset(29)
        }

        priceLabel.snp.makeConstraints {
            $0.leading.equalTo(priceTitle.snp.trailing).offset(10)
            $0.centerY.equalTo(priceTitle)
        }

        priceunitLabel.snp.makeConstraints {
            $0.top.equalTo(priceTitle.snp.top)
            $0.leading.equalTo(priceLabel.snp.trailing).offset(2)
        }

        explainView.snp.makeConstraints {
            $0.top.equalTo(priceTitle.snp.bottom).offset(35)
            $0.leading.trailing.equalToSuperview().inset(23)
            $0.height.equalTo(91)
        }
        
        explainLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        helpButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(24)
            $0.leading.trailing.equalToSuperview().inset(23)
            $0.height.equalTo(30)
        }
        
        warningImage2.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.centerY.equalTo(self.timeLabel)
            $0.leading.equalToSuperview().offset(60)
        }
    }


}
