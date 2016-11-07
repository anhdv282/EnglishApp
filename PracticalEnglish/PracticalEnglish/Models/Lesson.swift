//
//  Lesson.swift
//  PracticalEnglish
//
//  Created by mac on 11/7/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit

class Lesson: NSObject {
    var id: Int
    var content:String
    var listQuestion: [Question]
    
    
    init(_id: Int, _content: String, _listQuestion: [Question]) {
        self.id = _id
        self.content = _content
        self.listQuestion = _listQuestion
    }
    
    convenience override init() {
        self.init(_id: 0, _content: "", _listQuestion: [Question]())
    }
}
