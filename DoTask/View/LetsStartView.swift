//
//  LetsStartView.swift
//  DoTask
//
//  Created by Sakshi on 24/02/24.
//

import SwiftUI

struct LetsStartView: View {
    
    var body: some View {
    
        NavigationView{
            ZStack{
                Color(hex: 0xFFC61B).ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack{
                    Text("Welcome to DoTask")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                    
                    Text("Thank you for choosing DoTask to support your productivity. Let's begin the adventure of organizing the activities more efficiently!")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    
                     
                    NavigationLink(destination: ContentView())
                         {
                            Text("Let's Start")
                                .foregroundColor(.black)
                                .padding()
                                .padding(.horizontal)
                                .background(Color(hex: 0xFFC61B))
                                .cornerRadius(10)
                        }
                    
                   
                }
            }
        }
       
    }
}


struct LetsStartView_Previews: PreviewProvider {
    static var previews: some View {
        LetsStartView()
    }
    
}

