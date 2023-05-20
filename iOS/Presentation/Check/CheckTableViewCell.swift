//
//  CheckTableViewCell.swift
//  iOS
//
//  Created by 변희주 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

class CheckTableViewCell: UITableViewCell {
    
    static let identifier = "CheckTableViewCell"

    private let checkBoxButton = UIButton()
    private let checkListTitle = UILabel()
    private let checkListContent = UILabel()
    private let websiteButton = UIButton()
    
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
            $0.titleLabel?.textColor = .soptGrey500
        }
        
        checkListTitle.do{
            $0.textColor = .soptGrey500
        }
        
        checkListContent.do {
            $0.textColor = .soptGrey500
        }
        
        websiteButton.do {
            $0.titleLabel?.textColor = .soptGrey500
        }
        
    }
    
    func setLayout() {
        
    }

}
