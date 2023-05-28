//
//  LaunchAnimationViewController.swift
//  World breads
//
//  Created by ericzero on 5/28/23.
//

import UIKit

class LaunchAnimationViewController: UIViewController {
    private let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
        animateImageView()
        view.backgroundColor = .white
    }
    
    private func setupImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "bread1")
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(200)
        }
    }
        
    private func animateImageView() {
        let containerView = UIView(frame: view.bounds)
        containerView.backgroundColor = .white
        
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(containerView)
        }
        view.addSubview(containerView)
        
        UIView.animate(withDuration: 0.6, delay: 0.0, options: .curveEaseInOut, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0) // Zoom in
        }) { (_) in
            UIView.animate(withDuration: 0.6, delay: 0.0, options: .curveEaseInOut, animations: {
                self.imageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8) // Zoom out
            }) { (_) in
                UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                    self.imageView.transform = CGAffineTransform(translationX: 0, y: 60) // Move down
                }) { (_) in
                    UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
                        self.imageView.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height) // Move up
                    }) { (_) in
                        let nextViewController = TabBarController()
                        nextViewController.modalPresentationStyle = .fullScreen
                        self.present(nextViewController, animated: true) {
                            containerView.removeFromSuperview()
                        }
                    }
                }
            }
        }
    }
}
