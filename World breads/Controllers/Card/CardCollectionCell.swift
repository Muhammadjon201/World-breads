//
//  CardCollectionCell.swift
//  World breads
//
//  Created by ericzero on 12/7/22.
//

import UIKit

class CardCollectionCell: UICollectionViewCell {
    
    let foldView = FoldCardsView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        contentView.addSubview(foldView)
        foldView.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.left.equalTo(20)
        }
    }
    
    
}
