//
//  FullGallery.swift
//  Arsentia
//
//  Created by Marta Lo Iacono  on 29/11/24.
//

import SwiftUI

struct FullGallery: View {
    
    
    var body: some View {
        VStack{
            Home()
                .toolbar(.hidden, for: .navigationBar)
                
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    FullGallery()
}
