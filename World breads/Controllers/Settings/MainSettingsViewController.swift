//
//  MainSettingsViewController.swift
//  World breads
//
//  Created by ericzero on 12/2/22.
//

import UIKit
import SnapKit

class MainSettingsViewController: UIViewController {

    // TableView stuff..
    var bottomArr = [MyData]()
        
    lazy var bottomTableV: UITableView = {
        let bottomTableV = UITableView()
        return bottomTableV
    }()
    
    lazy var hStack1: UIStackView = {
        let hStack1 = UIStackView()
        hStack1.axis = .horizontal
        hStack1.spacing = 60
        hStack1.distribution = .fillEqually
        hStack1.alignment = .center
        return hStack1
    }()
    
    lazy var searchView: CustomView = {
        let searchView = CustomView()
        searchView.makeDesignContent(color: BaseColor.searchIconColor(), iconName: "search", text: "Search Item")
        searchView.topButton.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
        return searchView
    }()
    
    lazy var contactDev: CustomView = {
        let contactDev = CustomView()
        contactDev.makeDesignContent(color: BaseColor.quitIconColor(), iconName: "log-out", text: "Quit App")
        contactDev.descLabel.text = "Developer"
        contactDev.topButton.addTarget(self, action: #selector(contactTapped), for: .touchUpInside)
        return contactDev
    }()
    
    // MARK: - Button Implementations..
    
    @objc func searchTapped() {
        let vc = SearchViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func contactTapped() {
        let alert = UIAlertController(title: "Want to contact developer?", message: "If you have a question or suggestion to improve the application, You can contact the developer", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Contact", style: .default, handler: { _ in
            if let url = URL(string: "https://www.linkedin.com/in/mamarasulov-muhammadjon-562b29201/") {
                UIApplication.shared.open(url)
            }
        }))
        alert.addAction(UIAlertAction(title: "Later", style: .destructive, handler: nil))
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetUp()
        view.backgroundColor = .white
        initViews()
        setNavigationBar()
    }
    
    // Navigation Settings..
    
    func setNavigationBar() {
        let myTitleLabel = UILabel()
        let attributedStr = NSAttributedString(string: "Main Settings", attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.black])
        myTitleLabel.attributedText = attributedStr
        navigationItem.titleView = myTitleLabel
        
    }
    
    func tableViewSetUp() {
        bottomTableV.delegate = self
        bottomTableV.dataSource = self
        bottomTableV.showsVerticalScrollIndicator = false
        bottomTableV.register(MainSettingsTableViewCell.self, forCellReuseIdentifier: "MainSettingsTableViewCell")
        
        bottomArr.append(MyData(name: "    This application is called \"Learning World Breads\" and contains very interesting and useful information. In the Home section of this application, you can get acquainted with the hundred most famous breads in the world, as well as their type, origin, bright image and a detailed review. Through the app, you can get information about several different types of breads and foods. The app also includes favourite, cards, information and settings section, which not only makes it easier for users to use the app, but also improves the functionality of the app. We will add some interesting features to the app and keep you updated!  Please share it with others and rate it. If you have any questions or suggestions to improve application, please contact the developer. \n\nWe wish you have an interesting stay!"))
    }
        
    func initViews(){
        addedSubviews()
        setConstraints()
    }
    
    func addedSubviews(){
        view.addSubview(hStack1)
        hStack1.addArrangedSubview(contactDev)
        hStack1.addArrangedSubview(searchView)
    
        view.addSubview(bottomTableV)
        
    }
    
    func setConstraints(){
        
        hStack1.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(70)
            make.centerX.equalToSuperview()
        }

        searchView.snp.makeConstraints { make in
            make.height.equalTo(130)
            make.width.equalTo(120)

        }

        contactDev.snp.makeConstraints { make in
            make.height.equalTo(130)
            make.width.equalTo(120)
        }
        
        
        bottomTableV.snp.makeConstraints { make in
            make.top.equalTo(hStack1.snp.bottom).offset(70)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
}
    
extension MainSettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bottomArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainSettingsTableViewCell") as! MainSettingsTableViewCell
        cell.updateCell(info: bottomArr[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: - Custom class for Main Setttings Page..

class CustomView: UIView {
    
    lazy var fullView: UIView = {
        let fullView = UIView()
        fullView.clipsToBounds = true
        fullView.layer.cornerRadius = 10
        return fullView
    }()

    lazy var topButton: UIButton = {
        let buttonView = UIButton()
        return buttonView
    }()

    lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFill
        iconView.clipsToBounds = true
        return iconView
    }()
    
    lazy var descLabel: UILabel = {
        let descLabel = UILabel()
        descLabel.numberOfLines = 1
        descLabel.textAlignment = .center
        descLabel.font = .systemFont(ofSize: 17, weight: .bold)
        return descLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    func makeDesignContent(color: UIColor, iconName: String, text:  String){
        descLabel.text = text
        iconView.image = UIImage(named: iconName)?.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = color
        descLabel.textColor = color
        fullView.backgroundColor = color.withAlphaComponent(0.5)
    }
    
    func setUp() {
        addSubview(fullView)
        fullView.addSubview(topButton)
        topButton.addSubview(iconView)
        topButton.addSubview(descLabel)
    
        fullView.snp.makeConstraints { make in
            make.height.equalTo(130)
            make.width.equalTo(120)
        }
        
        topButton.snp.makeConstraints { make in
            make.edges.equalTo(fullView)
        }
        
        iconView.snp.makeConstraints { make in
            make.centerX.equalTo(fullView)
            make.top.equalTo(40)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        descLabel.snp.makeConstraints { make in
            make.centerX.equalTo(fullView)
            make.top.equalTo(iconView.snp.bottom).offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

