//
//  HomeViewController.swift
//  iOS
//
//  Created by 류희재 on 2023/05/20.
//
import UIKit
import SnapKit
import Then

final class HomeViewController: BaseViewController {
    
    private let rootView = HomeView()
    private var userData: HomeResponse?
    
    // MARK: - App Life Cycle
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .soptYellow500
        requestHome()
    }
}

extension HomeViewController {
    func requestHome() {
        HomeAPI.shared.getUserInfo(completion: { result in
            guard let result = self.validateResult(result) as? HomeResponse else {
                print("🍎🍎🍎🍎🍎🍎🍎🍎")
                return
            }
            print("🍏🍏🍏🍏🍏🍏🍏")
            self.userData = result
            self.dataBind()
        })
    }
    
    func dataBind() {
        guard let userData = self.userData else { return }
        rootView.realname.text = userData.name
        rootView.birthday.text = userData.birth
        rootView.time.text = userData.name
        rootView.country.text = userData.nationality
        rootView.circleImg.kfSetImage(url: userData.profileImg)
        rootView.label1.text = "\(userData.name ?? "누구") 님의"
        rootView.place.text = userData.workspace
        rootView.time.text = "\(userData.workingMonths ?? 0)개월"
    }
}
