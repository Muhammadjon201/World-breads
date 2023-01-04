//
//  BaseExtensions.swift
//  World breads
//
//  Created by ericzero on 12/10/22.
//

import UIKit

extension UIImage {
    static func gradientImage(bounds: CGRect, colors: [UIColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { ctx in
            gradientLayer.render(in: ctx.cgContext)
        }
    }
}

extension UIViewController {
    
    func setTabItem(title: String, img: String, sImg: String) {
        let s: CGFloat = 25
        self.tabBarItem = UITabBarItem.init(title: title, image: UIImage.resizeImage(named: img, h: s, w: s), selectedImage: UIImage.resizeImage(named: sImg, h: s, w: s))
    }
}
