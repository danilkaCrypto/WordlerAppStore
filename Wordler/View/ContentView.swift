//
//  ContentView.swift
//  Wordler
//
//  Created by danilka on 06.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            HomeView()
            
            HStack(spacing: 38.0) {
                Image(systemName: "folder")
                    .foregroundColor(.iconGray)
                    .font(.system(size: 20))
                    .padding(15)
                    .background(Color.lightGray)
                    .clipShape(Circle())
                
                Image(systemName: "plus")
                    .foregroundColor(.lightGray)
                    .font(.system(size: 32))
                    .padding(21)
                    .background(LinearGradient(gradient: Gradient(colors: [.accentColor, .init(hex: 0x2754f2)]), startPoint: .top, endPoint: .bottom))
                    .clipShape(Circle())
                    .shadow(color: .init(hex: 0x2754f2, alpha: 0.35), radius: 15, x: 0, y: 3)
                
                Image(systemName: "shuffle")
                    .foregroundColor(.iconGray)
                    .font(.system(size: 20))
                    .padding(15)
                    .background(Color.lightGray)
                    .clipShape(Circle())
                
            }
            .padding(.bottom, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
