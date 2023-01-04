//
//  WelcomeViewController.swift
//  World breads
//
//  Created by ericzero on 12/6/22.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    lazy var welcomeImg: UIImageView = {
        let welcomeImg = UIImageView()
        welcomeImg.contentMode = .scaleAspectFill
        welcomeImg.image = UIImage(named: "bread1")
        welcomeImg.clipsToBounds = true
        welcomeImg.layer.cornerRadius = 5
        
        return welcomeImg
    }()
    
    lazy var wLabel: UILabel = {
        let wLabel = UILabel()
        wLabel.numberOfLines = 1
        wLabel.textAlignment = .center
        wLabel.font = BaseFonts.verdana_Bold(size: 25)
        wLabel.text = "World Breads"
        wLabel.textColor = .systemPink
        
        return wLabel
    }()
    
    lazy var wButton: UIButton = {
        let wButton = UIButton()
        wButton.clipsToBounds = true
        wButton.layer.cornerRadius = 25
        wButton.setTitle("Enter", for: .normal)
        wButton.backgroundColor = .systemPink
        wButton.setTitleColor(.white, for: .normal)
        wButton.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return wButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
            setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setUp() {
  
        view.backgroundColor = .white
        view.addSubview(welcomeImg)
        view.addSubview(wLabel)
        view.addSubview(wButton)
        
        welcomeImg.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(300)
        }
        
        wLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeImg.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
        
        wButton.snp.makeConstraints { make in
            make.bottom.equalTo(-50)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(50)
        }
    }
    
    @objc func btnTapped () {
        let vc = TabBarController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    


}
