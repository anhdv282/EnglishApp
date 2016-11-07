//
//  PE_Lesson.swift
//  PracticalEnglish
//
//  Created by mac on 11/7/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import Foundation
import RealmSwift

class PE_Lesson: Object {
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    dynamic var content = ""
    dynamic var id = 0
    let listQuestion = List<PE_Question>()
}
