//
//  ContentView.swift
//  Arsentia
//
//  Created by Agata Sutera on 27/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showWelcomeView = false
    private let debugAlwaysShowSheet = true
    
    var body: some View {
        
        HomeView()
            .sheet(isPresented: $showWelcomeView) {
                WelcomeView()
            } //per mettere la view come modale
        
            .onAppear {
                checkFirstLaunch()
            } //richiama la funzione per farla comparire solo la prima volta che viene aperta l'app
    }
    
    private func checkFirstLaunch() {
        _ = UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
        if debugAlwaysShowSheet {
            
            showWelcomeView = true
            //serve solo per la modalità di debug
        } else {
            let hasLaunchedBefore = UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
            if !hasLaunchedBefore {
                UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
            }
        }
        
    }
    
}


#Preview {
    ContentView()
}
