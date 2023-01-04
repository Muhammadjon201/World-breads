//
//  BaseView.swift
//  World breads
//
//  Created by ericzero on 12/8/22.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        createSubViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubViews(){
        initSubViews()
        addedSubViews()
        setConstraints()
    }
    func initSubViews(){ }
    func addedSubViews(){ }
    func setConstraints(){ }
}
