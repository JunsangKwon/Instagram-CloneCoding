//
//  PageCollectionViewCell.swift
//  Ass2-Instagram
//
//  Created by 권준상 on 2021/04/06.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstruct()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // storyImgView 생성
    private let instaImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "InstaImage.png")
        return imgView
    }()
    
    func setConstruct() {
        contentView.addSubview(instaImgView)
    }
    
    func setConstraints() {
        
        instaImgView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }

    }
}
