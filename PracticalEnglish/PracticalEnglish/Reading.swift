//
//  Reading.swift
//  testFirebase
//
//  Created by mac on 9/19/16.
//  Copyright © 2016 VietAnh. All rights reserved.
//

import UIKit

class Reading: NSObject {
    var id: Int
    var question: String
    var answer: [Question]
    
    init(id:Int, question: String, answer: [Question]) {
        self.id = id
        self.question = question
        self.answer = answer
    }
    
    convenience override init() {
        self.init(id: 0, question: "", answer: [Question]())
    }
}
