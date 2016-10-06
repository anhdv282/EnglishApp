//
//  Grammar.swift
//  PracticalEnglish
//
//  Created by mac on 9/25/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit

class Grammar: NSObject {
    var id: Int
    var content: String
    var listQuestion: [Question]
    
    
    init(id: Int, content: String, listQuestion: [Question]) {
        self.id = id
        self.content = content
        self.listQuestion = listQuestion
    }
    
    convenience override init() {
        self.init(id: 0, content: "", listQuestion: [Question]())
    }
    
    
}
