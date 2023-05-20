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
    
    private let checkTableView = UITableView()
    
    override func setUI() {
        view.backgroundColor = .white
        checkTableView.do {
            $0.separatorStyle = .none
            $0.backgroundColor = .soptGrey200
            $0.register(CheckTableViewCell.self, forCellReuseIdentifier: CheckTableViewCell.identifier)
            $0.separatorStyle = .none
            $0.delegate = self
            $0.dataSource = self
        }
        
    }
    
    override func setLayout() {
        view.addSubviews(checkTableView)
        checkTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.leading.trailing.bottom.equalToSuperview()
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
}
