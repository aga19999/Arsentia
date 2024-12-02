//
//  CustomButton.swift
//  Arsentia
//
//  Created by Agata Sutera on 28/11/24.
//

import SwiftUI

struct CustomButton: View {
    var text : String = ""
    var icon : String = ""
    var colorIcon : Color = .black
    var colorText : Color = .black
    
    var body: some View {
        Button(action:{}) {
            
            Text(text)
                .font(.title)
                .padding(.leading, 20)
                .foregroundColor(colorText)
            Spacer()
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(.trailing, 25)
                .foregroundColor(colorIcon)
        }
        .frame(width: 205, height: 90)
        .background(Color.white)
        .foregroundColor(.black)
        .cornerRadius(18)
        .shadow(radius: 0)
    }
    
}


#Preview {
    CustomButton(text: "Happy", icon: "heart.fill", colorIcon: .red)
}
