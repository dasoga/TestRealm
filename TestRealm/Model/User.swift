//
//  User.swift
//  TestRealm
//
//  Created by Dante Solorio on 7/9/19.
//  Copyright © 2019 Dante Solorio. All rights reserved.
//

import RealmSwift

enum UserType: Int {
    case premium
    case gold
    case none
}


class User: Object {
    @objc dynamic var firstName = ""
    @objc dynamic var userId = 0
    let todos = List<Todo>()
    
    override class func indexedProperties() -> [String] {
        return ["userId", "firstName"]
    }
    
    override class func primaryKey() -> String? {
        return "userId"
    }
    
    convenience init(_ firstName: String, _ userId: Int) {
        self.init()
        self.firstName = firstName
        self.userId = userId
    }
}
