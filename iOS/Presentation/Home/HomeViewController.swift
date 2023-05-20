//
//  HomeView.swift
//  iOS
//
//  Created by 고영민 on 2023/05/21.
//

import UIKit
import SnapKit
import Then

final class HomeView : UIView {
    
    
    //MARK: - UI Components
    
    private let squareView = UIView()
    private lazy var bannerLabel = UILabel()
    private let workingStatus = UILabel()
    private lazy var name = UILabel()
    private lazy var birthday = UILabel()
    private lazy var country = UILabel()
    private let at = UILabel()
    private let ing = UILabel()
    private let circleImg = UIImageView()

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
        self.backgroundColor = .white
        
//        containerView.do {
//            $0.layer.shadowColor = UIColor.black.cgColor // 검정색 사용
//            $0.layer.masksToBounds = false
//            $0.layer.shadowOffset = CGSize(width: 0, height: 4) // 반경에 대해서 너무 적용이 되어서 4point 정도 ㅐ림.
//            $0.layer.shadowRadius = 8 // 반경?
//            $0.layer.shadowOpacity = 0.3 // alpha값입니다.
//        }
        squareView.do {
            $0.backgroundColor = UIColor.red
            $0.layer.shadowColor = UIColor.black.cgColor // 검정색 사용
            $0.layer.masksToBounds = false
            $0.layer.shadowOffset = CGSize(width: 0, height: 4) // 반경에 대해서 너무 적용이 되어서 4point 정도 ㅐ림.
            $0.layer.shadowRadius = 8 // 반경?
            $0.layer.shadowOpacity = 0.3 // alpha값입니다.
        }
        bannerLabel.do {
            $0.text = "십조님의 근무현황 바로보기"
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 20)
        }
        workingStatus.do {
            $0.text = "근무중"
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 20)
        }
        name.do {
            $0.text = "부창현"
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 20)
        }
        birthday.do {
            $0.text = "2000.01.01"
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 20)
        }
        country.do {
            $0.text = "한국(Korea)"
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 20)
        }
        at.do {
            $0.text = "에서"
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 20)
        }
        ing.do {
            $0.text = "째 근무중"
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 20)
        }
        circleImg.do {
            $0.backgroundColor = .systemBlue
            
        }
    }
    
    private func hierarchy() {
        self.addSubviews(
            squareView
        )
        squareView.addSubviews(
            bannerLabel, workingStatus, name, birthday, country, at, ing, circleImg
        )
        
    }
    
    private func layout() {
        
        squareView.snp.makeConstraints {
            $0.width.equalTo(262)
            $0.height.equalTo(444)
            $0.centerX.centerY.equalToSuperview()
        }
        
//        squareView.snp.makeConstraints {
//            $0.width.equalTo(262)
//            $0.height.equalTo(444)
//            $0.centerX.centerY.equalToSuperview()
//        }
        bannerLabel.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.bottom.equalTo(squareView.snp.top).offset(10)
//            $0.leading.equalToSuperview().offset(30)
//            $0.height.equalTo(70)
            $0.bottom.equalTo(squareView.snp.top).offset(-14)
        }
        workingStatus.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-19)
            $0.top.equalToSuperview().offset(12)
        }
        name.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-87)
            $0.top.equalToSuperview().offset(62)
        }
        birthday.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).offset(7)
            $0.trailing.equalToSuperview().offset(-50)
        }
        country.snp.makeConstraints {
            $0.top.equalTo(birthday.snp.bottom).offset(11)
            $0.trailing.equalToSuperview().offset(-47)
        }
        at.snp.makeConstraints {
            $0.top.equalTo(country.snp.bottom).offset(27)
            $0.trailing.equalToSuperview().offset(-84)
        }
        ing.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(72)
            $0.top.equalToSuperview().offset(225)
        }
        circleImg.snp.makeConstraints {
            $0.width.height.equalTo(80)
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(59)
        }
    }
}
