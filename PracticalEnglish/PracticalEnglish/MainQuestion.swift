//
//  MainQuestion.swift
//  PracticalEnglish
//
//  Created by mac on 10/8/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit

class MainQuestion: NSObject {
    var id: Int
    var mainQuestion: String
    var listQuestion: [Question]
    
    
    init(_id: Int, _mainQuestion: String, _listQuestion: [Question]) {
        self.id = _id
        self.mainQuestion = _mainQuestion
        self.listQuestion = _listQuestion
    }
    
    convenience override init() {
        self.init(_id: 0, _mainQuestion: "", _listQuestion: [Question]())
    }
}
