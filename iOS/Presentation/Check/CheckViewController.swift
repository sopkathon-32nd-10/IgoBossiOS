//
//  CheckViewController.swift
//  iOS
//
//  Created by 류희재 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

final class CheckViewController: BaseViewController {
    
    private let dummy = Check.dummy()
    
    private let checkListLabel = UILabel()
    private let checkListContent = UILabel()
    private let achievementText = UILabel()
    private let achievementRate = UIView()
    private let websiteButton = UIButton()
    
    private let checkTableView = UITableView()
    
    override func setUI() {
        view.backgroundColor = .white
        
        checkListLabel.do {
            $0.text = "근로기준\n체크리스트"
            $0.numberOfLines = 2
            $0.textColor = .soptGrey400
            $0.font = .soptHeadLine1
        }
        
        checkListContent.do {
            $0.text = "원활한 근로를 위해 필요한 준비물들을 체크해보세요"
            $0.textColor = .soptGrey400
            $0.font = .soptBody3
        }
        
        achievementText.do {
            $0.text = "달성률 70%"
            $0.textColor = .soptGrey400
            $0.font = .soptHeadLine2
        }
        
        achievementRate.do {
            $0.backgroundColor = .soptGrey100
        }
        
        checkTableView.do {
            $0.separatorStyle = .none
            $0.backgroundColor = .white
            $0.register(CheckTableViewCell.self, forCellReuseIdentifier: CheckTableViewCell.identifier)
            $0.showsVerticalScrollIndicator = false
            $0.delegate = self
            $0.dataSource = self
        }
        
    }
    
    override func setLayout() {
        view.addSubviews(checkListLabel,
                         checkListContent,
                         achievementText,
                         achievementRate,
                         checkTableView)
        
        checkListLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(91)
            $0.leading.equalToSuperview().inset(36)
        }
        
        checkListContent.snp.makeConstraints {
            $0.top.equalTo(checkListLabel.snp.bottom).offset(9)
            $0.leading.equalToSuperview().inset(36)
        }
        
        achievementText.snp.makeConstraints {
            $0.top.equalTo(checkListLabel.snp.bottom).offset(47)
            $0.leading.equalToSuperview().inset(36)
        }
        
        achievementRate.snp.makeConstraints {
            $0.top.equalTo(achievementText.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(36)
            $0.height.equalTo(24)
        }
        
        
        checkTableView.snp.makeConstraints {
            $0.top.equalTo(achievementRate.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(36)
            $0.bottom.equalToSuperview()
        }
    }

}

extension CheckViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CheckTableViewCell.identifier, for: indexPath) as? CheckTableViewCell else
        {return UITableViewCell()}
        cell.configureCell(dummy[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return myFooterView
    }
}
