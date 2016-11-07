//
//  RealmController.swift
//  PracticalEnglish
//
//  Created by mac on 10/7/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit
import RealmSwift
class RealmController: NSObject {

}

func writeDataQuestion(question:Question) {
    let q:PE_Question = PE_Question()
    q.question = question.Question
    q.answer0 = question.Answer0
    q.answer1 = question.Answer1
    q.answer2 = question.Answer2
    q.answer3 = question.Answer3
    q.id = question.iD
    q.isCorrect = question.IsCorrect
    // Get the default Realm
    let realm = try! Realm()
    // You only need to do this once (per thread)
    
    // Add to the Realm inside a transaction
    try! realm.write {
        realm.add(q)
    }
}

func writeDataChapter(chapter:Chapter) {
    let c:PE_Chapter = PE_Chapter()
    c.content = chapter.content
    c.id = chapter.id
    c.descriptionChapter = chapter.descriptionChapter
//    c.parts = 
    // Get the default Realm
    let realm = try! Realm()
    // You only need to do this once (per thread)
    
    // Add to the Realm inside a transaction
    try! realm.write {
        realm.add(c)
    }
}

func writeDataChapter(lesson:PE_Lesson) {
    // Get the default Realm
    let realm = try! Realm()
    // You only need to do this once (per thread)
    
    // Add to the Realm inside a transaction
    try! realm.write {
        realm.add(lesson)
    }
}