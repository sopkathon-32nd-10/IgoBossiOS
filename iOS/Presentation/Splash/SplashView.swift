//
//  SplashView.swift
//  iOS
//
//  Created by 류희재 on 2023/05/22.
//

import UIKit

import SnapKit
import Then

class SplashView: UIView {
    
    //MARK: - UI Components
    
    private let logoImage = UIImageView().then {
        $0.image = Image.logo
    }
    
    private let splashLabel = UILabel().then {
        $0.text = "사장님, 이제 저도 다 알아요"
        $0.font = .soptBody1
        $0.textAlignment = .left
        $0.textColor = .soptGrey400
    }
    
    
    //MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func hierarchy() {
        self.addSubviews(
            logoImage, splashLabel
        )
    }
    
    private func layout() {
        logoImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(241)
            $0.size.equalTo(148)
        }
        splashLabel.snp.makeConstraints {
            $0.top.equalTo(self.logoImage.snp.bottom).offset(17)
            $0.centerX.equalToSuperview()
        }
    }
}
