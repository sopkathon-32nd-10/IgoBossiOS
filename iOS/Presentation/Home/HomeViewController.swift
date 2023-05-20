//
//  HomeViewController.swift
//  iOS
//
//  Created by 류희재 on 2023/05/20.
//

import UIKit
import SnapKit
import Then


final class HomeViewController: BaseViewController {
    
    private let rootView = HomeView()
    
    // MARK: - App Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

