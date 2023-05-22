//
//  CheckViewController.swift
//  iOS
//
//  Created by 류희재 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

import SafariServices

final class CheckViewController: BaseViewController {
    
    
    private var checkData: CheckResponse?
    
    var myAllCount = 0
    
    
    private let checkListLabel = UILabel()
    private let checkListContent = UILabel()
    private let achievementText = UILabel()
    public let achievementPercent = UILabel()
    private let achievementRate = UIImageView()
    private let myAchievementRate = UIImageView()
    
    private let myFooterView = UIView()
    private let websiteButton = UIButton()
    
    private let checkTableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestCheckAPI()
    }
    override func setUI() {
        view.backgroundColor = .white
        
        checkListLabel.do {
            $0.text = "근로기준\n체크리스트"
            $0.numberOfLines = 2
            $0.textColor = .soptGrey600
            $0.font = .soptHeadLine1
        }
        
        checkListContent.do {
            $0.text = "원활한 근로를 위해 필요한 준비물들을 체크해보세요"
            $0.textColor = .soptGrey500
            $0.font = .soptBody3
        }
        
        achievementText.do {
            $0.text = "달성률"
            $0.textColor = .soptGrey600
            $0.font = .soptHeadLine2
        }
        
        achievementPercent.do {
            $0.text = "0%"
            $0.textColor = .soptYellow500
            $0.font = .soptHeadLine2
        }
        
        achievementRate.do {
            $0.image = Image.achievementRate
        }
        
        myAchievementRate.do {
            $0.image = Image.myAchievementRate
            $0.contentMode = .left
            $0.makeCornerRadius(ratio: 10)
        }
        
        checkTableView.do {
            $0.separatorStyle = .none
            $0.backgroundColor = .white
            $0.register(CheckTableViewCell.self, forCellReuseIdentifier: CheckTableViewCell.identifier)
            $0.showsVerticalScrollIndicator = false
            $0.delegate = self
            $0.dataSource = self
        }
        
        myFooterView.do {
            $0.backgroundColor = .white
        }
        
        websiteButton.do {
            $0.backgroundColor = .soptYellow500
            $0.setTitle("자세히 보기", for: .normal)
            $0.titleLabel?.textColor = .soptGrey100
            $0.titleLabel?.font = .soptTitle1
            $0.makeCornerRadius(ratio: 10)
            $0.addTarget(self, action: #selector(websiteButtonClicked), for: .touchUpInside)
        }
        
    }
    
    override func setLayout() {
        view.addSubviews(checkListLabel,
                         checkListContent,
                         achievementText,
                         achievementPercent,
                         achievementRate,
                         myAchievementRate,
                         checkTableView)
        
        myFooterView.addSubview(websiteButton)
        
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
        
        achievementPercent.snp.makeConstraints {
            $0.centerY.equalTo(achievementText)
            $0.leading.equalTo(achievementText.snp.trailing).offset(10)
        }
        
        achievementRate.snp.makeConstraints {
            $0.top.equalTo(achievementText.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(24)
        }
        
        checkTableView.snp.makeConstraints {
            $0.top.equalTo(achievementRate.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(36)
            $0.bottom.equalToSuperview()
        }
        
        websiteButton.snp.makeConstraints {
            $0.height.equalTo(46)
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    @objc
    func websiteButtonClicked() {
        let url = "https://darkened-cobbler-e17.notion.site/4073508e7c6d4f78925c26d70ecdbf0b"
        let safariViewController = SFSafariViewController(url: URL(string: url)!)
        safariViewController.modalPresentationStyle = .fullScreen
        self.present(safariViewController, animated: true)
    }
    
    func requestCheckAPI() {
        CheckAPI.shared.getCheck(completion: { result in
            guard let result = self.validateResult(result) as? CheckResponse else {
                print("🍎🍎🍎🍎🍎🍎🍎🍎")
                return
            }
            print("🍏🍏🍏🍏🍏🍏🍏")
            self.checkData = result
            self.achievementPercent.text = "\(result.progress)%"
            self.checkTableView.reloadData()
            self.myAllCount = result.progress / 10
        })
    }
}

extension CheckViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.checkData?.checkListData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CheckTableViewCell.identifier, for: indexPath) as? CheckTableViewCell else
        {return UITableViewCell()}
        
        cell.configureCell(checkData?.checkListData[indexPath.row] ?? CheckListDatum(id: nil, status: nil, detail: nil))
        cell.delegate = self
        //            self.dummy[indexPath.row].checkTapped.toggle()
        //            if self.dummy[indexPath.row].checkTapped {
        //                self.myAllCount = self.myAllCount + 1
        //            } else {
        //                self.myAllCount = self.myAllCount - 1
        //            }
        
        self.myAchievementRate.snp.remakeConstraints {
            $0.top.equalTo(self.achievementRate)
            $0.leading.equalTo(self.achievementRate)
            $0.height.equalTo(24)
            $0.width.equalTo(self.myAllCount * 30)
        }
        self.achievementPercent.do {
            $0.text = String(self.myAllCount * 10) + "%"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return myFooterView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 100
        } else {
            return 0
        }
    }
}

extension CheckViewController: CheckButtonDidTap {
    func patchCheckStatus(id: Int, status: Bool) {
        print("⚙️⚙️⚙️⚙️⚙️⚙️⚙️")
        print(id, status)
        CheckAPI.shared.patchCheck(query: CheckRequest(userId: 1), body: Check(checkId: id, status: !status), completion: { _ in
            print("🍏🍏🍏🍏🍏🍏🍏")
            self.requestCheckAPI()
        })
    }
}
