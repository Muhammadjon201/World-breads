//
//  CardViewController.swift
//  World breads
//
//  Created by ericzero on 11/29/22.
//

import UIKit

class InfoViewController: BaseViewController {
    
    let tableView = UITableView()
    
    lazy var backImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.backgroundColor = UIColor(red: 180/255, green: 13/255, blue: 34/255, alpha: 1)
        return view
    }()
    
    let model = InfoModel()
    lazy var arr = model.getInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUp()
        constraints()
        setNavigationBar()
    }
    
    func setUp() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: "InfoTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        tableView.addSubview(refreshControl)
        setRefreshControl(Refresh("loading...", .white, {
            print("End refreshing!")
        }))
        
        view.addSubview(backImageView)
        view.addSubview(tableView)
        view.addSubview(refreshControl)
        
    }
    
    func constraints() {
        backImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    // Navigation bar
    
    func setNavigationBar() {
        let myTitleLabel = UILabel()
        let attributedStr = NSAttributedString(string: "About Breads", attributes: [.font: BaseFonts.thonburi_Bold(size: 18), .foregroundColor: UIColor.black])
        myTitleLabel.attributedText = attributedStr
        navigationItem.titleView = myTitleLabel
    }
}

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        lazy var titleLabel: UILabel = {
            let view = UILabel()
            view.backgroundColor = .systemYellow
            view.font = BaseFonts.chalkboardSE_Bold(size: 28)
            view.textColor = .black
            view.textAlignment = .left
            view.numberOfLines = 0
            return view
        }()
        titleLabel.text = arr[section].title ?? ""
        return titleLabel

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr[section].contentArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell") as! InfoTableViewCell
        cell.selectionStyle = .none
        cell.updateCell(data: arr[indexPath.section].contentArr[indexPath.row])
        
        return cell
    }
}
