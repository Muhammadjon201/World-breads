//
//  InfoViewController.swift
//  World breads
//
//  Created by ericzero on 11/29/22.
//

import UIKit
import SnapKit
import SDWebImage

class CardViewController: UIViewController {
    
    //var arr = [Info]()
    lazy var wd = UIScreen.main.bounds.width
    var leftPd: CGFloat = 20
    var interItemPd: CGFloat = 20

    
    let model = MyLocalData()
    lazy var arr = model.breadArr {
        didSet{
            collection.reloadData()
        }
    }
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = leftPd
        layout.minimumInteritemSpacing = leftPd
        layout.sectionInset = UIEdgeInsets(top: 0, left: leftPd, bottom: 0, right: leftPd)
        layout.collectionView?.indicatorStyle = .black
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)

        return cv
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setConstraints()
        setNavigationBar()
    }
    
    func setConstraints() {
        collection.delegate = self
        collection.dataSource = self
        collection.register(CardCollectionCell.self, forCellWithReuseIdentifier: "CardCollectionCell")
        
        view.addSubview(collection)
        
        collection.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // Navigation items..
    
    func setNavigationBar() {
        let myTitleLabel = UILabel()
        let attributedStr = NSAttributedString(string: "All Breads in Fold Card", attributes: [.font: BaseFonts.thonburi_Bold(size: 22), .foregroundColor: UIColor.white])
        myTitleLabel.attributedText = attributedStr
        navigationItem.titleView = myTitleLabel
        
    }

 }

extension CardViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "CardCollectionCell", for: indexPath) as! CardCollectionCell
            
        let obj = arr[indexPath.row]
        cell.foldView.shadowNumbers = 3
        cell.foldView.createConent(obj, size: makeSize(index: indexPath.row))
        cell.foldView.stars.r = Double(obj.rating ?? "") ?? 0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        let vc = OneItemViewController()
        
        vc.object = arr[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return makeSize(index: indexPath.row)
    }
    
    func makeSize(index: Int) -> CGSize {
        if (index+1)%3 != 0 {
            return CGSize(width: (wd-3*leftPd)/2, height: (wd-3*leftPd)/2)
        }
        return CGSize(width: wd-2*leftPd, height: (wd-3*leftPd)/2)
    }
    
    
}
    
