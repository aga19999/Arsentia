//
//  HomeView.swift
//  Arsentia
//
//  Created by Agata Sutera on 28/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        VStack {
            Text("How are you feeling today?")
                .font(.system(size:30))
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            HStack {
                CustomButton(text: "Happy", icon: "paintbrush.pointed.fill", colorIcon: .green)
                
                CustomButton(text: "Sad", icon: "paintbrush.pointed.fill", colorIcon: .blue)
            }
            HStack{
                CustomButton(text: "Stressed", icon: "paintbrush.pointed.fill", colorIcon: .gray)
                
                CustomButton(text: "Angry", icon: "paintbrush.pointed.fill", colorIcon: .red)
            }
            HStack{
                CustomButton(text: "Romantic", icon: "paintbrush.pointed.fill", colorIcon: .pink)
                
                CustomButton(text: "Sad", icon: "paintbrush.pointed.fill")
            }
            HStack{
                CustomButton(text: "Happy", icon: "paintbrush.pointed.fill", colorIcon: .yellow)
                
                CustomButton(text: "Sad", icon: "paintbrush.pointed.fill")
            }
        
            HStack {
                Text("Favorites")
                    .font(.title)
                    .bold()
                    .frame(width: 150, height: 70)
                Image(systemName: "heart.fill")
                    .font(.title)
                    .frame(width: 0, height: 70)

            }
            
            //.background(Color.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background((Color(red: 0.949, green: 0.949, blue: 0.969)))
    }
}

#Preview {
    HomeView()
}
