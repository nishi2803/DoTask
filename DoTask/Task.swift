//
//  Task.swift
//  DoTask
//
//  Created by Sakshi on 24/02/24.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId 
    @Persisted var title = ""
    @Persisted var taskDescription = ""
    @Persisted var completed = false
    @Persisted var dueDate = Date()
    @Persisted var startTime = Date()
    @Persisted var endTime = Date()
   
}
