//
//  CheckTableViewCell.swift
//  iOS
//
//  Created by 변희주 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

protocol WebsiteButtonAction: AnyObject {
    func websiteButtonTapped(tag: Int)
}

final class CheckTableViewCell: UITableViewCell {
    
    static let identifier = "CheckTableViewCell"
    
    weak var delegate: WebsiteButtonAction?

    private let checkBoxButton = UIButton()
    private let checkListTitle = UILabel()
    private let checkListContent = UILabel()
    let websiteButton = UIButton()
    
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
        
        checkBoxButton.do{
            $0.setTitleColor(.soptGrey500, for: .normal)
        }
        
        checkListTitle.do{
            $0.textColor = .soptGrey500
        }
        
        checkListContent.do {
            $0.textColor = .soptGrey500
        }
        
        websiteButton.do {
            $0.setTitleColor(.soptGrey500, for: .normal)
            $0.addTarget(self, action: #selector(websiteButtonTapped), for: .touchUpInside)
        }
        
    }
    
    func setLayout() {
        contentView.addSubviews(checkBoxButton,
                                checkListTitle,
                                checkListContent,
                                websiteButton)
        
        checkBoxButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(30)
        }
        
        checkListTitle.snp.makeConstraints {
            $0.leading.equalTo(checkBoxButton.snp.trailing).offset(20)
            $0.top.equalToSuperview().inset(20)
        }
        
        checkListContent.snp.makeConstraints {
            $0.leading.equalTo(checkBoxButton.snp.trailing).offset(20)
            $0.top.equalTo(checkListTitle.snp.bottom).offset(5)
            $0.width.equalTo(200)
        }
        
        websiteButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(18)
            $0.centerY.equalTo(checkListContent)
        }
        
        
    }
    
    func configureCell(_ check: Check){
        checkBoxButton.setTitle(check.checkBoxButton, for: .normal)
        checkListTitle.text = check.title
        checkListContent.text = check.content
        websiteButton.setTitle(check.goWebsiteButton, for: .normal)
        
    }
    
    @objc
    func websiteButtonTapped(sender: UIButton) {
        delegate?.websiteButtonTapped(tag: sender.tag)
    }
    

}
