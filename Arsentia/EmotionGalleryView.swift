//
//  EmotionGalleryView.swift
//  Arsentia
//
//  Created by Marta Lo Iacono  on 29/11/24.
//
import SwiftUI

struct EmotionGalleryView: View {
    var items: [Item] // Accept an array of items as a parameter

    @State private var currentIndex: Int = 0
    @State private var isImageFullScreen: Bool = false
    @State private var isBottomSheetOpen: Bool = false
    @GestureState private var dragOffSet: CGFloat = 0

    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    ForEach(0..<items.count, id: \.self) { index in
                        Image(items[index].imageName)
                            .resizable()
                            .cornerRadius(25)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 6)
                            .frame(width: 300, height: 500)
                            .opacity(index == currentIndex ? 1.2 : 0.8)
                            .scaleEffect(currentIndex == index ? 1.2 : 0.8)
                            .offset(x: CGFloat(index - currentIndex) * 300 + dragOffSet, y: 0)
                            .onTapGesture(count: 2) {
                                withAnimation {
                                    isImageFullScreen.toggle()
                                }
                            }
                            .fullScreenCover(isPresented: $isImageFullScreen) {
                                FullScreenImageView(imageName: items[currentIndex].imageName, isPresented: $isImageFullScreen, isBottomSheetOpen: $isBottomSheetOpen)
                            }
                    }
                }
                .gesture(DragGesture().onEnded { value in
                    let threshold: CGFloat = 50
                    if value.translation.width > threshold {
                        withAnimation {
                            currentIndex = max(0, currentIndex - 1)
                        }
                    } else if value.translation.width < -threshold {
                        withAnimation {
                            currentIndex = min(items.count - 1, currentIndex + 1)
                        }
                    }
                })
            }
        }
    }
 }


struct FullScreenImageView: View {
    let imageName: String
    @Binding var isPresented: Bool
    @Binding var isBottomSheetOpen: Bool
    @State private var offset: CGFloat = UIScreen.main.bounds.height * 0.67
    @State private var dragAmount: CGFloat = 0

    var body: some View {
        ZStack {
           // Color.black.ignoresSafeArea()
            Image(imageName)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .blur(radius: isBottomSheetOpen ? 10 : 0)
                .onTapGesture {
                    withAnimation {
                        isPresented = false
                    }
                }
            VStack {
                            Spacer()
                BottomSheetView(isOpen: $isBottomSheetOpen)
                    .offset(y: isBottomSheetOpen ? 100 : 300)
                    .gesture(DragGesture()
                            .onChanged { value in
                                                
                            dragAmount = value.translation.height
                                            }
                        .onEnded { value in
                            if dragAmount < -100 {
                                withAnimation {
                                    isBottomSheetOpen = true
                                }
                            } else if dragAmount > 100 {
                                withAnimation {
                                    isBottomSheetOpen = false
                                   }
                               }
                            }
                                )
                        }
                    }
                    .onTapGesture(count: 2) {
                        withAnimation {
                            isBottomSheetOpen.toggle() // Alterna stato della tendina
                        }
                    }
                }
            }


 struct BottomSheetView: View {
    @Binding var isOpen: Bool
    @State private var isLiked: Bool = false
    
                var body: some View {
                    VStack {
                        Capsule()
                            .fill(Color.gray)
                            .frame(width: 45, height: 6)
                            .padding(.top, 20)
                        HStack{
                            Button(action:{
                                withAnimation(.easeInOut){
                                    isLiked.toggle() //cambia stato del like
                                }
                            }){
                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                    .foregroundColor(isLiked ? .red : .gray)
                                    .font(.title2)
                            }
                            .padding(.leading, 30)
                            Spacer()
                            
                        Text("Dettagli dell'Opera")
                            .font(.headline)
                            .padding(.leading, -40)
                           Spacer()
                    }
                    .padding(.vertical, 10)
                        ScrollView{
                            Text("""
 Questa è una descrizione dettagliata dell'opera d'arte. Puoi aggiungere molte più informazioni qui. 

Ad esempio:
                    - Autore: Leonardo da Vinci
- Anno: 1503
                    - Tecnica: Olio su tavola
                    - Dimensioni: 77 × 53 cm
                    
Questo testo può essere molto lungo e quando il testo diventa più lungo della tendina, essa si allargherà automaticamente per adattarsi.
Puoi continuare a scrivere qui a piacere.
""")
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                        Spacer()
                    }
                    .frame(width: 400, height: .infinity)
                    .background(Color.white)
                    .cornerRadius(30)
                    .frame(height: isOpen ? nil : 300) // La tendina si espande se è aperta
                            .animation(.easeInOut(duration: 0.3), value: isOpen)
                }
}


#Preview {
    EmotionGalleryView(items: sampleImages)
        
}







 

