//
//  SettingsViewController.swift
//  World breads
//
//  Created by ericzero on 11/29/22.
//

import UIKit
import SnapKit
import SDWebImage

class SearchViewController: UIViewController {
    
    let model = MyLocalData()
    
    lazy var allArr = model.breadArr
    
    let tableView = UITableView()
    let searchBar = UISearchBar()
    var isSearching = false
    var resultArr = [Bread]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSubViews()
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

// MARK:  - UI Elements
extension SearchViewController {
    func initSubViews(){
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsTableViewCell")
        
    }
    func addedSubViews(){
        view.addSubview(tableView)
        
    }
    func setConstraints(){
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalToSuperview()
        }
    }
    func createSubViews(){
        initSubViews()
        addedSubViews()
        setConstraints()
        configureSearchBar()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching == true {
            return resultArr.count
        }
        return allArr.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell") as! SettingsTableViewCell
        var obj: Bread?
        if isSearching == true {
            obj = resultArr[indexPath.row]
        } else {
            obj = allArr[indexPath.row]
        }
        cell.updateCell(data: obj!)
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = OneItemViewController()
        var obj = Bread([String : AnyObject]())
        if isSearching == true {
            obj = resultArr[indexPath.row]
        } else {
            obj = allArr[indexPath.row]
        }
        vc.object = obj
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK:  -UISearchBarDelegate Metods

extension SearchViewController: UISearchBarDelegate {
    func configureSearchBar() {
        searchBar.sizeToFit()
        searchBar.endEditing(true)
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.textColor = .black
        searchBar.placeholder = " write city name"
        searchBar.searchTextField.leftView?.tintColor = .black
        self.searchBar.delegate = self
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Search"
        navigationController?.navigationBar.barStyle = .default
        showSearchBarButton(shouldShow: true)
    }
    
    @objc func handleShowSearchBar () {
        search(shouldShow: true)
        searchBar.becomeFirstResponder()
    }
   
    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        isSearching = !isSearching
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
        searchBar.text = ""
        isSearching = false
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let model = MyLocalData()
        resultArr = model.breadArr.filter({
         $0.name?.range(of: searchText, options: .caseInsensitive) != nil
        })
        if searchText == "" {
            isSearching = false
        } else {
            isSearching = true
        }
        tableView.reloadData()
    }
}
