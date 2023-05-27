//
//  TabBarController.swift
//  World breads
//
//  Created by ericzero on 12/3/22.
//

import UIKit

class TabModel {
    var name: String
    var icon: String
    var selIcon: String
    
    init(name: String, icon: String, selIcon: String){
        self.name = name
        self.icon = icon
        self.selIcon = selIcon
    }
}

class TabBarController: UITabBarController {

    lazy var tabArr = [
        TabModel(name: "Home", icon: "home", selIcon: "home"),
        TabModel(name: "Card", icon: "credit-card", selIcon: "credit-card"),
        TabModel(name: "Info", icon: "info", selIcon: "info"),
        TabModel(name: "Settings", icon: "settings", selIcon: "settings"),
    ]
    
    lazy var vcArr = [
        HomeViewController(),
        CardViewController(),
        InfoViewController(),
        MainSettingsViewController(),
    ]
    
    lazy var tabItemsArr = [
        makeTabItem(tabArr[0]),
        makeTabItem(tabArr[1]),
        makeTabItem(tabArr[2]),
        makeTabItem(tabArr[2])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationAdd()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func navigationAdd() {
        var navArr = [UINavigationController]()
        for i in 0..<vcArr.count {
            vcArr[i].tabBarItem = tabItemsArr[i]
            navArr.append(UINavigationController(rootViewController: vcArr[i]))
        }
        viewControllers = navArr
   }
    
    func makeTabItem(_ tabModel: TabModel) -> UITabBarItem {
        let size: CGFloat = 25
        return UITabBarItem.init(title: tabModel.name,image: UIImage.resizeImage(named: tabModel.icon, h: size, w: size),selectedImage: UIImage.resizeImage(named: tabModel.selIcon, h: size, w:size).tint(UIColor(patternImage: UIImage(named: "bg4") ?? UIImage()))
        )
    }

}

extension UIImage {
    static func resizeImage(named: String, h: CGFloat, w: CGFloat) -> UIImage {
        guard let image = UIImage(named: named) else { return UIImage() }
        let targetSize = CGSize(width: w, height: h)
        let size = image.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
        UIGraphicsEndImageContext()
        return newImage
    }
}

extension UIImage {

    func tint(_ tintColor: UIColor?) -> UIImage {
        guard let tintColor = tintColor else { return self }
        return modifiedImage { context, rect in
            context.setBlendMode(.multiply)
            context.clip(to: rect, mask: self.cgImage!)
            tintColor.setFill()
            context.fill(rect)
        }
    }

    private func modifiedImage( draw: (CGContext, CGRect) -> ()) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return self }
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        draw(context, rect)
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return self }
        return newImage
    }
}




