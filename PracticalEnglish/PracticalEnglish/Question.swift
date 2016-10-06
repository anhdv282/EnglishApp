//
//  Question.swift
//  testFirebase
//
//  Created by mac on 9/19/16.
//  Copyright © 2016 VietAnh. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
//class FIRDataObject: NSObject {
//    
//    let snapshot: FIRDataSnapshot
//    var key: String { return snapshot.key }
//    var ref: FIRDatabaseReference { return snapshot.ref }
//    
//    required init(_ snapshot: FIRDataSnapshot) {
//        
//        self.snapshot = snapshot
//        
//        super.init()
//        
//        for child in snapshot.children {
//            if respondsToSelector(Selector(child.key)) {
//                setValue(child.value, forKey: child.key)
//            }
//        }
//    }
//}
//
//protocol FIRDatabaseReferenceable {
//    var ref: FIRDatabaseReference { get }
//}
//
//extension FIRDatabaseReferenceable {
//    var ref: FIRDatabaseReference {
//        return FIRDatabase.database().reference()
//    }
//}

enum QuestionState: Int{
    case NotSelected = 0, RightSelected, WrongSelected
}

class Question: NSObject {
    var iD: Int
    var Question: String
    var Answer0: String
    var Answer1: String
    var Answer2: String
    var Answer3: String
    var IsCorrect: Int
    var state:QuestionState
    
    init(id: Int, question: String, answer0: String, answer1: String, answer2: String, answer3: String, isCorrect: Int, state: QuestionState) {
        self.iD = id
        self.Question = question
        self.Answer0 = answer0
        self.Answer1 = answer1
        self.Answer2 = answer2
        self.Answer3 = answer3
        self.IsCorrect = isCorrect
        self.state = state
    }
    
    convenience override init() {
        self.init(id: 0, question: "", answer0: "", answer1:  "", answer2: "", answer3: "", isCorrect: 0, state: .NotSelected)
    }
    
//    static func questionFromServer() -> [Question] {
//        
//        let questions = [Question]
    
//        guard let url = Bundle.main.url(forResource: "artists", withExtension: "json") else {
//            return artists
//        }
//        
//        do {
//            let data = try Data(contentsOf: url)
//            guard let rootObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any]  else {
//                return artists
//            }
//            
//            guard let artistObjects = rootObject["artists"] as? [[String: AnyObject]] else {
//                return artists
//            }
//            
//            for artistObject in artistObjects {
//                if let name = artistObject["name"] as? String,
//                    let bio = artistObject["bio"]  as? String,
//                    let imageName = artistObject["image"] as? String,
//                    let image = UIImage(named: imageName),
//                    let worksObject = artistObject["works"] as? [[String : String]]{
//                    var works = [Work]()
//                    for workObject in worksObject {
//                        if let workTitle = workObject["title"],
//                            let workImageName = workObject["image"],
//                            let workImage = UIImage(named: workImageName + ".jpg"),
//                            let info = workObject["info"] {
//                            works.append(Work(title: workTitle,image: workImage,info: info, isExpanded: false))
//                        }
//                    }
//                    
//                    let artist = Artist(name: name, bio: bio, image: image, works: works)
//                    artists.append(artist)
//                }
//            }
//        } catch {
//            return artists
//        }
        
//        return questions as! [Question]
//    }
}
