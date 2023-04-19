//
//  HomeViewController.swift
//  World breads
//
//  Created by ericzero on 11/29/22.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    let tableView = UITableView()
    
    let model = MyLocalData()
    lazy var breadsArr = model.breadArr
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setNavigationBar()
        setConstaints()
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    func setConstaints() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeCell")
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.left.right.bottom.equalTo(0)
        }
    }
    
    func setNavigationBar() {
        let myTitleLabel = UILabel()
        let attributedStr = NSAttributedString(string: "Top Breads WorldWide", attributes: [.font: BaseFonts.thonburi_Bold(size: 18), .foregroundColor: UIColor.black])
        myTitleLabel.attributedText = attributedStr
        navigationItem.titleView = myTitleLabel
        
    }
}

// MARK: - TABLEVIEW

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breadsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeTableViewCell
        cell.createContent(breadsArr[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = OneItemViewController()
        vc.object = breadsArr[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}





