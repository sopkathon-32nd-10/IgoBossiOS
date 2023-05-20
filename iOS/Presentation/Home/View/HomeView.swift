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
    
    public lazy var backButton = UIButton()
    private let containerView = UIView()
    private let squareView = UIView()
    
    
    
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
        
        containerView.do {
            $0.layer.shadowColor = UIColor.black.cgColor // 검정색 사용
            $0.layer.masksToBounds = false
            $0.layer.shadowOffset = CGSize(width: 0, height: 4) // 반경에 대해서 너무 적용이 되어서 4point 정도 ㅐ림.
            $0.layer.shadowRadius = 8 // 반경?
            $0.layer.shadowOpacity = 0.3 // alpha값입니다.
            
        }
        squareView.do {
            $0.backgroundColor = UIColor.red
        }
    }
    
    private func hierarchy() {
        self.addSubviews(
            containerView,
            squareView
        )
    }
    
    private func layout() {
        
        containerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        squareView.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.centerX.centerY.equalToSuperview()
        }
    }
}
