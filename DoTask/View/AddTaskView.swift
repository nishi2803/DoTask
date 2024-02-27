//
//  AddTaskView.swift
//  DoTask
//
//  Created by Sakshi on 24/02/24.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var dueDate: Date = Date() // Due date variable
    @State private var startTime: Date = Date() // Start time variable
    @State private var endTime : Date = Date() // End time variable
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Task")
                    .font(.title2).fontWeight(.semibold)
                    .foregroundColor(.black)
                
                TextField("Enter your task here", text: $title)
                    .textFieldStyle(NameTextFieldStyle())
                
                Text("Date & Time")
                    .font(.title2).fontWeight(.semibold)
                    .foregroundColor(.black)
                   
                
                HStack {
                    Text("Set due date")
                    DatePicker("", selection: $dueDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .labelsHidden()
                           .clipped()
                }
                 
                
                HStack(alignment: .firstTextBaseline){
                    DatePicker("Start time", selection: $startTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.compact)
                    
                    DatePicker("End time", selection: $endTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.compact)
                        
                }
                
                
                Text("Description")
                    .font(.title2).fontWeight(.semibold)
                    .foregroundColor(.black)
                
                TextField("Example: Finish chapter 1 of english", text: $description)
                    .textFieldStyle(DescriptionTextFieldStyle())

                
                Button {
                    if title != "" {
                        debugPrint(dueDate)
                        realmManager.addTask(taskTitle: title, dueDate: dueDate, startTime: startTime, endTime: endTime, description: description)
                    }
                    dismiss()
                } label: {
                    Text("Add task")
                        .frame(maxWidth: .infinity)
                }.buttonStyle(CustomButtonStyle())
                
                Spacer()
            }
            .padding(.top, 20)
            .padding(.horizontal)
            .background(Color.white)
            
        } .navigationBarTitle("Create a New Task", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrow.left") // Custom back button icon
                        .foregroundColor(.black) // Customize the color of the button
                }
            )
            .navigationBarBackground()
    }
}

struct NameTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color(hex: 0xFFF1F1F1))
                                    
        )
        
    }
}

struct DescriptionTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(EdgeInsets(top: 10, leading: 10, bottom:40, trailing: 10))
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color(hex: 0xFFF1F1F1))
                                    
        )
        
    }
}

struct CustomButtonStyle: ButtonStyle {
 @Environment(\.isEnabled) var isEnabled
 func makeBody(configuration: Configuration) -> some View {
 configuration.label
 .padding()
 .background(Color(hex: 0xFFC61B))
 .foregroundColor(.black)
 .cornerRadius(10)
 }
}
