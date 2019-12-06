//
//  Candy.swift
//  CandySearch
//
//  Created by Mahmoud El-Melligy on 11/25/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import Foundation
import RealmSwift


class Candy: Object {
   @objc dynamic var name = ""
   @objc dynamic var category = ""
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
    init(name: String , category: String ) {
        self.name = name
        self.category = category
    }
    
    override required init() {
       
    }
}
