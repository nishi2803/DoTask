//
//  RealmManager.swift
//  DoTask
//
//  Created by Sakshi on 24/02/24.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published var tasks: [Task] = []

    
    init() {
        openRealm()
        getTasks()
    }

    
    func openRealm() {
        do {
           
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config

            localRealm = try Realm()
        } catch {
            print("Error opening Realm", error)
        }
    }

    
    func addTask(taskTitle: String, dueDate: Date, startTime: Date, endTime: Date, description: String) {
        if let localRealm = localRealm {
            do {
                
                try localRealm.write {
                   
                    let newTask = Task(value: ["title": taskTitle, "completed": false, "dueDate" : dueDate, "startTime" : startTime, "endTime": endTime, "taskDescription": description])
                   
                    localRealm.add(newTask)
                    getTasks()
                }
            } catch {
                print("Error adding task to Realm: \(error)")
            }
        }
    }
    
    func getTasks() {
        if let localRealm = localRealm {
           
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
           
            tasks = []
           
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }

    func updateTask(id: ObjectId, completed: Bool) {
        if let localRealm = localRealm {
            do {
               
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                
                guard !taskToUpdate.isEmpty else { return }

                try localRealm.write {
                  
                    taskToUpdate[0].completed = completed
                  
                    getTasks()
                }
            } catch {
                print("Error updating task \(id) to Realm: \(error)")
            }
        }
    }

    
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
               
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                
                guard !taskToDelete.isEmpty else { return }
            
                try localRealm.write {
             
                    localRealm.delete(taskToDelete)
                    getTasks()
            
                }
            } catch {
                print("Error deleting task \(id) to Realm: \(error)")
            }
        }
    }
    
    func getTasksSortedByDueDate() {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "dueDate")
            tasks = Array(allTasks)
        }
    }
    
    


}
