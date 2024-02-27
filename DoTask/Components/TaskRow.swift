//
//  TaskRow.swift
//  DoTask
//
//  Created by Sakshi on 24/02/24.
//
import Foundation
import SwiftUI

struct TaskRow: View {
    var task: String
    var description: String
    var completed: Bool
    var dueDate: Date?
    var startTime: Date?
    var endTime: Date?
    
    
    
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        
        HStack{
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: completed ? "checkmark.circle.fill" : "circle")
                    Text(task).fontWeight(.semibold)
                }
                Text(description).font(.footnote).fontWeight(.medium)
            }
            Spacer()
            
            VStack(alignment: .trailing){
                if let dueDate = dueDate {
                    Text("Due: \(formattedDateString(from: dueDate))")
                        .foregroundColor(.black)
                        .font(.footnote)
                        .fontWeight(.light)
                }
                
                if let startTime = startTime, let endTime = endTime {
                    Text("\(formattedTimeString(from: startTime)) - \(formattedTimeString(from: endTime))")
                        .foregroundColor(.black)
                        .font(.footnote)
                        .fontWeight(.light)
                }
                
            }
            
        }.padding()
            .frame(width: 350, alignment: .leading)
            .background(completed ? Color(hex: 0xFFC61B).opacity(0.8) : .white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5))
            )
    
        
        
    }
    func formattedDateString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
    
    func formattedTimeString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}


struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Do Laundry",description: "", completed: true, dueDate: Date())
    }
}

