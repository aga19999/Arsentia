//
//  EmotionGalleryView.swift
//  Arsentia
//
//  Created by Marta Lo Iacono  on 29/11/24.
//
import SwiftUI

struct EmotionGalleryView: View {
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffSet: CGFloat = 0
    private let opere = ["holeiluck", "monaLisa", "theScream", "ragazzaTurbante"]
    
  
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(red: 0.949, green: 0.949, blue: 0.969)
                 .ignoresSafeArea(.all)
                
                VStack{
                    ZStack{
                        ForEach(0..<opere.count, id: \.self){ index in
                            Image(opere[index])
                            
                                .resizable()
                                .cornerRadius(25)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 6)
                                .frame(width: 300, height: 500)
                                .opacity(index == currentIndex ? 1 : 0.8)
                                .scaleEffect(currentIndex == index ? 1.2 : 0.8)
                                .offset(x: CGFloat(index - currentIndex) * 300 + dragOffSet, y: 0)
                            
                        }
                        
                    }
                    .gesture(DragGesture().onEnded({value in
                        let threshold: CGFloat = 50
                        if value.translation.width > threshold {
                            withAnimation{
                                currentIndex = max(0, currentIndex-1)
                            }
                        }else if (value.translation.width < -threshold){
                            withAnimation{
                                currentIndex = min(opere.count - 1, currentIndex + 1)
                            }
                        }
                    }))
                }
            }
        }
    }
}

#Preview {
    EmotionGalleryView()
}
