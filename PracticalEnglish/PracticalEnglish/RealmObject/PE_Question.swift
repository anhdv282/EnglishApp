//
//  PE_Question.swift
//  PracticalEnglish
//
//  Created by mac on 10/7/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import Foundation
import RealmSwift

class PE_Question: Object {
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    private(set) dynamic var uuid = NSUUID().uuidString
    dynamic var question = ""
    dynamic var answer0  = ""
    dynamic var answer1  = ""
    dynamic var answer2  = ""
    dynamic var answer3  = ""
    dynamic var isCorrect = 0
    dynamic var selected = 0
    dynamic var id = 0
    dynamic var questionState = 0 // 0. NotSelected 1. RightSelected 2. WrongSelected
    override class func primaryKey() -> String? {
        return "uuid"
    }
}
