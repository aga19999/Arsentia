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
    let colorMapping: [String: Color] = [
        "Happy": .yellow, "Sad": .blue, "Angry": .red, "Calm": .green,
        "In Love": .pink, "Stressed": .orange, "Lonely": .purple, "Anxious": .cyan
    ]
    @State private var favoriteImages: [Item] = sampleImages.filter { $0.isFavorite }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 14) {
                    Spacer(minLength: 35)

                    HeaderView(title: "How do you feel today?")

                    EmotionGrid(emotions: emotions, colorMapping: colorMapping)

                    FavoriteSection(favoriteImages: favoriteImages)
                }
                .background(Color(red: 0.949, green: 0.949, blue: 0.969))
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct HeaderView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.system(size: 28))
            .fontWeight(.bold)
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .padding()
    }
}
struct EmotionGrid: View {
    let emotions: [String]
    let colorMapping: [String: Color]
    let buttonSpacing: CGFloat = 8

    var body: some View {
        let columns = [
            GridItem(.flexible(), spacing: buttonSpacing),
            GridItem(.flexible(), spacing: buttonSpacing)
        ]

        LazyVGrid(columns: columns, spacing: buttonSpacing) {
            ForEach(emotions, id: \.self) { emotion in
                NavigationLink(destination: EmotionGalleryView(items: sampleImages)) {
                    EmotionButton(emotion: emotion, color: colorMapping[emotion] ?? .gray)
                }
            }
        }
        .padding(.horizontal, buttonSpacing)
    }
}

struct EmotionButton: View {
    let emotion: String
    let color: Color

    var body: some View {
        HStack {
            Text(emotion)
            Spacer()
            Image(systemName: "paintbrush.pointed.fill")
                .resizable()
                .frame(width: 19, height: 19)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .foregroundColor(color)
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
struct FavoriteSection: View {
    let favoriteImages: [Item]

    var body: some View {
        VStack {
            HStack {
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
                HStack(spacing: 10) {
                    ForEach(favoriteImages) { item in
                        CustomButtonSquare(imageName: item.imageName)
                    }
                }
            }
            .padding(.horizontal, 8)
        }
    }
}




#Preview {
    HomeView()
}

        
  
