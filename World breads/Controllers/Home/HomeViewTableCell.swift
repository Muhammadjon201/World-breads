//
//  HomeViewTableCell.swift
//  World breads
//
//  Created by ericzero on 11/29/22.
//

import UIKit
import SnapKit

class HomeTableViewCell: BaseTableViewCell {
    
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
        view.font = BaseFonts.light(size: 18)
        view.textColor = .black
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.font = BaseFonts.light(size: 18)
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
        view.font = BaseFonts.light(size: 18)
        view.textColor = .black
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    lazy var ratingLabel: UILabel = {
        let view = UILabel()
        view.font = BaseFonts.light(size: 18)
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
    lazy var descLabel: UILabel = {
        let view = UILabel()
        view.font = BaseFonts.light(size: 16)
        view.textColor = .black
        view.textAlignment = .center
        view.numberOfLines = 3
        return view
    }()
    
    override func initSubViews() {
        
    }
    override func addedSubViews() {
        contentView.addSubview(rankValueLabel)
        contentView.addSubview(rankLabel)
        contentView.addSubview(verticalyView)
        contentView.addSubview(typeLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(flagIcon)
        contentView.addSubview(locationLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(ratingView)
        contentView.addSubview(locationIcon)
        contentView.addSubview(img)
        img.layer.addSublayer(gradientLayer)
        contentView.addSubview(descLabel)
        
        
    }
    override func setConstraints() {
        
        verticalyView.snp.makeConstraints { make in
            make.top.equalTo(30)
            make.left.equalTo(rankLabel.snp.right).offset(18)
            make.bottom.equalTo(flagIcon.snp.bottom)
            make.width.equalTo(2)
        }
        rankValueLabel.snp.makeConstraints { make in
            make.top.equalTo(verticalyView.snp.top)
            make.left.equalTo(10)
        }
        rankLabel.snp.makeConstraints { make in
            make.bottom.equalTo(verticalyView.snp.bottom)
            make.centerX.equalTo(rankValueLabel.snp.centerX)
            make.left.greaterThanOrEqualTo(10)
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
            make.height.equalTo(200)
        }
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(img.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.bottom.right.equalTo(-10)
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
                descLabel.text = obj.desc ?? ""
            }
        }


class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        createSubViews()
       
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func createSubViews(){
        initSubViews()
        addedSubViews()
        setConstraints()
    }
    func initSubViews(){ }
    func addedSubViews(){ }
    func setConstraints(){ }
}

    // Color set for Settings page views...
struct BaseColor {
    
    static func shareColor() -> UIColor {
        UIColor(red: 240/255, green: 237/255, blue: 251/255, alpha: 1)
    }
    static func shareIconColor() -> UIColor {
        UIColor(red: 109/255, green: 75/255, blue: 223/255, alpha: 1)
    }
    
    static func searchColor() -> UIColor {
        UIColor(red: 234/255, green: 254/255, blue: 230/255, alpha: 1)
    }
    static func searchIconColor() -> UIColor {
        UIColor(red: 117/255, green: 251/255, blue: 76/255, alpha: 1)
    }
    static func rateColor() -> UIColor {
        UIColor(red: 253/255, green: 241/255, blue: 231/255, alpha: 1)
    }
    static func rateIconColor() -> UIColor {
        UIColor(red: 236/255, green: 127/255, blue: 51/255, alpha: 1)
    }
    
    static func quitColor() -> UIColor {
        UIColor(red: 251/255, green: 228/255, blue: 232/255, alpha: 1)
    }
    static func quitIconColor() -> UIColor {
        UIColor(red: 234/255, green: 76/255, blue: 68/255, alpha: 1)
    }
    
    
}

struct BaseFonts {
    
    static func academyEngravedLetPlain(size: CGFloat) -> UIFont {
        UIFont(name: "AcademyEngravedLetPlain", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    static func alNile(size: CGFloat) -> UIFont {
        UIFont(name: "AlNile", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    static func alNile_Bold(size: CGFloat) -> UIFont {
        UIFont(name: "AlNile-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    static func chalkboardSE_Bold(size: CGFloat) -> UIFont {
        UIFont(name: "ChalkboardSE-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    static func americanTypewriter(size: CGFloat) -> UIFont {
        UIFont(name: "AmericanTypewriter", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func americanTypewriter_CondensedBold(size: CGFloat) -> UIFont {
        UIFont(name: "AmericanTypewriter-CondensedBold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    static func appleColorEmoji(size: CGFloat) -> UIFont {
        UIFont(name: "AppleColorEmoji", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func zapfino(size: CGFloat) -> UIFont {
        UIFont(name: "Zapfino", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func zapfDingbatsITC(size: CGFloat) -> UIFont {
        UIFont(name: "ZapfDingbatsITC", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func verdana(size: CGFloat) -> UIFont {
        UIFont(name: "Verdana", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func verdana_Bold(size: CGFloat) -> UIFont {
        UIFont(name: "Verdana-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func verdana_BoldItalic(size: CGFloat) -> UIFont {
        UIFont(name: "Verdana-BoldItalic", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func trebuchetMS(size: CGFloat) -> UIFont {
        UIFont(name: "TrebuchetMS", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func trebuchetMS_Bold(size: CGFloat) -> UIFont {
        UIFont(name: "TrebuchetMS-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func trebuchet_BoldItalic(size: CGFloat) -> UIFont {
        UIFont(name: "Trebuchet-BoldItalic", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func timesNewRomanPSMT(size: CGFloat) -> UIFont {
        UIFont(name: "TimesNewRomanPSMT", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func timesNewRomanPS_BoldMT(size: CGFloat) -> UIFont {
        UIFont(name: "TimesNewRomanPS-BoldMT", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func timesNewRomanPS_BoldItalicMT(size: CGFloat) -> UIFont {
        UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func thonburi(size: CGFloat) -> UIFont {
        UIFont(name: "Thonburi", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func thonburi_Bold(size: CGFloat) -> UIFont {
        UIFont(name: "Thonburi-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func tamilSangamMN(size: CGFloat) -> UIFont {
        UIFont(name: "TamilSangamMN", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func tamilSangamMN_Bold(size: CGFloat) -> UIFont {
        UIFont(name: "TamilSangamMN-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func snellRoundhand(size: CGFloat) -> UIFont {
        UIFont(name: "SnellRoundhand", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func snellRoundhand_Bold(size: CGFloat) -> UIFont {
        UIFont(name: "SnellRoundhand-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    static func noteworthy_Bold(size: CGFloat) -> UIFont {
        UIFont(name: "Noteworthy Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    
    
    static func regular(size: CGFloat) -> UIFont {
        UIFont(name: "Circe-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    static func extraBold(size: CGFloat) -> UIFont {
        UIFont(name: "Circe-ExtraBold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    static func bold(size: CGFloat) -> UIFont {
        UIFont(name: "Circe-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    static func light(size: CGFloat) -> UIFont {
        UIFont(name: "Circe-Light", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    static func extraLight(size: CGFloat) -> UIFont {
        UIFont(name: "Circe-ExtraLight", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
}


