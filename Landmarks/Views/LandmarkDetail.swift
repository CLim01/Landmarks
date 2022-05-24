//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/24.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .padding(.bottom, -130.0)
                .offset(x: 0.0, y: -130.0)
            
            VStack(alignment: .leading) {
                
                Text(landmark.name)
                    .font(.title)
                
                HStack {
                   
                    Text(landmark.park)
                   
                    Spacer()
                   
                    Text(landmark.state)
                        
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
