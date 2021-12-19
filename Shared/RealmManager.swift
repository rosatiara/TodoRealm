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
    
    // priavte(set) means we can only set the variable between the RealmManager class.
    private(set) var localRealm: Realm?
}
