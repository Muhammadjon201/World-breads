//
//  SettingsTableViewCell.swift
//  World breads
//
//  Created by ericzero on 11/30/22.
//

import UIKit
import SnapKit
import SDWebImage

class SettingsTableViewCell: UITableViewCell {
    
    let containerView = UIView()
    let stacView = UIStackView()
    let contentImage = UIImageView()
    let nameLabel = UILabel()
    let typeLabel = UILabel()
    let mapImage = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
    
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 7
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        stacView.axis = .vertical
        stacView.setCustomSpacing(10, after: nameLabel)
        
        contentImage.clipsToBounds = true
        contentImage.layer.cornerRadius = 10
        
        nameLabel.numberOfLines = 1
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.textAlignment = .left
        
        typeLabel.numberOfLines = 1
        typeLabel.font = UIFont.systemFont(ofSize: 18)
        typeLabel.textAlignment = .left
        
        mapImage.clipsToBounds = true
        mapImage.contentMode = .scaleAspectFill
        
        contentView.addSubview(containerView)
        containerView.addSubview(contentImage)
        containerView.addSubview(nameLabel)
        containerView.addSubview(typeLabel)
        containerView.addSubview(mapImage)
        containerView.addSubview(stacView)
        stacView.addArrangedSubview(nameLabel)
        stacView.addArrangedSubview(typeLabel)
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.bottom.equalTo(-5)
        }
        
        contentImage.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(5)
            make.bottom.equalTo(-5)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        stacView.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(contentImage.snp.right).offset(25)
            make.right.equalTo(mapImage.snp.left).offset(-10)
            make.bottom.equalTo(-5)
        }
        
        mapImage.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.right.equalTo(-5)
            make.bottom.equalTo(-5)
            make.height.equalTo(60)
            make.width.equalTo(mapImage.snp.height)
        }
    }
    
    func updateCell(data: Bread) {
        contentImage.sd_setImage(with: URL(string: data.img ?? ""))
        nameLabel.text = data.name
        typeLabel.text = data.loc
        mapImage.sd_setImage(with: URL(string: data.locImg ?? ""))
    }
}
