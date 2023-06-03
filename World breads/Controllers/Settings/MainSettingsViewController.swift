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
        hStack1.distribution = .fillEqually
        hStack1.spacing = 10
        hStack1.alignment = .center
        return hStack1
    }()
    
    lazy var hStack2: UIStackView = {
        let hStack2 = UIStackView()
        hStack2.axis = .horizontal
        hStack2.distribution = .fillEqually
        hStack2.spacing = 10
        hStack2.alignment = .center
        return hStack2
    }()
    
    
    lazy var vStack: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.distribution = .fillEqually
        vStack.alignment = .center
        return vStack
    }()
    
    lazy var shareView: CustomView = {
        let shareView = CustomView()
        shareView.makeDesignContent(color: BaseColor.shareIconColor(), iconName: "share", text: "Share")
        shareView.topButton.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
        return shareView
    }()
    
    lazy var searchView: CustomView = {
        let searchView = CustomView()
        searchView.makeDesignContent(color: BaseColor.searchIconColor(), iconName: "search", text: "Search Item")
        searchView.topButton.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
        return searchView
    }()
    
    lazy var rateView: CustomView = {
        let rateView = CustomView()
        rateView.makeDesignContent(color: BaseColor.rateIconColor(), iconName: "rating", text: "Rate App")
        rateView.topButton.addTarget(self, action: #selector(rateTapped), for: .touchUpInside)
        return rateView
    }()
    
    lazy var quitAppView: CustomView = {
        let quitApp = CustomView()
        quitApp.makeDesignContent(color: BaseColor.quitIconColor(), iconName: "log-out", text: "Quit App")
        quitApp.descLabel.text = "Developer"
        quitApp.topButton.addTarget(self, action: #selector(quitTapped), for: .touchUpInside)
        return quitApp
    }()
    
    // MARK: - Button Implementations..
    
    @objc func contactBtnTapped(){
        if let url = URL(string: "https://www.linkedin.com/in/mamarasulov-muhammadjon-562b29201/") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func shareTapped() {
        let  id = 235385347689374
        let vc = UIActivityViewController(activityItems: ["https://apps.apple.com/\(id)"], applicationActivities: nil)
        vc.popoverPresentationController?.sourceView = self.view
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @objc func searchTapped() {
        let vc = SearchViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func rateTapped() {
        let vc = RateAppViewController()
        
        let savedRating = UserDefaults.standard.integer(forKey: "AppRating")
        vc.selectedRating = savedRating
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func quitTapped() {
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
        let attributedStr = NSAttributedString(string: "Main Settings", attributes: [.font: BaseFonts.thonburi_Bold(size: 18), .foregroundColor: UIColor.black])
        myTitleLabel.attributedText = attributedStr
        navigationItem.titleView = myTitleLabel
        
    }
    
    func tableViewSetUp() {
        bottomTableV.delegate = self
        bottomTableV.dataSource = self
        bottomTableV.register(MainSettingsTableViewCell.self, forCellReuseIdentifier: "MainSettingsTableViewCell")
        
        bottomArr.append(MyData(name: "    This application is called \"Learning World Breads\" and contains very interesting and useful information. In the Home section of this application, you can get acquainted with the hundred most famous breads in the world, as well as their type, origin, bright image and a detailed review. Through the app, you can get information about several different types of breads and foods. The app also includes favourite, cards, information and settings section, which not only makes it easier for users to use the app, but also improves the functionality of the app. We will add some interesting features to the app and keep you updated!  Please share it with others and rate it. If you have any questions or suggestions to improve application, please contact the developer. \n\nWe wish you have an interesting stay!"))
    }
        
    func initViews(){
        addedSubviews()
        setConstraints()
    }
    
    func addedSubviews(){
        view.addSubview(vStack)
        vStack.addArrangedSubview(hStack1)
        vStack.addArrangedSubview(hStack2)
        hStack1.addArrangedSubview(shareView)
        hStack1.addArrangedSubview(searchView)
        hStack2.addArrangedSubview(rateView)
        hStack2.addArrangedSubview(quitAppView)
        view.addSubview(bottomTableV)
        
    }
    
    func setConstraints(){
        
        shareView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(130)
            make.width.equalTo(120)
        }

        searchView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(130)
            make.width.equalTo(120)

        }

        rateView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(130)
            make.width.equalTo(120)

        }

        quitAppView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(130)
            make.width.equalTo(120)
        }
        
        vStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(view.snp.height).multipliedBy(0.4)
        }
        
        bottomTableV.snp.makeConstraints { make in
            make.top.equalTo(vStack.snp.bottom).offset(20)
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
        fullView.backgroundColor = color.withAlphaComponent(0.3)
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

