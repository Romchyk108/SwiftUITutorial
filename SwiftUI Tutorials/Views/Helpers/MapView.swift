//
//  MapView.swift
//  SwiftUI Tutorials
//
//  Created by Roman Shestopal on 03.03.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var scale: Double = 1.0
    @State private var region = MKCoordinateRegion()
//        center: CLLocationCoordinate2D(latitude: 48.7494, longitude: 30.2214),
//        span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
//    )
    
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
            .imageScale(.small)
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
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
