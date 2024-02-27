//
//  TaskView.swift
//  DoTask
//
//  Created by Sakshi on 24/02/24.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                HStack{
                    
                    Text("My tasks")
                                    .font(.title2).bold()  
                                    .padding(.top)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                            Button(action: {
                                realmManager.getTasksSortedByDueDate()
                                       }) {
                                           Text("Sort by due date").padding(.top).font(.footnote).foregroundColor(.black)
                                       }
                }
                
                VStack {
                    ForEach(realmManager.tasks, id: \.id) { task in
                        if !task.isInvalidated {
                            TaskRow(task: task.title, description: task.taskDescription, completed: task.completed, dueDate: task.dueDate,
                                    startTime: task.startTime,endTime: task.endTime)
                                .onTapGesture {
                                    realmManager.updateTask(id: task.id, completed: !task.completed)
                                }.onLongPressGesture{
                                    realmManager.deleteTask(id: task.id)
                                }
                            
                        }
                    }
                }.background(Color.clear)
                
                Spacer()
            }.padding()
        }.navigationBarTitle("Homepage", displayMode: .inline)
            .navigationBarBackground()
        
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(RealmManager())
    }
}
