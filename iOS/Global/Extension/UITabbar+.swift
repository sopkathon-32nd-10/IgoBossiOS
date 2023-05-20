//
//  UITabbar+.swift
//  iOS
//
//  Created by 류희재 on 2023/05/21.
//

import UIKit

extension UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
    var sizeThatFits = super.sizeThatFits(size)
    sizeThatFits.height = 44 // 원하는 길이
    return sizeThatFits
   }
}
