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

func writeDataQuestion(question:Question,peLesson:PE_Lesson) {
    let q:PE_Question = PE_Question()
    q.question  = question.Question
    q.answer0   = question.Answer0
    q.answer1   = question.Answer1
    q.answer2   = question.Answer2
    q.answer3   = question.Answer3
    q.id        = question.iD
    q.isCorrect = question.IsCorrect
    q.questionState = (question.state == .NotSelected) ? 0 : (question.state == .RightSelected) ? 1 : 2
    q.selected = -1
    // Get the default Realm
    let realm = try! Realm()
    // You only need to do this once (per thread)
    
    // Add to the Realm inside a transaction
    try! realm.write {
        peLesson.listQuestion.append(q)
        realm.add(q)
    }
}

func updateDataQuestion(question:PE_Question,questionState:Int) {
    // Get the default Realm
    let realm = try! Realm()
     try! realm.write {
        question.questionState = questionState
    }
    
}

func writeDataChapter(chapter:Chapter)->PE_Chapter {
    let c:PE_Chapter = PE_Chapter()
    c.content            = chapter.content
    c.id                 = chapter.id
    c.descriptionChapter = chapter.descriptionChapter
//    c.parts =
    // Get the default Realm
    let realm = try! Realm()
    // You only need to do this once (per thread)

    // Add to the Realm inside a transaction
    try! realm.write {
        realm.add(c)
    }
    return c
}

func writeDataLesson(lesson:Lesson,peChapter:PE_Chapter)->PE_Lesson {
    let l:PE_Lesson = PE_Lesson()
    l.content       = lesson.content
    l.id            = lesson.id
    // Get the default Realm
    let realm = try! Realm()
    // You only need to do this once (per thread)
    
    // Add to the Realm inside a transaction
    try! realm.write {
        peChapter.parts.append(l)
        realm.add(l)
    }
    return l
}
