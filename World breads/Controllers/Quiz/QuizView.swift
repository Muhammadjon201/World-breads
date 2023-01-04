//
//  QuizView.swift
//  World breads
//
//  Created by ericzero on 12/10/22.
//

import UIKit

class QuizView: BaseView {
    
    let l = 10
    let r = 70
    
    lazy var topImg: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    lazy var quizLabel: UILabel = {
        let view = UILabel()
        view.font = BaseFonts.light(size: 16)
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    lazy var containerView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .clear
        view.distribution = .fillEqually
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    lazy var variantA: VariantButton = {
        let view = VariantButton()
        view.variantButton.layer.maskedCorners = [ .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        view.variantButton.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.left.equalTo(l)
            make.right.equalTo(-r)
        }
        return view
    }()
    lazy var variantB: VariantButton = {
        let view = VariantButton()
        view.variantButton.layer.maskedCorners = [ .layerMinXMinYCorner, .layerMaxXMaxYCorner]
        view.variantButton.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.left.equalTo(r)
            make.right.equalTo(-l)
        }
        return view
    }()
    lazy var variantC: VariantButton = {
        let view = VariantButton()
        view.variantButton.layer.maskedCorners = [ .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        view.variantButton.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.left.equalTo(l)
            make.right.equalTo(-r)
        }
        return view
    }()
    lazy var variantD: VariantButton = {
        let view = VariantButton()
        view.variantButton.layer.maskedCorners = [ .layerMinXMinYCorner, .layerMaxXMaxYCorner]
        view.variantButton.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.left.equalTo(r)
            make.right.equalTo(-l)
        }
        return view
    }()
    
    override func initSubViews() {
        
    }
    
    override func addedSubViews() {
        addSubview(topImg)
        addSubview(quizLabel)
        addSubview(containerView)
        containerView.addArrangedSubview(variantA)
        containerView.addArrangedSubview(variantB)
        containerView.addArrangedSubview(variantC)
        containerView.addArrangedSubview(variantD)
        
    }
    
    override func setConstraints() {
       
        topImg.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(topImg.snp.width).multipliedBy(0.8)
        }
        quizLabel.snp.makeConstraints { make in
            make.top.equalTo(topImg.snp.bottom).offset(10)
            make.left.equalTo(5)
            make.right.equalTo(-5)
        }
        containerView.snp.makeConstraints { make in
            make.top.equalTo(quizLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(-20)
        }
        
    }
    
    func createContent(quiz: QuizModel){
        quizLabel.text = "\(quiz.num ?? 0). Find the name of the food in this picture, which is originally from \(quiz.object?.loc ?? "")."
        topImg.sd_setImage(with: URL(string: quiz.object?.img ?? ""), placeholderImage: UIImage(named: "placeholder"))
        
        let arr = quiz.ansArr.shuffled()
        if   quiz.ansArr.count == 4 {
            variantA.variantButton.setAttributedTitle(attStr(arr[0].name ?? ""), for: .normal)
            variantB.variantButton.setAttributedTitle(attStr(arr[1].name ?? ""), for: .normal)
            variantC.variantButton.setAttributedTitle(attStr(arr[2].name ?? ""), for: .normal)
            variantD.variantButton.setAttributedTitle(attStr(arr[3].name ?? ""), for: .normal)
            
            variantA.variantButton.tag = 100
            variantB.variantButton.tag = 101
            variantC.variantButton.tag = 102
            variantD.variantButton.tag = 103
        }
        print("==//==//==//====//====//====//====//==\n",quiz.object?.name ?? "")
    }
    
    func attStr(_ str: String) -> NSAttributedString {
        var string = ""
        var k = 0
        for i in str {
            string.append(i)
            k += 1
            if k == 20 { break }
        }
        return NSAttributedString(string: string, attributes: [.font: BaseFonts.chalkboardSE_Bold(size: 22)])
    }
    
}
