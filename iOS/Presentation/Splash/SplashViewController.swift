//
//  SplashViewController.swift
//  iOS
//
//  Created by 류희재 on 2023/05/22.
//

import UIKit
import SnapKit
import Then

final class SplashViewController: BaseViewController {
    
    private let rootView = SplashView()
    
    
    // MARK: - App Life Cycle
    override func loadView() {
        self.view = rootView

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .soptWhite
        
        pushToTabbarController()
    }
}

extension SplashViewController {
    private func pushToTabbarController() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            let tabbarController = TabbarViewController()
            self.navigationController?.pushViewController(tabbarController, animated: true)
        }
    }
}
