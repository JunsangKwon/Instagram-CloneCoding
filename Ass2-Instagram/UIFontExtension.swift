//
//  UIFontExtension.swift
//  Ass2-Instagram
//
//  Created by 권준상 on 2021/04/14.
//

import UIKit

extension UIFont {
    
    static let idLabelFont: UIFont = {
        guard let font = UIFont(name: "SFProText-Semibold", size: 13) else {
            return UIFont.systemFont(ofSize: 13)
        }
        return font
    }()
    
    static let localLabelFont: UIFont = {
        guard let font = UIFont(name: "SFProText-Regular", size: 11) else {
            return UIFont.systemFont(ofSize: 11)
        }
        return font
    }()
    
    static let pageLabelFont: UIFont = {
        guard let font = UIFont(name: "SFProText-Regular", size: 12) else {
            return UIFont.systemFont(ofSize: 12)
        }
        return font
    }()
    
    static let moreBtnFont: UIFont = {
        guard let font = UIFont(name: "SFProText-Regular", size: 13) else {
            return UIFont.systemFont(ofSize: 13)
        }
        return font
    }()
    
    static let commentTextFieldFont: UIFont = {
        guard let font = UIFont(name: "SFProText-Medium", size: 14) else {
            return UIFont.systemFont(ofSize: 14)
        }
        return font
    }()
    
    static let timeLabelFont: UIFont = {
        guard let font = UIFont(name: "SFProText-Medium", size: 12) else {
            return UIFont.systemFont(ofSize: 12)
        }
        return font
    }()
    
    static let storyIdLabelFont: UIFont = {
        guard let font = UIFont(name: "SFProText-Regular", size: 12) else {
            return UIFont.systemFont(ofSize: 12)
        }
        return font
    }()
 
}

// 글자 설정
extension NSMutableAttributedString {
    
    func bold(string: String, fontSize: CGFloat) -> NSMutableAttributedString {
        //let font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        if let font = UIFont(name: "SFProText-Bold", size: fontSize) {
            let attributes = [NSAttributedString.Key.font: font]
            self.append(NSAttributedString(string: string, attributes: attributes))
        } else {
            print("error")
        }
        
        return self
    }
    
    func regular(string: String, fontSize: CGFloat) -> NSMutableAttributedString {
        if let font = UIFont(name: "SFProText-Regular", size: fontSize) {
            let attributes = [NSAttributedString.Key.font: font]
            self.append(NSAttributedString(string: string, attributes: attributes))
        } else {
            print("error")
        }
        return self
    }
}
