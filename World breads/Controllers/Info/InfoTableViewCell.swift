//
//  InfoTableViewCell.swift
//  World breads
//
//  Created by ericzero on 12/7/22.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "", size: 24)
        //view.font = BaseFonts.chalkboardSE_Bold(size: 24)
        view.textColor = .white
        view.textAlignment = .left
        view.numberOfLines = 0
        return view
    }()
    lazy var descLabel: UILabel = {
        let view = UILabel()
        //view.font = BaseFonts.verdana_Bold(size: 17)
        //view.textColor = BaseColor.shareIconColor()
        view.textAlignment = .left
        view.contentMode = .scaleAspectFill
        view.numberOfLines = 0
        return view
        
    }()
    
    lazy var img: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 12
        view.contentMode = .scaleAspectFill
        view.layer.borderColor = UIColor.white.cgColor
        view.backgroundColor = .green
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    func setUp() {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(descLabel)
        contentView.addSubview(img)
        
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalTo(10)
            make.right.equalTo(-10)
        }
        
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        
        img.snp.makeConstraints { make in
            make.top.equalTo(descLabel.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
            make.height.equalTo(img.snp.width).multipliedBy(0.7)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(data: Content) {
        titleLabel.text = data.title ?? ""
        descLabel.text = data.desc ?? ""
        img.image = UIImage(named: data.img ?? "")
    }

}
