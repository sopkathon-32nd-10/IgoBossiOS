//
//  UIColor+.swift
//  iOS
//
//  Created by 류희재 on 2023/05/20.
//

import UIKit

extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}

//MARK: - Custom Color

extension UIColor{ }
