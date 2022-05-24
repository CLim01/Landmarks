//
//  MapView.swift
//  Landmarks
//
//  Created by 임성빈 on 2022/05/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        // Replace the default Text view with a Map view that takes a binding to the region.
        Map(coordinateRegion: $region)
            .onAppear {
                setRegoin(coordinate)
            }
    }
    
    // 좌표 값을 기준으로 영역을 업데이트하는 메서드를 추가합니다.
    private func setRegoin(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
        center: coordinate,
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
