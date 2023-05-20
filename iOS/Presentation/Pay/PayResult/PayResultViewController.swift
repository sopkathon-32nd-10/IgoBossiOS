//
//  PayResultViewController.swift
//  iOS
//
//  Created by 남유진 on 2023/05/21.
//

import UIKit

class PayResultViewController: UIViewController {

    let testView = PayResultView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
    }
}

private extension PayResultViewController {
    func setUI() {
        view.backgroundColor = UIColor.clear
    }

    func setLayout() {
        view.addSubview(testView)
        testView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(700)
        }
    }
}
