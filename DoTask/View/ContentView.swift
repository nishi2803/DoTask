//
//  ContentView.swift
//  DoTask
//
//  Created by Sakshi on 24/02/24.
//

import SwiftUI


struct ContentView: View {
    @StateObject var realmManager = RealmManager()
    @State private var showAddTaskView = false
    
    var body: some View {
        
        NavigationView{
            ZStack(alignment: .bottomTrailing) {
                TaskView()
                    .environmentObject(realmManager)
                
                NavigationLink(destination: AddTaskView()
                    .environmentObject(realmManager), isActive: $showAddTaskView){
                    addTaskButton()
                        .padding()
                        .onTapGesture {
                            showAddTaskView.toggle()
                        }
                }
            }
        } .navigationBarBackButtonHidden(true)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
