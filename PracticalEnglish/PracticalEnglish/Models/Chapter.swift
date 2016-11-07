//
//  Chapter.swift
//  PracticalEnglish
//
//  Created by mac on 11/7/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import UIKit

class Chapter: NSObject {
    var id: Int
    var content:String
    var descriptionChapter:String
    var parts: [Lesson]
    
    
    init(_id: Int, _content: String, _descriptionChapter:String, _parts: [Lesson]) {
        self.id = _id
        self.content = _content
        self.descriptionChapter = _descriptionChapter
        self.parts = _parts
    }
    
    convenience override init() {
        self.init(_id: 0, _content: "", _descriptionChapter: "" , _parts: [Lesson]())
    }
}
