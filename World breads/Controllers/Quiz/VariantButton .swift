//
//  VariantButton .swift
//  World breads
//
//  Created by ericzero on 12/10/22.
//

import UIKit

class VariantButton: BaseView {
    
    lazy var variantButton: UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.baseBackgroundColor = .clear
        filled.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let button = UIButton(configuration: filled, primaryAction: nil)
        button.layer.borderWidth = 3
        button.clipsToBounds = true
        button.backgroundColor = UIColor(red: 123/255, green: 155/255, blue: 15/255, alpha: 1)
        return button
    }()
    
    lazy var colors: [UIColor] = [.systemOrange, .red, .systemOrange, .systemYellow, .red, .systemOrange]
    
    override func layoutSubviews() {
        let gradient = UIImage.gradientImage(bounds: self.bounds, colors: colors)
        let gradientColor = UIColor(patternImage: gradient)
        variantButton.layer.borderColor = gradientColor.cgColor
        variantButton.layer.cornerRadius = self.bounds.height/2
    }
    
    override func initSubViews() {
        
    }
    override func addedSubViews() {
        addSubview(variantButton)
    }
    override func setConstraints() {
        
    }
}



