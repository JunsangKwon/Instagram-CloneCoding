//
//  HomeFeedTableViewCell.swift
//  Ass2-Instagram
//
//  Created by 권준상 on 2021/03/31.
//

import UIKit

class HomeFeedTableViewCell: UITableViewCell {
    
    // Cell 사용 위해서 초기화
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraint()
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
    
    // imageView 생성
    private let img: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "InstaImage.png")
        return imgView
    }()


    // label 생성
    private let label: UILabel = {
        let label = UILabel()
        label.text = "테스트"
        label.textColor = UIColor.black
        return label
    }()

    // SnapKit 사용 아직 안함
    private func setConstraint() {
        
        contentView.addSubview(img)
        contentView.addSubview(label)
        let maxWidthContainer = 200
        let maxHeightContainer = 200
        
        img.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.leading.equalTo(contentView).offset(20)
            make.bottom.equalTo(contentView).offset(-10)
            make.height.equalTo(100)
            make.width.equalTo(img.snp.height).multipliedBy(maxWidthContainer/maxHeightContainer)
        }
                
        label.snp.makeConstraints { make in
            make.left.equalTo(img.snp.right).offset(20)
            make.centerY.equalTo(img)
        }

    }
}
