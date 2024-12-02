//
//  OpereView.swift
//  Arsentia
//
//  Created by Roberta Campanella on 02/12/24.
//

import SwiftUI

struct OpereView: View {
    @State private var isModalPresented = true
    @State private var offset: CGFloat = UIScreen.main.bounds.height * 0.67
    var body: some View {
        VStack {
           Image("holeiluck")
                .blur(radius: offset < 100 ? 0 : 10)
                }
            .sheet(isPresented: $isModalPresented) {
                PartialModalView()
                    .presentationDetents([.fraction(0.05), .medium, .large]) // Configura altezze
                    .presentationDragIndicator(.visible)   // Mostra il drag indicator
                    .interactiveDismissDisabled(true)
                    
            }

    }
}

#Preview {
    OpereView()
}
