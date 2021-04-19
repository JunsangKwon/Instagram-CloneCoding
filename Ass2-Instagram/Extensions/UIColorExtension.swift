//
//  UIColorExtension.swift
//  Ass2-Instagram
//
//  Created by 권준상 on 2021/04/14.
//

import UIKit

// HEX 색상 설정을 위한 extexsion
extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
        self.init(
            red: CGFloat(red)/255.0,
            green: CGFloat(green)/255.0,
            blue: CGFloat(blue)/255.0,
            alpha: CGFloat(a)/255.0
        )
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    convenience init(argb: Int) {
        self.init(
            red: (argb >> 16) & 0xFF,
            green: (argb >> 8) & 0xFF,
            blue: argb & 0xFF,
            a: (argb >> 24) & 0xFF
        )
    }
    
    static let currentPageColor: UIColor = {
        let color = UIColor(rgb: 0x3897F0)
        return color
    }()
    
    static let restOfPageColor: UIColor = {
        let color = UIColor(rgb: 0x000000).withAlphaComponent(0.1)
        return color
    }()
    
    static let pageLabelColor: UIColor = {
        let color = UIColor(rgb: 0xF9F9F9)
        return color
    }()
}
