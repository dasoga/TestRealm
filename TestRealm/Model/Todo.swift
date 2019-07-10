//
//  Todo.swift
//  TestRealm
//
//  Created by Dante Solorio on 7/9/19.
//  Copyright © 2019 Dante Solorio. All rights reserved.
//

import RealmSwift

class Todo: Object {
    @objc dynamic var name = ""
    @objc dynamic var details = ""
    let ofUser = LinkingObjects(fromType: User.self, property: "todos")
    
    convenience init(_ name: String, _ details: String) {
        self.init()
        self.name = name
        self.details = details
    }
    
}
