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
    dynamic var question = ""
    dynamic var answer0 = ""
    dynamic var answer1 = ""
    dynamic var answer2 = ""
    dynamic var answer3 = ""
    dynamic var id = 0
}
