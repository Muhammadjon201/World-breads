//
//  RateAppViewController.swift
//  World breads
//
//  Created by ericzero on 5/28/23.
//

import UIKit

class RateAppViewController: UIViewController {

    private let starSize: CGFloat = 40
    var selectedRating: Int = 0
    
    private lazy var submitButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Submit", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor(red: 252/255, green: 60/255, blue: 68/255, alpha: 1)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        return btn
    }()
       
    lazy var rateLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Please rate the app"
        return lbl
    }()
    
       override func viewDidLoad() {
           super.viewDidLoad()
           
           setConstraints()
       }
    
    private func setConstraints(){
        view.backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        
        for index in 1...5 {
            let starButton = UIButton(type: .system)
            starButton.tag = index
            starButton.setImage(UIImage(systemName: "star"), for: .normal)
            starButton.tintColor = .gray
            starButton.addTarget(self, action: #selector(starButtonTapped(_:)), for: .touchUpInside)
            
            starButton.snp.makeConstraints { make in
                make.width.height.equalTo(starSize)
            }
            
            stackView.addArrangedSubview(starButton)
        }
        
        view.addSubview(stackView)
        view.addSubview(submitButton)
        view.addSubview(rateLbl)
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
        
        rateLbl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(stackView).offset(-70)
        }
    }
    
    @objc private func submitButtonTapped(){
        UserDefaults.standard.set(selectedRating, forKey: "AppRating")
        self.navigationController?.popViewController(animated: true)
    }
       
    @objc private func starButtonTapped(_ sender: UIButton) {
        let rating = sender.tag
           
           // Update star colors based on the selected rating
        for subview in sender.superview!.subviews {
            if let starButton = subview as? UIButton {
                if starButton.tag <= rating {
                       starButton.tintColor = .systemYellow
                } else {
                       starButton.tintColor = .gray
                }
            }
        }
           
        selectedRating = rating
    }
}
