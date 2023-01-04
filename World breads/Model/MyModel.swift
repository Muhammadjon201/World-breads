//
//  MyModel.swift
//  World breads
//
//  Created by ericzero on 11/29/22.
//

import UIKit


class MyLocalData {
    
    var breadArr = [Bread]()
    var typesArr = [String]()
    var locArr = [String]()
    
    var quizArr = [QuizModel]()
    let arrType = ["Flatbread", "Bread", "Breakfast", "Rusk", "Sandwich type", "Sweet Pastry", "Street Food"]
    
    init() {
        
        parse()
        quizArr = createQuiz(numQue: 10, sourceArr: breadArr)

    }
    
    func createQuiz(numQue: Int, sourceArr: [Bread]) -> [QuizModel]{
        var quizArr1 = [QuizModel]()
        for i in 0...numQue-1{
            let newObj = sourceArr.randomElement() ?? Bread([String : AnyObject]())
            var ansArr = [newObj]
            if i == 0 {
                ansArr = createVariants(numVar: 4, newObj: newObj, sourceArr: sourceArr)
                if ansArr.count == 4 {
                    quizArr1 = [QuizModel(n: i+1, obj: newObj, arr: ansArr)]
                }
            }
            if quizArr1.contains(where: {$0.object?.name != newObj.name}) == true {
                ansArr = createVariants(numVar: 4, newObj: newObj, sourceArr: sourceArr)
                if ansArr.count == 4 {
                    quizArr1.append(QuizModel(n: i+1, obj: newObj, arr: ansArr))
                }
            }
        }
        return quizArr1
    }
    
    func createVariants(numVar: Int, newObj: Bread, sourceArr: [Bread]) -> [Bread]{
        var ansArr = [newObj]
        while ansArr.count != numVar {
            let newVar = sourceArr.randomElement() ?? Bread([String : AnyObject]())
            if ansArr.contains(where: {$0.name != newVar.name}) == true {
                ansArr.append(newVar)
            }
        }
        if ansArr.count == numVar {
            return ansArr
        }
        return ansArr
    }
    
    func parse() {
        guard let path = Bundle.main.path(forResource: "breads", ofType: "json") else { return }
        let myURL = URL(fileURLWithPath: path)
        
        if let data = try? Data(contentsOf: myURL) {
            do {
                if let jsonArr = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: AnyObject]] {
                    for item in jsonArr {
                        breadArr.append(Bread(item))
                    }
                }
            }
            catch let error as NSError {
                print(error)
            }
        }
        
    }
}

class QuizModel {
    
    var num: Int?
    var object: Bread?
    var ansArr = [Bread]()
    
    init(n: Int, obj: Bread, arr: [Bread]){
        self.num = n
        self.object = obj
        self.ansArr = arr
    }
}
    
class Bread {
    var name: String?
    var rank: String?
    var img: String?
    var loc: String?
    var locImg: String?
    var desc: String?
    var type: String?
    var rating: String?
    var flag: String?
    
    
    init(_ json: [String: AnyObject]) {
        self.name = json["name"] as? String
        self.rank = json["rank"] as? String
        self.img = json["img"] as? String
        self.loc = json["loc"] as? String
        self.locImg = json["locImg"] as? String
        self.desc = json["desc"] as? String
        self.type = json["type"] as? String
        self.rating = json["rating"] as? String
        self.flag = json["flag"] as? String
        
    }
}
