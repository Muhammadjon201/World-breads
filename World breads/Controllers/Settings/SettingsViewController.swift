//
//  SettingsViewController.swift
//  World breads
//
//  Created by ericzero on 11/29/22.
//

import UIKit
import SnapKit
import SDWebImage

class SettingsViewController: UIViewController {
    
    let searchBar = UISearchBar()
    var searching = false
    lazy var filteredData = [Bread]()
    
    let model = MyLocalData()
    lazy var settingsArr = model.breadArr
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setNavigationBar()
        setUp()
        constraints()
        
        navigationItem.hidesBackButton = true
    }
    
    func setUp() {
        
        searchBar.delegate = self
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.textColor = .black
        searchBar.placeholder = "Search breads"
    
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsTableViewCell")
        tableView.separatorStyle = .none
    }
    
    func constraints() {
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalTo(0)
        }
    }
    
    func setNavigationBar() {
        let myTitleLabel = UILabel()
        let attributedStr = NSAttributedString(string: "Top", attributes: [.font: BaseFonts.thonburi_Bold(size: 22), .foregroundColor: UIColor.white])
        myTitleLabel.attributedText = attributedStr
        navigationItem.titleView = searchBar//myTitleLabel
        
    }
}

// MARK: - TABLEVIEW

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching == true {
            return filteredData.count
        }else{
            return settingsArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell") as! SettingsTableViewCell
        if searching {
            cell.updateCell(data: filteredData[indexPath.row])
        }else{
            cell.updateCell(data: settingsArr[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - SEARCH BAR..

extension SettingsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var myFilteredArr = [String]()
        filteredData = settingsArr.filter({
            $0.name?.range(of: searchText, options: .caseInsensitive) != nil
        })
        searching = true
        tableView.reloadData()
    }
    
}
