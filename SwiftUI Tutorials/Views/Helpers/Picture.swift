//
//  Picture.swift
//  SwiftUI Tutorials
//
//  Created by Roman Shestopal on 03.03.2023.
//

import SwiftUI

struct Picture: View {
    var image: Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct Picture_Previews: PreviewProvider {
    static var previews: some View {
        List {
            Picture(image: ModelData().landmarks[2].image)
            Picture(image: ModelData().landmarks[0].image)
        }
    }
}
