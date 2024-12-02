//
//  HomeView.swift
//  Arsentia
//
//  Created by Agata Sutera on 28/11/24.
//
import SwiftUI

struct HomeView: View {
    let emotions = ["Happy", "Sad", "Calm", "Anxious", "In Love", "Lonely", "Stressed", "Angry"]
    let buttonSpacing: CGFloat = 8
    let colorMapping : [String: Color] = ["Happy": .yellow, "Sad": .blue, "Angry": .red, "Calm": .green, "In Love": .pink, "Stressed": .orange, "Lonely": .purple, "Anxious": .cyan]
    @State private var favoriteImages: [Item] = sampleImages.filter { $0.isFavorite }

    var body: some View {
        NavigationView{
            ScrollView {
                VStack(spacing: 14) {
                    Spacer(minLength: 35)
                    
                    Text("How do you feel today?")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    
                    let columns = [
                        GridItem(.flexible(), spacing: buttonSpacing),
                        GridItem(.flexible(), spacing: buttonSpacing)
                    ]
                    
                    LazyVGrid(columns: columns, spacing: buttonSpacing) {
                        ForEach(emotions, id: \.self) { emotion in
                            NavigationLink(destination: EmotionGalleryView())
                            {
                                HStack {
                                    Text(emotion)
                                    Spacer()
                                    Image(systemName: "paintbrush.pointed.fill")
                                        .resizable()
                                        .frame(width: 19, height: 19)
                                        .foregroundColor(.white)
                                        .background(Circle()
                                            .foregroundColor(colorMapping[emotion])
                                            .frame(width: 34, height: 34)
                                                    
                                                    
                                        )
                                    
                                }
                                .font(.system(size: 21))
                                .foregroundColor(.black)
                                .padding()
                                .frame(width: 183, height: 80, alignment: .leading)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                            }
                        }
                    }
                    .padding(.horizontal, buttonSpacing)
                    
                    HStack{
                        
                        Text("Favorites")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                        Spacer()
                        NavigationLink(destination: FullGallery()) {
                            Text("View All")
                                .font(.system(size: 20))
                                .foregroundColor(.blue)
                        }
                    }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 18)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 10){
                                
                                ForEach(favoriteImages) { item in
                                    CustomButtonSquare(image: item.image)
                                }
                            }
                        }
                        
                        .padding(.horizontal, buttonSpacing)
                            //.background(.black)
                    }
                    .scrollIndicators(.hidden)
                }
                .background((Color(red: 0.949, green: 0.949, blue: 0.969)))
            }
        }
    }
        
    #Preview {
        HomeView()
    }
