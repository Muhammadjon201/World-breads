//
//  StarRatingView.swift
//  World breads
//
//  Created by ericzero on 12/8/22.
//

import UIKit

class StarRatingView: UIView {
    
    var r: Double = 0 {
        didSet{
            createUIElements()
        }
    }
    
    var leftPadding = 20
    var topPadding = 10
    var radius: CGFloat = 10
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 5
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = .darkGray
    }
    
    func createUIElements(){
        self.subviews.forEach({ $0.removeFromSuperview() })
        stackView.arrangedSubviews.forEach({ $0.removeFromSuperview() })
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        for i in 1...5 {
            let star = UIImageView()
            star.clipsToBounds = true
            star.backgroundColor = .clear
            star.contentMode = .scaleAspectFill
            star.tintColor = self.tintColor
            stackView.addArrangedSubview(star)
            star.snp.makeConstraints { make in
                make.height.width.equalTo(stackView.snp.height)
            }
            if i <= Int(r){
                star.image = UIImage(named: "fillStar")?.withRenderingMode(.alwaysTemplate)
            } else if i == Int(round(r)) {
                star.image = UIImage(named: "halfStar")?.withRenderingMode(.alwaysTemplate)
            } else {
                star.image = UIImage(named: "emptyStar")?.withRenderingMode(.alwaysTemplate)
            }
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
