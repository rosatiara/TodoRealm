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
    //open Realm everytime we initialize the class.
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
}
