//
//  HomeFeedTableViewCell.swift
//  Ass2-Instagram
//
//  Created by 권준상 on 2021/03/31.
//

import UIKit
import SnapKit

class HomeFeedTableViewCell: UITableViewCell {
    
    // Cell 사용 위해서 초기화
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStructure()
        setHeaderViewConstraint()
        setImgViewConstraint()
        setFooterViewConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // HeaderView 생성
    private var headerView: UIView = {
        let view = UIView()
        return view
    }()
    
    // ImageView 생성
    private let imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "InstaImage.png")
        return imgView
    }()

    // FooterView 생성
    private var footerView: UIView = {
        let view = UIView()
        return view
    }()
    
    // HeaderView : profileImg 생성
    private let profileImg: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "User.png")
        return imgView
    }()
    
    // HeaderView : idLabel 생성
    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "ground_ssu"
        label.textColor = UIColor.black
        return label
    }()
    
    // HeaderView : localLabel 생성
    private let localLabel: UILabel = {
        let label = UILabel()
        label.text = "SSU, Seoul"
        label.textColor = UIColor.black
        return label
    }()
    
    // HeaderView : settingBtn 생성
    private let settingBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Setting.png"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    // ImageView : RectangleImg 생성
    private let rectangleImg: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "Rectangle.png")
        return imgView
    }()
    
    // ImageView : pageLabel 생성
    private let pageLabel: UILabel = {
        let label = UILabel()
        label.text = "1/3"
        label.textColor = UIColor.white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    
    private func setStructure() {
        
        // 크게 세가지 View로 나누어 contentView에 추가
        contentView.addSubview(headerView)
        contentView.addSubview(imgView)
        contentView.addSubview(footerView)
        
        //headerView 구성요소 추가
        headerView.addSubview(profileImg)
        headerView.addSubview(idLabel)
        headerView.addSubview(localLabel)
        headerView.addSubview(settingBtn)

        //imgView 구성요소 추가
        imgView.addSubview(rectangleImg)
        rectangleImg.addSubview(pageLabel)
        
        //footerView 구성요소 추가
        
        
    }

    // SnapKit 사용하여 HeaderView 의 AutoLayout
    private func setHeaderViewConstraint() {
        
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(54)
        }
        
        let maxWidthContainer = 32
        let maxHeightContainer = 32
                
        profileImg.snp.makeConstraints { make in
            make.top.equalTo(headerView).offset(11)
            make.leading.equalTo(headerView).offset(10)
            make.bottom.equalTo(headerView).offset(-11)
            make.height.equalTo(32)
            make.width.equalTo(profileImg.snp.height).multipliedBy(maxWidthContainer/maxHeightContainer)
        }
        
        idLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImg.snp.trailing).offset(10)
            make.top.equalTo(headerView).offset(11)
        }
        
        localLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImg.snp.trailing).offset(10)
            make.top.equalTo(idLabel.snp.bottom).offset(1)
        }
        
        settingBtn.snp.makeConstraints { make in
            make.top.equalTo(headerView).offset(25)
            make.trailing.equalTo(headerView).offset(-15)
            make.bottom.equalTo(headerView).offset(-26)
        }

    }
    
    // SnapKit 사용하여 ImgView 의 AutoLayout
    private func setImgViewConstraint() {
        
        let maxWidthContainer = 375
        let maxHeightContainer = 375
        
        imgView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(375)
            make.width.equalTo(imgView.snp.height).multipliedBy(maxWidthContainer/maxHeightContainer)
        }
        
        rectangleImg.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(14)
            make.trailing.equalToSuperview().offset(-14)
            make.width.equalTo(34)
            make.height.equalTo(26)
        }
        
        pageLabel.snp.makeConstraints { make in
            make.top.equalTo(rectangleImg.snp.top).offset(6)
            make.bottom.equalTo(rectangleImg.snp.bottom).offset(-6)
            make.leading.equalTo(rectangleImg.snp.leading).offset(8)
            make.trailing.equalTo(rectangleImg.snp.trailing).offset(-8)
        }
    }
    
    // SnapKit 사용하여 FooterView 의 AutoLayout (해야함)
    private func setFooterViewConstraint() {
        footerView.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(178)
        }
    }
}
