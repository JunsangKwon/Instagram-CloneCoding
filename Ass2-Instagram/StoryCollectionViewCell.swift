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
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // storyImgView 생성
    private let storyimgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "story1.png")
        return imgView
    }()
    
    // storyIdLabel 생성
    private let storyIdLabel: UILabel = {
        let label = UILabel()
        label.text = "ground_ssu"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black
        return label
    }()
    
    func setConstruct() {
        contentView.addSubview(storyimgView)
        contentView.addSubview(storyIdLabel)
    }
    
    func setConstraints() {
        
        let maxWidthContainer = 62
        let maxHeightContainer = 62
        
        storyimgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.centerX.equalToSuperview()
            make.height.equalTo(62)
            make.width.equalTo(storyimgView.snp.height).multipliedBy(maxWidthContainer/maxHeightContainer)
        }
        
        storyIdLabel.snp.makeConstraints { make in
            make.top.equalTo(storyimgView.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
