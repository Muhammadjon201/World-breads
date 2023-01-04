//
//  BaseModels.swift
//  World breads
//
//  Created by ericzero on 12/7/22.
//

import UIKit

class Refresh {
    var title: String?
    var tintColor: UIColor?
    var function: () -> Any
    init (_ t: String, _ tc: UIColor, _ f: @escaping () -> ()) {
        self.tintColor = tc
        self.function = f
    }
}

class AlertActions {
    var title: String?
    var function: () -> Any
    init (_ t: String, _ f: @escaping () -> ()) {
        self.title = t
        self.function = f
    }
}

class NavItemProperty {
    var title: String?
    var tintColor: UIColor?
    var font: UIFont?
    var leftImg: String?
    var rightImg: String?
    var leftFunc: () -> Any
    var rightFunc: () -> Any
    
    init (title: String, tintColor: UIColor, font: UIFont, leftImg: String, rightImg: String,  leftFunc: @escaping () -> (), rightFunc: @escaping () -> ()) {
        self.title = title
        self.tintColor = tintColor
        self.font = font
        self.leftImg = leftImg
        self.rightImg = rightImg
        self.leftFunc = leftFunc
        self.rightFunc = rightFunc
    }
}

