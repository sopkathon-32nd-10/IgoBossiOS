//
//  UIView+.swift
//  iOS
//
//  Created by 류희재 on 2023/05/20.
//

import UIKit

extension UIView{
    func addSubviews(_ views: UIView...){
        views.forEach { self.addSubview($0) }
    }
    
    func makeShadow(
        color: UIColor,
        offset : CGSize,
        radius : CGFloat,
        opacity : Float)
    {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
    
    func makeCornerRadius(ratio: CGFloat){
        layer.cornerRadius = ratio
        layer.masksToBounds = false
        clipsToBounds = true
    }
    
    func makeCornerBorder(borderWidth: CGFloat, borderColor: UIColor) {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}


//View , ViewController 폴더 만들고 View (snpkit) 
