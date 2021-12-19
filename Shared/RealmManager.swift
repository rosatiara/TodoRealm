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
    @Published private(set) var tasks: [Task] = [] // notify our views of any changes in this class
    //open Realm every initialization
    init(){
        openRealm()
        getTasks()
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
    
    // CRUD
    
    // Create
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    // see Task.swift
                    let newTask = Task(value:["title": taskTitle, "completed": false])
                    localRealm.add(newTask)
                    getTasks() // updating tasks array everytime new task is added!
                    print("Task has been successfully added to Realm!: \(newTask)")
                }
            } catch {
                print("Sorry! error adding your task to Realm: \(error)")
            }
        }
    }
    
    // Read
    func getTasks(){
        if let localRealm = localRealm {
           let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach {
                task in tasks.append(task)
            }
            // getting all the objects from localRealm
            // sorting the tasks (uncompleted tasks will be in the beginning of the array)
        }
    }
    
    // Update
    func updateTask(id:ObjectId, completed: Bool) {
        if let localRealm = localRealm {
            do {
                // format = which variable to check
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else {return}
                try localRealm.write {
                    taskToUpdate[0].completed = completed
                    getTasks()
                    print("Task with id \(id) is \(completed)")
                }
            } catch {
                print("Oops! Error updating task \(id) to Realm: \(error)")
            }
        }
    }
    
    // Delete
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else {return}
                try localRealm.write {
                    localRealm.delete(taskToDelete)
                    getTasks()
                    print("Delete task with id \(id)")
                }
            } catch {
                print("Error deleting task \(id) from Realm: \(error)")
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
