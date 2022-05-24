//
//  Mapview.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/24.
//

import SwiftUI
import MapKit

struct Mapview: View {
    // Create a private state variable that holds the region information for the map.
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        // Replace the default Text view with a Map view that takes a binding to the region.
        Map(coordinateRegion: $region)
    }
}

struct Mapview_Previews: PreviewProvider {
    static var previews: some View {
        Mapview()
    }
}
