//
//  PE_Chapter.swift
//  PracticalEnglish
//
//  Created by mac on 11/7/16.
//  Copyright © 2016 Viet Anh Dang. All rights reserved.
//

import Foundation
import RealmSwift

class PE_Chapter: Object {
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    dynamic var id = 0
    dynamic var content = ""
    dynamic var descriptionChapter = ""
    var parts = List<PE_Lesson>()
}
