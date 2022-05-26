//
//  NotificationView.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by 임성빈 on 2022/05/27.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack {
            if landmark != nil {
                CircleImage(image: landmark!.image.resizable())
                    .scaledToFit()
            }
            
            Text(title ?? "Unknown Landmark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "Yot are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
        .lineLimit(0)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var landmark = ModelData().landmarks
    
    static var previews: some View {
        NotificationView(
            title: landmark[0].name,
            message: "You are within 5 miles of \(landmark[0].park)",
            landmark: landmark[0])
    }
}
