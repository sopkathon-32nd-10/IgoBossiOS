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
    
    private let icon = UIImageView()
    private let squareView = UIView()
    private let squareView2 = UIView()
    private let squareView3 = UIView()
//    private lazy var bannerLabel = UILabel()
    public let workingStatus = UIButton()
    public lazy var name = UILabel()
    public lazy var birthday = UILabel()
    public lazy var country = UILabel()
    private let at = UILabel()
    private let ing = UILabel()
    public let circleImg = UIImageView()
    
    public let label1 = UILabel()
    private let label2 = UILabel()
    private let label3 = UILabel()
    
    public let place = UILabel()
    public let time = UILabel()

    public let realname = UILabel()
    
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
        icon.do {
            $0.image = Image.smallLogo
        }
        squareView.do {
            $0.backgroundColor = UIColor.soptWhite
            $0.layer.shadowColor = UIColor.black.cgColor // 검정색 사용
            $0.layer.masksToBounds = false
            $0.layer.shadowOffset = CGSize(width: 0, height: 4) // 반경에 대해서 너무 적용이 되어서 4point 정도 ㅐ림.
            $0.layer.shadowRadius = 8 // 반경?
            $0.layer.shadowOpacity = 0.3 // alpha값입니다.
            $0.makeCornerRadius(ratio: 15)
        }
        squareView2.do {
            $0.backgroundColor = UIColor.soptYellow100
        }
        squareView3.do {
            $0.backgroundColor = UIColor.soptWhite
            $0.makeCornerRadius(ratio: 10)

//            $0.layer.cornerRadius = $0.frame.width / 2
//            $0.clipsToBounds = true
        }
//        bannerLabel.do {
//            $0.text = "오스틴 님의 근무 현황 바로보기"
//            $0.textColor = .white
//            $0.font = UIFont.boldSystemFont(ofSize: 20)
//        }
        workingStatus.do {
            //$0.font = UIFont.boldSystemFont(ofSize: 20)
            //   $0.font = UIFont.preferredFont(forTextStyle: 20)
            $0.setTitle("근무중", for: .normal)
            $0.setTitleColor(UIColor.soptGrey500, for: .normal)
            //  $0.titleLabel?.font = .tvingBold(ofSize: 24)
            $0.backgroundColor = .soptYellow300
            $0.makeCornerRadius(ratio: 5)
            $0.titleLabel?.font = .soptBody3
            //   $0.layer.borderColor = UIColor.color2E2E2E.cgColor
        }
        name.do {
            $0.text = "부창현"
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 20)
        }
        realname.do{
            $0.textColor = .soptGrey600
            $0.font = UIFont.soptHeadLine1
        }
        birthday.do {
            $0.textColor = .soptGrey500
            $0.font = UIFont.soptTitle2
        }
        country.do {
            $0.textColor = .soptGrey500
            $0.font = UIFont.soptTitle2
        }
        at.do {
            $0.text = "에서"
            $0.textColor = .soptGrey600
            $0.font = UIFont.soptBody3
        }
        ing.do {
            $0.text = "근무중"
            $0.textColor = .soptGrey600
            $0.font = UIFont.soptBody3
        }
        circleImg.do {
            $0.backgroundColor = .soptWhite
            $0.makeCornerRadius(ratio: 50)
        }
        
        label1.do {
            $0.textColor = .soptWhite
            $0.font = UIFont.soptHeadLine1
        }
        
//        label2.do {
//            $0.text = "님의"
//            $0.textColor = .soptWhite
//            $0.font = UIFont.soptHeadLine1
//
//        }
        
        label3.do {
            $0.text = "근무 현황 바로보기"
            $0.textColor = .soptWhite
            $0.font = UIFont.soptHeadLine1
        }
        
        place.do {
            $0.textColor = .soptGrey600
            $0.font = UIFont.soptTitle2
        }
        time.do {
            $0.textColor = .soptGrey600
            $0.font = UIFont.soptTitle2
        }
    }
    
    private func hierarchy() {
        self.addSubviews(
            squareView, icon, label1 , label3
        )
        squareView.addSubviews(
             workingStatus, name,  circleImg, squareView2,squareView3
        )
        squareView2.addSubviews(
            realname, birthday ,country
        )
        squareView3.addSubviews(
        place, time, at, ing
        )
        
    }
    
    private func layout() {
        
        realname.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(26)
            $0.top.equalToSuperview().inset(34)
        }
        icon.snp.makeConstraints {
            $0.width.height.equalTo(38)
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(53)
        }
        
        squareView.snp.makeConstraints {
            $0.width.equalTo(262)
            $0.height.equalTo(444)
            $0.centerX.centerY.equalToSuperview()
        }
        
        squareView2.snp.makeConstraints {
            $0.width.equalTo(262)
            $0.height.equalTo(240)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        squareView3.snp.makeConstraints {
            $0.width.equalTo(210)
            $0.height.equalTo(59)
            $0.leading.equalToSuperview().inset(26)
            $0.bottom.equalToSuperview().inset(22)
        }
        
        //        squareView.snp.makeConstraints {
        //            $0.width.equalTo(262)
        //            $0.height.equalTo(444)
        //            $0.centerX.centerY.equalToSuperview()
        //        }
//        bannerLabel.snp.makeConstraints {
//            //            $0.centerX.equalToSuperview()
//            //            $0.bottom.equalTo(squareView.snp.top).offset(10)
//            //            $0.leading.equalToSuperview().offset(30)
//            //            $0.height.equalTo(70)
//            $0.bottom.equalTo(squareView.snp.top).offset(-15)
//        }
        workingStatus.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(50)
            $0.height.equalTo(18)
            $0.top.equalToSuperview().inset(20)
        }
        name.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-87)
            $0.top.equalToSuperview().offset(62)
        }
        birthday.snp.makeConstraints {
            $0.leading.equalTo(realname)
            $0.top.equalTo(realname.snp.bottom).offset(18)
        }
        country.snp.makeConstraints {
            $0.leading.equalTo(realname)
            $0.top.equalTo(birthday.snp.bottom).offset(5)
        }
        at.snp.makeConstraints {
            $0.bottom.equalTo(place)
            $0.leading.equalTo(place.snp.trailing).offset(5)
        }
        ing.snp.makeConstraints {
            $0.leading.equalTo(time.snp.trailing).offset(5)
            //$0.centerX.equalTo(place)
            $0.bottom.equalTo(time)
        }
        
        circleImg.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.leading.equalToSuperview().offset(26)
            $0.top.equalToSuperview().inset(86)
        }
        
        label1.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(57)
            $0.top.equalToSuperview().offset(110)
            
        }
//        label2.snp.makeConstraints{
//
//        }
        label3.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(57)
            $0.bottom.equalTo(squareView.snp.top).offset(-15)
        }
        
        place.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(12)
            $0.top.equalToSuperview().offset(9)
        }
        time.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(12)
            $0.top.equalToSuperview().offset(29)
        }
    }
}
