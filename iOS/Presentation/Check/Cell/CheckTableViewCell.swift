//
//  CheckTableViewCell.swift
//  iOS
//
//  Created by 변희주 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

final class CheckTableViewCell: UITableViewCell {
    
    var isTapped: Bool = false {
        didSet {
            tapped()
        }
    }
    
    var handler: (() -> (Void))?


    static let identifier = "CheckTableViewCell"
    
    private let backGround = UIView()
    
    private let checkBoxButton = UIButton()
    private let checkListTitle = UILabel()
    private let checkListContent = UILabel()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
      
        setStyle()
        setLayout()
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        selectionStyle = .none
        
        backGround.do {
            $0.backgroundColor = .soptGrey100
            $0.makeCornerRadius(ratio: 10)
        }
        
        checkBoxButton.do{
            $0.setTitleColor(.soptGrey500, for: .normal)
            $0.addTarget(self,
                         action: #selector(checkBoxButtonTapped),
                         for: .touchUpInside)
        }
        
        checkListTitle.do{
            $0.textColor = .soptGrey400
            $0.font = .soptTitle2
        }
        
        checkListContent.do {
            $0.textColor = .soptGrey400
            $0.font = .soptBody3
            $0.numberOfLines = 2
        }
        
    }
    
    func setLayout() {
        contentView.addSubview(backGround)
        backGround.addSubviews(checkBoxButton,
                                checkListTitle,
                                checkListContent)
        
        backGround.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(84)
        }
        
        checkBoxButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(10)
            $0.size.equalTo(24)
        }
        
        checkListTitle.snp.makeConstraints {
            $0.leading.equalTo(checkBoxButton.snp.trailing).offset(14)
            $0.centerY.equalTo(checkBoxButton)
        }
        
        checkListContent.snp.makeConstraints {
            $0.leading.equalTo(checkBoxButton.snp.trailing).offset(14)
            $0.top.equalTo(checkListTitle.snp.bottom).offset(9)
        }

    }
    
    func tapped() {
        checkBoxButton.setImage(isTapped ? Image.btnCheck : Image.btnUnCheck, for: .normal)
    }
    
    @objc
    func checkBoxButtonTapped() {
        handler?()
    }
    
    func configureCell(_ check: Check){
        checkBoxButton.setTitle(check.checkBoxButton, for: .normal)
        checkListTitle.text = check.title
        checkListContent.text = check.content
        isTapped = check.checkTapped
    }
    

}
