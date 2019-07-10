//
//  ViewController.swift
//  TestRealm
//
//  Created by Dante Solorio on 7/9/19.
//  Copyright © 2019 Dante Solorio. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class ViewController: UIViewController {   
    
    var users: Results<User>?
    var notificationToken: NotificationToken?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        insertObjetIfNotExistIntoTheRealm()
        
        addObserver()
    }
    
    // MARK: - Private functions
    
    private func insertObjetIfNotExistIntoTheRealm(){
        let realm = RealmProvider.default.realm
        
        print("file path: \(realm.configuration.fileURL!)")
        print("schema version: \(realm.configuration.schemaVersion)")
        
        users = realm.objects(User.self)
        print("before \(String(describing: users?.count))")
        
        if users?.count == 0{
            firstData()
            print("after \(String(describing: users?.count))")
        }
    }
    
    private func addObserver(){
        notificationToken = users?.observe() { [unowned self] (changes) in
            switch changes{
            case .initial(let users):
                print("Initial case \(users.count)")
            case .update(let users, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                print("Update case \(users.count)")
                print(deletions)
                print(insertions)
                print(modifications)
            case .error(let error):
                print(error.localizedDescription)
            }
        }
    }

    
    private func firstData(){
        let realm = try! Realm()
        
        // Todos
        let todo1 = Todo("FirstOne", "First task")
        let todo2 = Todo("SecondOne", "Second task")
        let todo3 = Todo("ThirdOne", "Third task")
        
        let user = User("Dante", 1)
        user.todos.append(objectsIn: [todo1, todo2, todo3])
        
        try! realm.write {
            realm.add(user)
        }
        
        print(realm.isEmpty)
    }
    
    // MARK: - Actions
    @IBAction func insertTodo(_ sender: Any){
        let realm = try! Realm()
        let users = realm.objects(User.self).filter("userId == 1")
        
        let todo = Todo("None", "No details")
        
        try! realm.write {
            users[0].todos.append(todo)
            print(users[0].todos.count)
        }
    }

    @IBAction func encryptDatabase(_ sender: Any) {
        autoreleasepool{
            
            let tempDefaultURL = URL.inDocumentsFolder(fileName: "default_temp.realm")
            let originalDefaultURL = URL.inDocumentsFolder(fileName: "default.realm")
            try! FileManager.default.copyItem(at: originalDefaultURL, to: tempDefaultURL)
            try! FileManager.default.removeItem(at: originalDefaultURL)
            let realmConfig = Realm.Configuration(
                fileURL:  URL.inDocumentsFolder(fileName: "default_temp.realm"))
            
            let realm = try! Realm(configuration: realmConfig)
            
            let key = "jcampostaqueria"
            try! realm.writeCopy(toFile:originalDefaultURL, encryptionKey: key.sha512())
            try! FileManager.default.removeItem(at: tempDefaultURL)
            
    
        }
    }
}

