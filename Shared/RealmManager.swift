//
//  RealmManager.swift
//  ToDo
//
//  Created by T on 19/12/21.
//

import Foundation
import RealmSwift

// allow the entire app or all the views connected to the RealmManager
// to be notified of changes in this class
class RealmManager: ObservableObject {
    // private(set) means we can only set the variable between the RealmManager class.
    // '?' means optional because opening a Realm might throw an error.
    private(set) var localRealm: Realm?
    //open Realm every initialization
    init(){
        openRealm()
    }
    func openRealm(){
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            
            // create a Realm
            localRealm = try Realm()
        } catch {
            print("Error opening Realm \(error)")
        }
    }
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    // see Task.swift
                    let newTask = Task(value:["title": taskTitle, "completed": false])
                    localRealm.add(newTask)
                    print("Task has been successfully added to Realm!: \(newTask)")
                }
            } catch {
                print("Sorry! error adding your task to Realm: \(error)")
            }
        }
    }
}

/** use this code when you need to update the schema */
// add migrationBlock everytime you update the schema to prevent app crash.


//let config = Realm.Configuration(schemaVersion: 1, migrationBlock: {
//    migration, oldSchemaVersion in
//    if oldSchemaVersion > 1 {
//        //
//    }
//})
