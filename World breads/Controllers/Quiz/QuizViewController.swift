//
//  QuizViewController.swift
//  World breads
//
//  Created by ericzero on 11/29/22.
//

import UIKit

class QuizViewController: BaseViewController {

    let defaults = UserDefaults.standard
    
    lazy var backImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .lightGray
        return view
    }()
    lazy var resultLabel: PaddingLabel = {
        let view = PaddingLabel()
        view.font = BaseFonts.light(size: 16)
        view.backgroundColor = .red
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        view.text = "\(result ?? 0) / \(index ?? 0)"
        view.padding(10, 10, 10, 10)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    lazy var quizView = QuizView()
    var quizArray = [QuizModel]()
    var index: Int?
    var result: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSubViews()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //if navigationController?.viewControllers.count == 1 {
        if self.quizArray.count == 0{
          print("Hello First")
            let model = MyLocalData()
            self.quizArray = model.quizArr
            self.index = 0
            self.result = 0
            if let a = index {
                quizView.createContent(quiz: quizArray[a])
            }
        } else {
            if let a = index {
                quizView.createContent(quiz: quizArray[a])
            }
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setTabItem(title: "Quiz", img: "puzzle1", sImg: "puzzle")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:  - UI Elements
extension QuizViewController {
    func initSubViews(){
        
        quizView.variantA.variantButton.addTarget(self, action: #selector(variantClicked), for: .touchUpInside)
        quizView.variantB.variantButton.addTarget(self, action: #selector(variantClicked), for: .touchUpInside)
        quizView.variantC.variantButton.addTarget(self, action: #selector(variantClicked), for: .touchUpInside)
        quizView.variantD.variantButton.addTarget(self, action: #selector(variantClicked), for: .touchUpInside)
    }
    func addedSubViews(){
        view.addSubview(backImageView)
        view.addSubview(quizView)
        view.addSubview(resultLabel)
    }
    func setConstraints(){
        backImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        quizView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.right.equalTo(-20)
        }
    }
    func setNavItems(){
        setNav(NavItemProperty(title: "Fun Quiz",
                               tintColor: .black,
                               font: BaseFonts.thonburi_Bold(size: 18),
                               leftImg: "left",
                               rightImg: "star",
                               leftFunc: {
            self.navigationController?.popViewController(animated: true)
                                }, rightFunc: {
                                    self.showAlert("Top scores", "First place: \(10) Points.\nSecond place: \(9) Points.\nThird place: \(8) Points.", [AlertActions("OK", {
                                        self.dismiss(animated: true, completion: nil)
                                    })])
                                }))
    }
    func createSubViews(){
        initSubViews()
        addedSubViews()
        setConstraints()
        setNavItems()
    }
}

// MARK:  - Functions
extension QuizViewController {
    
    
    @objc func variantClicked(_ sender: UIButton){
        guard let a = index else {
            return
        }
        guard let r = result else {
            return
        }
        if sender.titleLabel?.text == quizArray[a].object?.name {
            result = r+1
        }
        if a < 9 {
            let vc = QuizViewController()
            vc.quizArray = self.quizArray
            vc.index = a + 1
            vc.result = result
            navigationController?.pushViewController(vc, animated: true)
        } else {
            resultLabel.text = "\(result ?? 0) / \(quizArray.count)"
            let title = ((result ?? 0) < 5) ? "Unfortunately" : "YOU WIN!"
            let desc = "Congratulations! You answered \(result ?? 0) out of \(quizArray.count) questions correctly."
            showAlert(title, desc, [AlertActions("Restart", {
                let root = QuizViewController()
                self.navigationController?.setViewControllers([root], animated: false)
            })])
        }
    }
    
}



