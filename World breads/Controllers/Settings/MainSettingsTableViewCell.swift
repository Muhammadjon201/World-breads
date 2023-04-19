//
//  MainSettingsTableViewCell.swift
//  World breads
//
//  Created by ericzero on 12/5/22.
//

import UIKit
import SnapKit

class MyData {
    var name: String?
    
    init(name: String) {
        self.name = name
    }
}

class MainSettingsTableViewCell: UITableViewCell {
    
    lazy var bottomLabel: UILabel = {
        let bottomLabel = UILabel()
        bottomLabel.numberOfLines = 0
        bottomLabel.font = BaseFonts.verdana_Bold(size: 17)
        bottomLabel.textColor = BaseColor.shareIconColor()
        return bottomLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubview(bottomLabel)
        
        bottomLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(20)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(info: MyData) {
        bottomLabel.text = info.name
    }

}
