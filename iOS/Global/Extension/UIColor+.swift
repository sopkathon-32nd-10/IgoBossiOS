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

extension UIColor{
    class var soptGrey000 : UIColor {
        return UIColor(r: 121, g: 121, b: 121)
    }
    class var soptGrey100 : UIColor {
        return UIColor(r: 234, g: 234, b: 234)
    }
    class var soptGrey200 : UIColor {
        return UIColor(r: 217, g: 217, b: 217)
    }
    class var soptGrey300 : UIColor {
        return UIColor(r: 168, g: 168, b: 168)
    }
    class var soptGrey400 : UIColor {
        return UIColor(r: 124, g: 124, b: 124)
    }
    class var soptGrey500 : UIColor {
        return UIColor(r: 80, g: 80, b: 80)
    }
    class var soptGrey600 : UIColor {
        return UIColor(r: 29, g: 29, b: 29)
    }
}

