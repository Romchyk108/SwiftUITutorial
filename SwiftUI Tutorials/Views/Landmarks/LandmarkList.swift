//
//  LandmarkList.swift
//  SwiftUI Tutorials
//
//  Created by Roman Shestopal on 11.06.2023.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { $0.isFavorite || !showFavoritesOnly }
    }
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Favorites only")
                    }
                    ForEach(filteredLandmarks) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
                .navigationTitle("Landmarks")
            }
            HikeView(hike: modelData.hikes[0])
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
