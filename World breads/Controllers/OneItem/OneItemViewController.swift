//
//  OneItemViewController.swift
//  World breads
//
//  Created by ericzero on 12/8/22.
//

import UIKit

class OneItemViewController: BaseViewController {
    
    let optionsView = OneItemView()
    var object: Bread?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        createSubViews()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
//        setTabItem(title: "Settings", img: "settings1", sImg: "settings")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:  - UI Elements
extension OneItemViewController {
    func initSubViews(){
        view.backgroundColor = .white
        guard let obj = object else { return }
        optionsView.createContent(obj)
        
    }
    func addedSubViews(){
        view.addSubview(optionsView)
    }
    func setConstraints(){
        optionsView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    func createSubViews(){
        initSubViews()
        addedSubViews()
        setConstraints()
    }
}
// MARK:  - Functions
extension OneItemViewController {

    @objc func searchClicked(){
        print("Search")
    }

}

