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
        // Do any additional setup after loading the view.
    }


}
