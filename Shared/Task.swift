//
//  Task.swift
//  ToDo
//
//  Created by T on 19/12/21.
//

import Foundation
import RealmSwift

// Realm access classes as Model so we need to create a class
// Object & ObjectKeyIndentifiable are protocols from Realm.
class Task: Object, ObjectKeyIdentifiable {
    // id will be auto-generated
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
