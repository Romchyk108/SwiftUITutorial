//
//  SwiftUI_TutorialsApp.swift
//  SwiftUI Tutorials
//
//  Created by Roman Shestopal on 03.03.2023.
//

import SwiftUI

@main
struct SwiftUI_TutorialsApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
