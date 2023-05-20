//
//  TabbarViewController.swift
//  iOS
//
//  Created by 류희재 on 2023/05/20.
//

import UIKit

import SnapKit
import Then

class TabbarViewController: UITabBarController {
    
    
    //MARK: - Properties

    let homeViewController = HomeViewController()
    let payViewController = PayViewController()
    let checkViewController = CheckViewController()
    
    lazy var homeNavigationContrller = UINavigationController(rootViewController: homeViewController)
    lazy var payNavigationController = UINavigationController(rootViewController: payViewController)
    lazy var checkNavigationController = UINavigationController(rootViewController: checkViewController)
    
        
    
    //MARK: - UI Components
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        setTabBar()
        setLayout()
        setNavigationController()
        setViewController()
        //setCornerRadius()
        selectedIndex = 1
        
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        tabBar.frame.size.height = 96
//        tabBar.frame.origin.y = view.frame.height - 96
//
//    }
    
    //MARK: - Custom Method
    
    private func setTabBar(){
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        
        //tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.itemPositioning = .centered
        tabBar.itemSpacing = 130
    }
    
    private func setLayout(){
    }
    
//    private func setCornerRadius(){
//        tabBar.layer.cornerRadius = 24
//        tabBar.layer.maskedCorners = [.layerMinXMinYCorner,
//                                      .layerMaxXMinYCorner]
//    }
    
    private func setNavigationController() {
        homeNavigationContrller.setNavigationBarHidden(true, animated: true)
        payNavigationController.setNavigationBarHidden(true, animated: true)
        checkNavigationController.setNavigationBarHidden(true, animated: true)
    }
    
    private func setViewController(){
        
        homeNavigationContrller.tabBarItem = UITabBarItem(title: "홈", image: nil, tag: 0)
        payNavigationController.tabBarItem = UITabBarItem(title: "임금", image: nil, tag: 1)
        checkNavigationController.tabBarItem = UITabBarItem(title: "체크", image: nil, tag: 2)
        
        viewControllers = [homeNavigationContrller,payNavigationController,checkNavigationController]
    }
}

