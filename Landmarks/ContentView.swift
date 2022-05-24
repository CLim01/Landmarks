//
//  ContentView.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Mapview()
                .frame(height: 300.0)
                .ignoresSafeArea(edges: .top)
            
            CircleImage()
                .padding(.bottom, -130.0)
                .offset(x: 0.0, y: -130.0)
            
            VStack(alignment: .leading) {
                
                Text("Turtle Rock")
                    .font(.title)
                
                HStack {
                   
                    Text("Joshua Tree National Park")
                   
                    Spacer()
                   
                    Text("California")
                        
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding(.all)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
