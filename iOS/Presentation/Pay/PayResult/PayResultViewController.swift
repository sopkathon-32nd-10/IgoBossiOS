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
    
    public func dataBind(_ payResult: PayResponse?) {
        guard let payResult = payResult else { return }
        testView.priceLabel.text = String(payResult.wage)
        testView.timeLabel.text = String(payResult.workingHours)
        
        if !payResult.wageStd {
            if !payResult.workingHoursStd {
                testView.warningImage2.image = Image.warning
                testView.warningImage.image = Image.warning
                testView.resultImageView.image = Image.sadLogo
            } else {
                testView.warningImage.image = Image.warning
                testView.resultImageView.image = Image.littleSadLogo
            }
        } else {
            if !payResult.workingHoursStd {
                testView.warningImage2.image = Image.warning
                testView.resultImageView.image = Image.littleSadLogo
            } else {
                testView.resultImageView.image = Image.logo
            }
        }
        
    }
}

