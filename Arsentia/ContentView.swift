//
//  ContentView.swift
//  Arsentia
//
//  Created by Agata Sutera on 27/11/24.
//

import SwiftUI

struct ContentView: View {
    let emotions = ["Happy", "Angry", "Sad", "Calm", "Romantic", "Stressed", "Lonely", "Anxious"]
    let buttonSpacing: CGFloat = 8
    
    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                Spacer(minLength: 35)
                
                Text("How are you feeling today?")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                
                // Definire le colonne per la griglia
                let columns = [
                    GridItem(.flexible(), spacing: buttonSpacing),
                    GridItem(.flexible(), spacing: buttonSpacing)
                ]
                
                LazyVGrid(columns: columns, spacing: buttonSpacing) {
                    ForEach(emotions, id: \.self) { emotion in
                        Button(action: {
                            print("Bottone \(emotion) premuto")
                        }) {
                            Text(emotion)
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .padding()
                                .frame(width: 183, height: 80, alignment: .leading)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                        }
                    }
                }
                .padding(.horizontal, buttonSpacing)

                Spacer()
                
                // Sezione Favorites
                HStack {
                    Text("Favorites")
                        .font(.system(size: 29))
                        .fontWeight(.bold)
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28) // Cambiato l'altezza per una migliore proporzione
                        .foregroundColor(.black)
                    Spacer(minLength: 5) // Questo spinge il testo a sinistra
                }
                .padding() // Aggiungi padding
                
                ScrollView(.horizontal) {
                    HStack(spacing: 10){
                        //CustomButtonSquare(text: "All", icon: "heart.fill")
                        CustomButtonSquare(image: Image("ragazzaTurbante"), icon: "heart.fill")

                        CustomButtonSquare(image: Image("theScream"), icon: "heart.fill")
                            
                        CustomButtonSquare(image: Image("holeiluck"), icon: "heart.fill")
                            
                        CustomButtonSquare(image: Image("monaLisa"), icon: "heart.fill")
                        
                    }
                }
                .padding()
                //.background(Color.black)
            }
        }
        .background((Color(red: 0.949, green: 0.949, blue: 0.969)))// Impostazione dello sfondo della vista a systemGray5
    }
}

#Preview {
    ContentView()
}
