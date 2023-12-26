//
//  LandmarkDetail.swift
//  SwiftUI Tutorials
//
//  Created by Roman Shestopal on 11.06.2023.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    
    var landmark: Landmark
    var landmarkIndex: Int {
        guard let landmark = modelData.landmarks.firstIndex(where: { $0.id == landmark.id}) else { return 0 }
        return landmark
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 400)
                .cornerRadius(10)
            Picture(image: landmark.image)
                .offset(y: -130.0)
                .padding(.bottom, -130.0)
            VStack {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
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
    static let modelData = ModelData()
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[3])
            .environmentObject(modelData)
    }
}
