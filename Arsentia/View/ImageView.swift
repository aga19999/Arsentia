//
//  ImageView.swift
//  Arsentia
//
//  Created by Marta Lo Iacono  on 29/11/24.
//

import SwiftUI

struct ImageView: View {
    var post: Item
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            if let image = UIImage(named: post.imageName) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .clipped()
            }
        }
    }
}

