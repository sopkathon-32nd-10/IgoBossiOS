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
    private var payInfo: PayResponse?
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        target()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dismissKeyboardWhenTappedAround()
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
        textField.backgroundColor = .soptYellow100
        textField.makeCornerBorder(borderWidth: 1, borderColor: .soptYellow300)
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
            
            rootView.calculateButton.backgroundColor = .soptYellow500
            rootView.calculateButton.setTitleColor(.soptWhite, for: .normal)
            rootView.calculateButton.isEnabled = true
        }
    }
    
    func requestPayAPI() {
        let monthOfWage = Int(rootView.payTextField.text ?? "")
        let workingHours = Int(rootView.workTimeTextField.text ?? "")
        let monthOfWorkingDays = Int(rootView.workDayTextField.text ?? "")
        
        PayAPI.shared.postPayInfo(request: PayRequest(monthOfWage: monthOfWage ?? 0, workingHours: workingHours ?? 0, monthOfWorkingDays: monthOfWorkingDays ?? 0), completion: { result in
            guard let result = self.validateResult(result) as? PayResponse else {
                print("🙏🙏🙏🙏🙏🙏🙏🙏🙏")
                return
                
            }
            self.payInfo = result
            self.presentToPayResultView()
        })
    }
    
    func presentToPayResultView() {
        let payResultViewController = PayResultViewController()
        payResultViewController.dataBind(pay: rootView.payTextField.text!, time: rootView.workTimeTextField.text!)
        payResultViewController.modalPresentationStyle = .formSheet
        self.present(payResultViewController, animated: true)
    }
}



