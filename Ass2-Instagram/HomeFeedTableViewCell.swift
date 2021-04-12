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
        setCollectionView()
        setHeaderViewConstraint()
        setCollectionViewConstraint()
        setButtonViewConstraint()
        setDescriptionViewConstraint()
        setCommentViewConstraint()
        //setLabelTap()
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentLabel.snp.updateConstraints { make in
            make.trailing.equalToSuperview().offset(1000)
        }
        
    }

    // HeaderView 생성
    private var headerView: UIView = {
        let view = UIView()
        return view
    }()
    
    // MainCollectionView 생성
    private var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        return cv
    }()
    
    // 추후에 제대로 설정
    // FooterView : pageControl 생성
    private var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPageIndicatorTintColor = UIColor.systemBlue
        pageControl.pageIndicatorTintColor = UIColor.black
        return pageControl
    }()
    
    // StackView 생성
    private var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [])
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false;
        stack.alignment = .fill
        stack.distribution = .fill

        return stack
    }()
    
    // buttonView 생성
    private var buttonView: UIView = {
        let view = UIView()
        return view
    }()
    
    // descriptionView 생성 (더보기버튼 관련 뷰)
    private var descriptionView: UIView = {
        let view = UIView()
        return view
    }()
    
    // commentView 생성 (댓글 창 관련 뷰)
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
        label.font = UIFont(name: "SFProText-Semibold", size: 13)
        return label
    }()
    
    // HeaderView : localLabel 생성
    private let localLabel: UILabel = {
        let label = UILabel()
        label.text = "SSU, Seoul"
        label.textColor = UIColor.black
        label.font = UIFont(name: "SFProText-Regular", size: 11)
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
    
    // ButtonView : likeBtn 생성
    private let likeBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Heart.png"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    // ButtonView : commentBtn 생성
    private let commentBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Comment.png"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    // ButtonView : toStoryBtn 생성
    private let toStoryBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Messanger.png"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    // ButtonView : saveBtn 생성
    private let saveBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Save.png"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    // ButtonView : likeUserImg 생성
    private let likeUserImg2: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "User2.png")
        return imgView
    }()
    
    // ButtonView : likeInfoLabel 생성
    private let likeInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.attributedText = NSMutableAttributedString()
            .bold(string: "Juuunnns_", fontSize: 16)
            .regular(string: "님 외 ", fontSize: 16)
            .bold(string: "100명", fontSize: 16)
            .regular(string: "이 좋아합니다", fontSize: 16)
        return label
    }()
    
    // DescriptionView : contentLabel 생성
    let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.attributedText = NSMutableAttributedString()
            .bold(string: "ground_yourssu ", fontSize: 16)
            .regular(string: "인스타그램 클론코딩을 하고 있습니다 블라블라 블라블랍 블라블라 블라블라 블라블랍 블라블라블라블라 블라블랍 블라블라 블라블라 블라블랍 블라블라 블라블라 블라블랍 블라블라 ", fontSize: 16)
        label.textColor = UIColor.black
        return label
    }()
    
    // CommentView : profileImg2 생성
    private let profileImg2: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "User.png")
        return imgView
    }()
    
    // CommentView : commentTextField 생성
    private let commentTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "댓글 달기..."
        textfield.font = UIFont(name: "SFProText-Medium", size: 14)

        return textfield
    }()
    
    // CommentView : timeLabel 생성
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "2시간전"
        label.font = UIFont(name: "SFProText-Medium", size: 12)
        label.textColor = UIColor.gray
        return label
    }()
    
    
    
    
    
    private func setStructure() {
        
        // 크게 세가지 View로 나누어 contentView에 추가
        contentView.addSubview(headerView)
        contentView.addSubview(mainCollectionView)
        contentView.addSubview(buttonView)
        contentView.addSubview(descriptionView)
        contentView.addSubview(commentView)
        
        //headerView 구성요소 추가
        headerView.addSubview(profileImg)
        headerView.addSubview(idLabel)
        headerView.addSubview(localLabel)
        headerView.addSubview(settingBtn)
        
        //buttonView 구성요소 추가
        buttonView.addSubview(likeBtn)
        buttonView.addSubview(commentBtn)
        buttonView.addSubview(toStoryBtn)
        buttonView.addSubview(pageControl)
        buttonView.addSubview(saveBtn)
        buttonView.addSubview(likeUserImg2)
        buttonView.addSubview(likeInfoLabel)
        
        //descriptionView 구성요소 추가
        descriptionView.addSubview(contentLabel)
        
        //commentView 구성요소 추가
        commentView.addSubview(profileImg2)
        commentView.addSubview(commentTextField)
        commentView.addSubview(timeLabel)
   
    }
    
    // CollectionView 설정
    private func setCollectionView() {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        mainCollectionView.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: "pageCell")
        mainCollectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 400)
        mainCollectionView.backgroundColor = .white
        mainCollectionView.showsHorizontalScrollIndicator = false
        mainCollectionView.isPagingEnabled = true
    }
  
    func unfoldLabel() {
        contentLabel.snp.updateConstraints { make in
            make.trailing.equalToSuperview().offset(-14)
        }
    }

    // SnapKit 사용하여 HeaderView 의 AutoLayout
    private func setHeaderViewConstraint() {
        
        headerView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.trailing.equalToSuperview()
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
    
    // SnapKit 사용하여 CollectionView 의 AutoLayout
    private func setCollectionViewConstraint() {
        
        mainCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(400)
        }
        
//        rectangleImg.snp.makeConstraints { make in
//            make.top.equalTo(headerView.snp.bottom).offset(14)
//            make.trailing.equalToSuperview().offset(-14)
//            make.width.equalTo(34)
//            make.height.equalTo(26)
//        }
//
//        pageLabel.snp.makeConstraints { make in
//            make.top.equalTo(rectangleImg.snp.top).offset(6)
//            make.bottom.equalTo(rectangleImg.snp.bottom).offset(-6)
//            make.leading.equalTo(rectangleImg.snp.leading).offset(8)
//            make.trailing.equalTo(rectangleImg.snp.trailing).offset(-8)
//        }
    }

    
    // SnapKit 사용하여 ButtonView 의 AutoLayout
    private func setButtonViewConstraint() {
        
        buttonView.snp.makeConstraints { make in
            make.top.equalTo(mainCollectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(70)
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
        
        pageControl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.centerX.equalToSuperview()
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
    }
    
    // 여기가 문제입니다...
    private func setDescriptionViewConstraint() {
        
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(buttonView.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().offset(1000)
        }
        
    }
    
    // CommentView 의 AutoLayout
    private func setCommentViewConstraint() {
        
        commentView.snp.makeConstraints { make in
            make.top.equalTo(descriptionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(contentView.snp.bottom)
            make.height.equalTo(70)
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

// TableViewCell 안의 CollectionView 설정
extension HomeFeedTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height - (collectionView.safeAreaInsets.top + collectionView.safeAreaInsets.bottom))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pageCell", for: indexPath) as? PageCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    // 스크롤 드래그가 끝났을때, 페이지 컨트롤을 바꿔줌
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / self.frame.width)
        self.pageControl.currentPage = page
      }
    
    
}
