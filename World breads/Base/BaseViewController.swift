//
//  BaseViewController.swift
//  World breads
//
//  Created by ericzero on 12/7/22.
//

import UIKit
import SnapKit
import SDWebImage
import MBProgressHUD

class BaseViewController: UIViewController {
    
    let refreshControl = UIRefreshControl()
    var baseNavItem: NavItemProperty?
    var refreshAction: Refresh?

    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

extension BaseViewController {
    
    func setRefreshControl(_ ref: Refresh) {
        refreshAction = ref
        refreshControl.attributedTitle = NSAttributedString(string: ref.title ?? "loading...", attributes: [.foregroundColor: UIColor.white])
        refreshControl.tintColor = ref.tintColor
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    @objc func refresh(_ sender: UIRefreshControl) {
        _ = refreshAction?.function()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.6) {
            self.refreshControl.endRefreshing()
        }
    }
    
    func loading(_ show:Bool)->Void{
        if show{
            MBProgressHUD.showAdded(to: self.view, animated: true)
        } else{
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    func showAlert(_ title: String, _ message: String, _ actions: [AlertActions] ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for item in actions {
            alert.addAction(UIAlertAction(title: item.title, style: .default, handler: { action in
                print("Alert action used!",item.function())
            }))
        }
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension BaseViewController {
    
    func setNav(_ navItem: NavItemProperty) {
        baseNavItem = navItem
        let titleLabel = UILabel()
        let atributedTitle = NSAttributedString(string: navItem.title ?? "",attributes: [.foregroundColor: navItem.tintColor ?? .white, .font: navItem.font ?? ""])
        titleLabel.attributedText = atributedTitle
        self.navigationItem.titleView = titleLabel
        
        let leftImage = UIImage(named: navItem.leftImg ?? "")?.withRenderingMode(.alwaysTemplate)
        let leftBarBtn = UIBarButtonItem(image: leftImage,
                                         style: .plain,
                                         target: self,
                                         action: #selector(leftClicked))
        leftBarBtn.tintColor = navItem.tintColor ?? .white
        self.navigationItem.leftBarButtonItem = leftBarBtn
        
        let rightImage = UIImage(named: navItem.rightImg ?? "")?.withRenderingMode(.alwaysTemplate)
        let rightBarBtn = UIBarButtonItem(image: rightImage,
                                          style: .plain,
                                          target: self,
                                          action: #selector(rightClicked))
        rightBarBtn.tintColor = navItem.tintColor ?? .white
        self.navigationItem.rightBarButtonItem = rightBarBtn
    }
    @objc func leftClicked(_ sender: UIButton) {
        _ = baseNavItem?.leftFunc()
    }
    @objc func rightClicked(_ sender: UIButton) {
        _ = baseNavItem?.rightFunc()
    }
}
