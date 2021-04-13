//
//  StoryCollectionViewCell.swift
//  Ass2-Instagram
//
//  Created by 권준상 on 2021/04/05.
//

import UIKit
import SnapKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstruct()
        setGradient()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // storyBorderView 생성
    private let storyBorderView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 62, height: 62)
        view.layer.cornerRadius = 31
        return view
    }()
    
    // storyImgView 생성
    private let storyimgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "story1.png")
        imgView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        imgView.layer.borderWidth = 2
        imgView.layer.cornerRadius = 28
        return imgView
    }()
    
    // storyIdLabel 생성
    private let storyIdLabel: UILabel = {
        let label = UILabel()
        label.text = "ground_ssu"
        label.font = UIFont(name: "SFProText-Regular", size: 12)
        label.textColor = UIColor.black
        return label
    }()
    
    func setConstruct() {
        contentView.addSubview(storyBorderView)
        contentView.addSubview(storyimgView)
        contentView.addSubview(storyIdLabel)
    }
    
    // 그라디언트 생성
    func setGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = storyBorderView.bounds
        let colors: [CGColor] = [
           .init(red: 0.98, green: 0.67, blue:  0.28, alpha: 1),
           .init(red: 0.85, green:  0.1, blue: 0.27, alpha: 1),
           .init(red: 0.65, green: 0.06, blue: 0.58, alpha: 1)
        ]
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.cornerRadius = 31
        storyBorderView.layer.addSublayer(gradientLayer)
    }
    
    func setConstraints() {
        
        let maxWidthContainer = 62
        let maxHeightContainer = 62
        
        storyBorderView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.centerX.equalToSuperview()
            make.height.equalTo(62)
            make.width.equalTo(storyBorderView.snp.height).multipliedBy(maxWidthContainer/maxHeightContainer)
        }
        
        let maxWidthContainer2 = 56
        let maxHeightContainer2 = 56
        
        storyimgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(56)
            make.width.equalTo(storyimgView.snp.height).multipliedBy(maxWidthContainer2/maxHeightContainer2)
        }
        
        storyIdLabel.snp.makeConstraints { make in
            make.top.equalTo(storyBorderView.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
