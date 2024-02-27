//
//  SplashView.swift
//  DoTask
//
//  Created by Sakshi on 26/02/24.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
    var body: some View {
        ZStack{
            
            if self.isActive {
                LetsStartView()
            } else {
                Rectangle().fill(Color.white) 
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Image("launchIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
            }
            
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        .background(.white)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
