//
//  DescriptionContent.swift
//  Arsentia
//
//  Created by Marta Lo Iacono  on 30/11/24.
//

import SwiftUI

struct DescriptionContent: View {
    var post: Item
    var body: some View {
        
        LazyVStack(spacing: 15) {
            Text(post.title)
                .font(.title.bold())
                .padding(.vertical, 10)
            
           
                Text(post.content)
                    .multilineTextAlignment(.leading)
                    .kerning(1.2)
                
            }
                .padding(15)
        
    }
    
    @ViewBuilder
    func DescriptionSection(title: String, content: String, isLong: Bool = false) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title.bold())
            
            Text(content)
                .multilineTextAlignment(.leading)
                .kerning(1.2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    DescriptionContent(post: sampleImages[0])
}
