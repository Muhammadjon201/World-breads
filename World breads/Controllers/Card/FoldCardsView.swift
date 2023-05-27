//
//  FoldCardsView.swift
//  World breads
//
//  Created by ericzero on 12/8/22.
//

import UIKit

class FoldCardsView: UIView {
    
    var shadowNumbers = 2 {
        didSet{
            createUIElements()
        }
    }
    
    var leftPadding = 10
    var topPadding = 7
    var radius: CGFloat = 15
    
    lazy var mainGradientView: UIView = {
        let view = UIView()
        view.backgroundColor = bgColor
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
        return view
    }()
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.backgroundColor = .clear
        view.layer.cornerRadius = radius
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var gradientView = UIView()
    let gradientLayer:CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.5, y: 0.2)
        layer.endPoint = CGPoint(x: 0.5, y: 1.0)
        layer.colors = [UIColor.clear.cgColor,UIColor.black.withAlphaComponent(0.7).cgColor]
        return layer
    }()
    let stars = StarRatingView()
    lazy var flagIcon: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .white
        view.layer.cornerRadius = 2.5
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 0.2
        return view
    }()
    
    lazy var bgColor:UIColor = {
        var color = UIColor(red: 180/255, green: 13/255, blue: 34/255, alpha: 1)
        if let img = UIImage(named: "bg6") {
            color = UIColor(patternImage: img)
        }
        return color
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func createUIElements(){
        
        self.subviews.forEach({ $0.removeFromSuperview() })
        stars.tintColor = .systemYellow
        
        if shadowNumbers > 0 {
            for i in 0..<shadowNumbers {
                let shadowView = UIView()
                shadowView.backgroundColor = bgColor.withAlphaComponent(1/CGFloat(3))
                shadowView.layer.cornerRadius = radius
                addSubview(shadowView)
                shadowView.snp.makeConstraints { make in
                    make.top.equalTo(topPadding*(shadowNumbers-i))
                    make.left.equalTo(-leftPadding*(shadowNumbers-i))
                    make.right.equalTo(-leftPadding*(shadowNumbers-i))
                    make.bottom.equalTo(-topPadding*(i))
                }
            }
        }
        
        addSubview(mainGradientView)
        mainGradientView.addSubview(imageView)
        imageView.addSubview(gradientView)
        gradientView.layer.addSublayer(gradientLayer)
        addSubview(stars)
        addSubview(flagIcon)
        
        mainGradientView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(-topPadding*(shadowNumbers))
        }
        
        if shadowNumbers <= 0 {
            mainGradientView.snp.makeConstraints { make in
                make.bottom.equalToSuperview()
            }
        }
        imageView.snp.makeConstraints { make in
            make.top.left.equalTo(5)
            make.bottom.right.equalTo(-5)
        }
        gradientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        stars.snp.makeConstraints { make in
            make.bottom.equalTo(-(topPadding*shadowNumbers+15))
            make.left.equalTo(15)
            make.height.equalTo(12)
        }
        flagIcon.snp.makeConstraints { make in
            make.bottom.equalTo(-(topPadding*shadowNumbers+15))
            make.right.equalTo(-15)
            make.height.equalTo(12)
            make.width.equalTo(flagIcon.snp.height).multipliedBy(1.6)
        }
        
    }
    
    func createConent(_ obj: Bread, size: CGSize) {
        imageView.sd_setImage(with: URL(string: obj.img ?? ""), placeholderImage: UIImage(named: "placeholder"))
        flagIcon.sd_setImage(with: URL(string: obj.flag ?? ""), placeholderImage: UIImage(named: "placeholder"))
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame.size = self.frame.size
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
