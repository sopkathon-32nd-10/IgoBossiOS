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
        setStyle()
        setNavigationController()
        setViewController()
        setCornerRadius()
        selectedIndex = 1
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.frame.size.height = 100
        tabBar.frame.origin.y = view.frame.height - 100
    }
    
    //MARK: - Custom Method
    
    private func setTabBar(){
        
        //tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
        tabBar.itemPositioning = .centered
        tabBar.itemSpacing = 130
    }
    
    private func setStyle(){
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .gray, alpha: 0.15, x: 0, y: -2, blur: 4)
    }
    
    private func setCornerRadius(){
        tabBar.layer.cornerRadius = 20
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner,
                                      .layerMaxXMinYCorner]
    }
    
    private func setNavigationController() {
        homeNavigationContrller.setNavigationBarHidden(true, animated: true)
        payNavigationController.setNavigationBarHidden(true, animated: true)
        checkNavigationController.setNavigationBarHidden(true, animated: true)
    }
    
    private func setViewController(){
        
        payNavigationController.tabBarItem = UITabBarItem(title: nil, image: Image.calculate, selectedImage: Image.calculate)
        homeNavigationContrller.tabBarItem = UITabBarItem(title: nil, image: Image.home, selectedImage: Image.home)
        checkNavigationController.tabBarItem = UITabBarItem(title: nil, image: Image.check, selectedImage: Image.check)
        
        viewControllers = [payNavigationController,homeNavigationContrller,checkNavigationController]
    }
}

