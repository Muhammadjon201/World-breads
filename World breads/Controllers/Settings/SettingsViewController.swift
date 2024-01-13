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

    let noResultsLabel: UILabel = {
        let label = UILabel()
        label.text = "No results found"
        label.textAlignment = .center
        label.textColor = .gray
        label.isHidden = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        createSubViews()
        navigationController?.navigationBar.tintColor = UIColor.black
    }

    // MARK: - UI Elements

    func initSubViews() {
        view.backgroundColor = .white

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsTableViewCell")
        
        // Add the noResultsLabel to the view
        view.addSubview(noResultsLabel)
    }

    func addedSubViews() {
        view.addSubview(tableView)
    }

    func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalToSuperview()
        }

        // Add constraints for the noResultsLabel
        noResultsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

    func createSubViews() {
        initSubViews()
        addedSubViews()
        setConstraints()
        configureSearchBar()
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return resultArr.count
        }
        return allArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell") as! SettingsTableViewCell
        var obj: Bread?
        if isSearching {
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
        var obj = Bread([String: AnyObject]())
        if isSearching {
            obj = resultArr[indexPath.row]
        } else {
            obj = allArr[indexPath.row]
        }
        vc.object = obj
        navigationController?.pushViewController(vc, animated: true)
    }

}

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {

    func configureSearchBar() {
        searchBar.sizeToFit()
        searchBar.endEditing(true)
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.textColor = .black
        searchBar.placeholder = " bread name"
        searchBar.searchTextField.leftView?.tintColor = .black
        self.searchBar.delegate = self
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Search"
        navigationController?.navigationBar.barStyle = .default
        showSearchBarButton(shouldShow: true)
    }

    @objc func handleShowSearchBar() {
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
        isSearching = !shouldShow
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
        resultArr = allArr.filter {
            $0.name?.range(of: searchText, options: .caseInsensitive) != nil
        }

        if searchText == "" {
            isSearching = false
        } else {
            isSearching = true
        }

        tableView.reloadData()

        // Update the visibility of the noResultsLabel based on the search results
        noResultsLabel.isHidden = !isSearching || resultArr.count > 0
    }
}
