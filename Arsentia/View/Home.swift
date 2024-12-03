//
//  Home.swift
//  Arsentia
//
//  Created by Marta Lo Iacono  on 29/11/24.
//

import SwiftUI

struct Home: View {
    
   // @EnvironmentObject private var vm: ViewModel
    
    @Environment(\.dismiss) var dismiss
    var coordinator: UICoordinator = .init()
    //var posts: [Item] = []
   // init() {self.posts = vm.items}
   @State private var posts: [Item] = sampleImages
    var body: some View {
        ScrollView (.vertical) {
            LazyVStack (alignment: .leading, spacing: 15) {
               
                Button(action: {dismiss()}) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 19))
                            .foregroundColor(.blue)
                        
                        Text("Back")
                            .font(.system(size: 19))
                            .foregroundColor(.blue)
                    }
                }
               
                
                
                
                
                Text("Art Gallery")
                    .font(.largeTitle.bold())
                    .padding(.vertical, 10)
               
                
                //visuale a griglia delle immagini
                LazyVGrid(columns: Array(repeating: GridItem(spacing:10), count: 2), spacing: 10) {
                    ForEach(posts) { post in
                        PostCardView(post)
                    }
                }
                
                
            }
            
            .padding(15)
            .background(ScrollViewExtractor{
                coordinator.scrollView = $0
            })
        }
        
        .opacity(coordinator.hideRootView ? 0 : 1 )
        .scrollDisabled(coordinator.hideRootView)
        .allowsHitTesting(!coordinator.hideRootView)
        .overlay {
            if let selectedPost = coordinator.selectedItem {
                Detail(post: selectedPost)
                    .environment(coordinator)
                    .allowsHitTesting(coordinator.hideLayer)
            }
        }

    }
    
    @ViewBuilder
    func PostCardView(_ post: Item) -> some View {
        GeometryReader {
            let frame = $0.frame(in: .global)
            
            ImageView(post: post)
                    .clipShape(.rect(cornerRadius: 10))
                    .contentShape(.rect(cornerRadius: 10))
                    .onTapGesture {
                        coordinator.toggleView(show: true, frame: frame, post: post)
                    }
            }
        .frame(height: 180)
    }
}

#Preview {
    FullGallery()
        //.environmentObject(ViewModel())
}
