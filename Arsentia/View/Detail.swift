//
//  Detail.swift
//  Arsentia
//
//  Created by Marta Lo Iacono  on 29/11/24.
//

import SwiftUI

struct Detail: View {
    @Environment(UICoordinator.self) private var coordinator
    var post: Item
   
    var body: some View {
        GeometryReader {
            let size = $0.size
            let animateView = coordinator.animateView
            let hideLayer = coordinator.hideLayer
            let rect = coordinator.rect
            
            let anchorX = (coordinator.rect.minX / size.width) > 0.5 ? 1 : 0.0
            let scale = size.width / coordinator.rect.width
            
            let offsetX = animateView ? (anchorX > 0.5 ? 15 : -15) * scale : 0
            let offsetY = animateView ? -coordinator.rect.minY * scale : 0
            
            let detailHeight: CGFloat = rect.height * scale
            let scrollContenteHeight: CGFloat = size.height - detailHeight
            
            if let image = coordinator.animationLayer, let post = coordinator.selectedItem {
                if !hideLayer {
                    Image(uiImage: image)
                        .scaleEffect(animateView ? scale : 1, anchor: .init(x: anchorX, y:0))
                        .offset(x: offsetX, y: offsetY)
                        .offset(y: animateView ? -coordinator.headerOffset : 0)
                        .opacity(animateView ? 0 : 1)
                        .transition(.identity)
                        
                }
                
                ScrollView(.vertical){
                    ScrollContent(post: post)
                        .safeAreaInset(edge: .top, spacing: 0){
                            Rectangle()
                                .fill(.clear)
                                .frame(height: detailHeight)
                                .offsetY { offset in
                                    coordinator.headerOffset = max(min(-offset, detailHeight), 0)
                                }
                        }
                }
                .scrollDisabled(!hideLayer)
                .background() {
                    Rectangle()
                        .fill(.background)
                        .padding(.top, scrollContenteHeight)
                        
                }
                .animation(.easeInOut(duration: 0.3).speed(1.5)) {
                    $0
                        .offset(y: animateView ? 0 : scrollContenteHeight)
                        .opacity(animateView ? 1 : 0)
                }
                
                
                ImageView(post: post)
                    .allowsHitTesting(false)
                    .frame(
                        width: animateView ? size.width : rect.width,
                        height: animateView ? rect.height * scale : rect.height
                    )
                    .clipShape(.rect(cornerRadius: animateView ? 0 : 10))
                    .overlay(alignment: .top, content: {
                        HeaderActions(post)
                            .offset(y: coordinator.headerOffset)
                            .padding(.top, safeArea.top)
                    })
                    .offset(x: animateView ? 0 : rect.minX, y: animateView ? 0 : rect.minY )
                    .offset(y: animateView ? -coordinator.headerOffset: 0)
            }
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func ScrollContent(post: Item) -> some View {
        DescriptionContent(post: post)
    }
    
   @ViewBuilder
    func HeaderActions(_ post: Item) -> some View {
        HStack {
            Spacer()
            
            Button(action: {coordinator.toggleView(show: false, frame: .zero, post: post) })
            {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundStyle(Color.primary, .bar)
                    .padding(10)
                    .contentShape(.rect)}
        }
        .animation(.easeInOut(duration: 0.3)) {
            $0
                .opacity(coordinator.hideLayer ? 1 : 0)
        }
    }
}

#Preview {
  Home()
}
