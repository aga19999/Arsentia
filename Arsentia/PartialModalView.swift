//
//  PartialModalView.swift
//  Arsentia
//
//  Created by Roberta Campanella on 02/12/24.
//

import SwiftUI

struct PartialModalView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            
                    ZStack {
                        Color.white.ignoresSafeArea(edges: .all)
                        
                        ScrollView {
                            Spacer()
                            Text("Descrizione dell'opera")
                                .font(.headline)
                                .padding(.top, 20)
                            
                            Text("Questa è una descrizione dettagliata dell'opera d'arte che stai visualizzando. Scorri per scoprire più informazioni. Ora voglio provare con un testo più lungo per vedere come compare. \nAdesso dovrebbe essere tutto molto più lungo.")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                
                }
    }
}

#Preview {
    PartialModalView()
}

