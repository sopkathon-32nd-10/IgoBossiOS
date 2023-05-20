//
//  PayResultViewController.swift
//  iOS
//
//  Created by 남유진 on 2023/05/21.
//

import UIKit

class PayResultViewController: UIViewController {

    let testView = PayResultView()
    var payTrue: Bool = true
    var timeTrue: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        target()
    }
    
    @objc func backButtonDidTap() {
        self.dismiss(animated: true)
    }
}
extension PayResultViewController {
    func target() {
        testView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
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
    
    public func dataBind(pay: String, time: String) {
        testView.priceLabel.text = pay
        testView.timeLabel.text = time

        if (Int(pay) ?? 0 < 10000) {
            testView.warningImage2.image = Image.warning
            self.payTrue = false
        }
        
        if (Int(time) ?? 0 > 8 ) {
            self.timeTrue = false
            testView.warningImage.image = Image.warning
        }
        
        if timeTrue {
            if payTrue {
                testView.resultImageView.image = Image.logo
            } else {
                testView.resultImageView.image = Image.littleSadLogo
            }
        } else {
            if payTrue {
                testView.resultImageView.image = Image.littleSadLogo
            } else {
                testView.resultImageView.image = Image.sadLogo
            }
        }
    }
}

