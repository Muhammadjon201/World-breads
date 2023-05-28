//
//  OneItemView.swift
//  World breads
//
//  Created by ericzero on 12/8/22.
//

import UIKit

class OneItemView: BaseView {
    
    lazy var rankLabel: UILabel = {
        let view = UILabel()
        view.font = BaseFonts.light(size: 16)
        view.textColor = UIColor(red: 252/255, green: 60/255, blue: 68/255, alpha: 1)
        view.textAlignment = .center
        view.numberOfLines = 1
        view.text = "Rank"
        return view
    }()
    lazy var rankValueLabel: UILabel = {
        let view = UILabel()
        view.font = BaseFonts.light(size: 32)
        view.textColor = UIColor(red: 252/255, green: 60/255, blue: 68/255, alpha: 1)
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    lazy var verticalyView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    lazy var typeLabel: UILabel = {
        let view = UILabel()
        view.font = BaseFonts.extraLight(size: 14)
        view.textColor = .black
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.font = BaseFonts.bold(size: 18)
        view.textColor = .black
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    lazy var flagIcon: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 2.5
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.borderWidth = 0.2
        return view
    }()
    lazy var locationLabel: UILabel = {
        let view = UILabel()
        view.font = BaseFonts.light(size: 16)
        view.textColor = .black
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    lazy var ratingLabel: UILabel = {
        let view = UILabel()
        view.font = BaseFonts.light(size: 16)
        view.textColor = .black
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    lazy var ratingView: StarRatingView = {
        let view = StarRatingView()
        view.clipsToBounds = true
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFill
        return view
    }()
    lazy var locationIcon: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    lazy var img: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    let gradientLayer:CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.frame.size = CGSize(width: UIScreen.main.bounds.width, height: 300)
        layer.startPoint = CGPoint(x: 0.5, y: 1.0) // CGPoint(x: 0.5, y: 0.0)
        layer.endPoint = CGPoint(x: 0.5, y: 0.0) // CGPoint(x: 0.5, y: 1.0)
        layer.colors = [UIColor.clear.cgColor,UIColor.black.withAlphaComponent(0.4).cgColor]
        return layer
    }()
    lazy var starView: StarRatingView = {
        let view = StarRatingView()
        view.clipsToBounds = true
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFill
        return view
    }()
    lazy var starLabel: UILabel = {
        let view = UILabel()
        view.font = BaseFonts.light(size: 26)
        view.textColor = .black
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    lazy var descLabel: UITextView = {
        let view = UITextView()
        view.font = BaseFonts.light(size: 16)
        view.textColor = .black
        view.textAlignment = .center
        return view
    }()
    
    override func initSubViews() {
        
    }
    override func addedSubViews() {
        addSubview(rankValueLabel)
        addSubview(rankLabel)
        addSubview(verticalyView)
        addSubview(typeLabel)
        addSubview(nameLabel)
        addSubview(flagIcon)
        addSubview(locationLabel)
        addSubview(ratingLabel)
        addSubview(ratingView)
        addSubview(locationIcon)
        addSubview(img)
        img.layer.addSublayer(gradientLayer)
        addSubview(starLabel)
        addSubview(starView)
        addSubview(descLabel)
        
        
    }
    override func setConstraints() {
        rankValueLabel.snp.makeConstraints { make in
            make.top.equalTo(verticalyView.snp.top)
            make.left.equalTo(10)
        }
        rankLabel.snp.makeConstraints { make in
            make.bottom.equalTo(verticalyView.snp.bottom)
            make.centerX.equalTo(rankValueLabel.snp.centerX)
            make.left.greaterThanOrEqualTo(10)
        }
        verticalyView.snp.makeConstraints { make in
            make.top.equalTo(typeLabel.snp.top)
            make.left.equalTo(rankLabel.snp.right).offset(20)
            make.bottom.equalTo(flagIcon.snp.bottom)
            make.width.equalTo(2)
        }
        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(30)
            make.left.equalTo(verticalyView.snp.right).offset(10)
            make.right.lessThanOrEqualTo(locationIcon.snp.left).offset(-5)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(typeLabel.snp.bottom).offset(10)
            make.left.equalTo(verticalyView.snp.right).offset(10)
            make.right.lessThanOrEqualTo(locationIcon.snp.left).offset(-5)
        }
        flagIcon.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.equalTo(verticalyView.snp.right).offset(10)
            make.height.equalTo(15)
            make.width.equalTo(flagIcon.snp.height).multipliedBy(1.6)
        }
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(flagIcon.snp.centerY)
            make.left.equalTo(flagIcon.snp.right).offset(10)
            make.right.lessThanOrEqualTo(locationIcon.snp.left).offset(-5)
        }
        locationIcon.snp.makeConstraints { make in
            make.centerY.equalTo(verticalyView.snp.centerY)
            make.right.equalTo(-10)
            make.height.width.equalTo(60)
        }
        img.snp.makeConstraints { make in
            make.top.equalTo(flagIcon.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(-0)
            make.height.equalTo(250)
        }
        starLabel.snp.makeConstraints { make in
            make.top.equalTo(img.snp.bottom).offset(20)
            make.left.equalTo(10)
        }
        starView.snp.makeConstraints { make in
            make.centerY.equalTo(starLabel.snp.centerY)
            make.left.equalTo(starLabel.snp.right).offset(20)
            make.height.equalTo(starLabel.font.pointSize-4)
        }
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(starLabel.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.bottom.equalTo(-10)
        }
    }
    
    func createContent(_ obj: Bread){
        rankValueLabel.text = obj.rank ?? ""
        typeLabel.text = obj.type ?? ""
        nameLabel.text = obj.name ?? ""
        flagIcon.sd_setImage(with: URL(string: obj.flag ?? ""), placeholderImage: UIImage(named: "placeholder"))
        locationLabel.text = obj.loc ?? ""
        locationIcon.sd_setImage(with: URL(string: obj.locImg ?? ""), placeholderImage: UIImage(named: "placeholder"))
        img.sd_setImage(with: URL(string: obj.img ?? ""), placeholderImage: UIImage(named: "placeholder"))
        starLabel.text = obj.rating ?? ""
        starView.r = Double(obj.rating ?? "") ?? 0
        descLabel.text = obj.desc ?? ""
    }
}

