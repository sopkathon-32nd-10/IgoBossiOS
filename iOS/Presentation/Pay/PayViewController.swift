//
//  PayViewController.swift
//  iOS
//
//  Created by 류희재 on 2023/05/20.
//

import UIKit

class PayViewController: BaseViewController {
    
    //MARK: - Properties
    
    private let rootView = PayView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        target()
    }
    
    private func style() {
        self.view.backgroundColor = .soptWhite
    }
    
    private func target() {
        rootView.payTextField.delegate = self
        rootView.workTimeTextField.delegate = self
        rootView.workDayTextField.delegate = self
        
        rootView.calculateButton.addTarget(self, action: #selector(calculateButtonDidTap), for: .touchUpInside)
    }
    
    @objc func calculateButtonDidTap() {
        presentToPayResultView()
    }
    
}

extension PayViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .yellow
        textField.makeCornerBorder(borderWidth: 1, borderColor: .yellow)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = .soptGrey200
        textField.makeCornerBorder(borderWidth: 1, borderColor: .soptGrey200)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        calculate()
    }
}

extension PayViewController {
    func calculate() {
        if !rootView.payTextField.isEmpty() &&
            !rootView.workTimeTextField.isEmpty() &&
            !rootView.workDayTextField.isEmpty() {
            
            rootView.calculateButton.backgroundColor = .yellow
            rootView.calculateButton.isEnabled = true
        }
    }
    func presentToPayResultView() {
        let payResultViewController = PayResultViewController()
        payResultViewController.modalPresentationStyle = .formSheet
        self.present(payResultViewController, animated: true)
    }
}



