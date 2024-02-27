//
//  addTaskButton.swift
//  DoTask
//
//  Created by Sakshi on 24/02/24.
//

import SwiftUI

struct addTaskButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundColor(Color(hex: 0xFFC61B))
            
            Text("+")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
        .frame(height: 50)
    }
}

struct addTaskButton_Previews: PreviewProvider {
    static var previews: some View {
        addTaskButton()
    }
}
