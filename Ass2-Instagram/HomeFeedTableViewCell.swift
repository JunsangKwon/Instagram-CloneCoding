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
    
    // descriptionView 생성 : FooterView 하위 뷰 (더보기버튼 관련 뷰)
    private var descriptionView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 347, height: 40)
        return view
    }()
    
    // commentView 생성 : FooterView 하위 뷰 (댓글 창 관련 뷰)
    private var commentView: UIView = {
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
    
    // FooterView : likeBtn 생성
    private let likeBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Heart.png"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    // FooterView : commentBtn 생성
    private let commentBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Comment.png"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    // FooterView : toStoryBtn 생성
    private let toStoryBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Messanger.png"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    // FooterView : saveBtn 생성
    private let saveBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Save.png"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    // FooterView : likeUserImg 생성
    private let likeUserImg2: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "User2.png")
        return imgView
    }()
    
    // FooterView : likeInfoLabel 생성
    private let likeInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Juuunnns_님 외 100명이 좋아합니다"
        label.textColor = UIColor.black
        return label
    }()
    
    // FooterView : idLabel2 생성
    private let idLabel2: UILabel = {
        let label = UILabel()
        label.text = "ground_yourssu"
        label.textColor = UIColor.black
        return label
    }()
    
    // FooterView : contentLabel 생성, 줄 넘김이 안되는 오류 존재.
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "인스타그램 클론코딩을 하는중입니다"
        label.textColor = UIColor.black
        return label
    }()
    
    // FooterView : moreBtn 생성
    private let moreBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("더보기", for: .normal)
        button.tintColor = UIColor.gray
        return button
    }()
    
    // FooterView : profileImg2 생성
    private let profileImg2: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "User.png")
        return imgView
    }()
    
    // FooterView : commentTextField 생성
    private let commentTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "댓글 달기..."
        return textfield
    }()
    
    // FooterView : timeLabel 생성
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "2시간전"
        label.textColor = UIColor.gray
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
        footerView.addSubview(likeBtn)
        footerView.addSubview(commentBtn)
        footerView.addSubview(toStoryBtn)
        footerView.addSubview(saveBtn)
        footerView.addSubview(likeUserImg2)
        footerView.addSubview(likeInfoLabel)
        footerView.addSubview(descriptionView)
        footerView.addSubview(commentView)
        
        //descriptionView 구성요소 추가
        descriptionView.addSubview(idLabel2)
        descriptionView.addSubview(contentLabel)
        //descriptionView.addSubview(moreBtn)
        
        //commentView 구성요소 추가
        commentView.addSubview(profileImg2)
        commentView.addSubview(commentTextField)
        commentView.addSubview(timeLabel)
        
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
    
    // SnapKit 사용하여 FooterView 의 AutoLayout
    private func setFooterViewConstraint() {
        
        footerView.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(185)
        }
        
        likeBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalToSuperview().offset(15)
        }
        
        commentBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalTo(likeBtn.snp.trailing).offset(18)
        }
        
        toStoryBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalTo(commentBtn.snp.trailing).offset(17)
        }
        
        saveBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().offset(-17)
        }
        
        let maxWidthContainer = 18
        let maxHeightContainer = 18
        
        likeUserImg2.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(likeBtn.snp.bottom).offset(12)
            make.height.equalTo(18)
            make.width.equalTo(likeUserImg2.snp.height).multipliedBy(maxWidthContainer/maxHeightContainer)
        }
        
        likeInfoLabel.snp.makeConstraints { make in
            make.leading.equalTo(likeUserImg2.snp.trailing).offset(6)
            make.top.equalTo(likeUserImg2)
            make.trailing.equalToSuperview().offset(-12)
        }
        
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(likeInfoLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().offset(-14)
            make.height.equalTo(40)
        }
        
        idLabel2.snp.makeConstraints { make in
            make.top.equalTo(descriptionView).offset(5)
            make.leading.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionView).offset(5)
            make.leading.equalTo(idLabel2.snp.trailing).offset(5)
            //make.trailing.equalToSuperview()
        }
        
        moreBtn.snp.makeConstraints { make in
            // 후에 구현
        }
        
        commentView.snp.makeConstraints { make in
            make.top.equalTo(descriptionView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        let maxWidthContainer2 = 26
        let maxHeightContainer2 = 26
        
        profileImg2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(14)
            make.height.equalTo(26)
            make.width.equalTo(profileImg2.snp.height).multipliedBy(maxWidthContainer2/maxHeightContainer2)
        }
        
        commentTextField.snp.makeConstraints { make in
            make.leading.equalTo(profileImg2.snp.trailing).offset(10)
            make.top.equalTo(profileImg2)
            make.trailing.equalToSuperview().offset(-263)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.top.equalTo(profileImg2.snp.bottom).offset(8)
            make.trailing.equalToSuperview().offset(-321)
        }
        
    }
}
