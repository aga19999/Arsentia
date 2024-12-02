//
//  WelcomeView.swift
//  Arsentia
//
//  Created by Marta Lo Iacono  on 28/11/24.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ScrollView{
            VStack(spacing: 14){
                Spacer(minLength: 98)
                Text("Welcome to Arsentia")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
        
                Spacer(minLength: -7)
                HStack{
                    
                    Image(systemName: "paintbrush.pointed.fill")
                        .resizable()
                        .frame(width: 35, height: 35, alignment: .leading)
                        .foregroundColor(Color(red: 0.6, green: 0.0, blue: 0))
                        .padding()
                       
                        
                
                    VStack{
                        
                        Text("Find artworks that reflect your emotions")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .padding(.top)
                            .padding(.trailing)
                        
                        
                        
                        Text("Find out how the artists represent their emotion and enjoy the beauty of a painting that reflects your own.")
                            .foregroundColor(Color(.systemGray))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 14))
                            .padding(.top, -5)
                            .padding(.trailing)
                            
                    }
                    
                }
                
                Spacer()
                HStack{
                    
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 32, height: 30, alignment: .leading)
                        .foregroundColor(Color(red: 0.6, green: 0.0, blue: 0))
                        .padding()
                        
                    
                    VStack{
                       
                            Text("Save your favorites")
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                            Spacer()
                    
                        
                        Text("Save your favorite artworks, you can always do back to them later in your collection.")
                            .foregroundColor(Color(.systemGray))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 14))
                            .padding(.top, -42)
                            .padding(.trailing)
                            
                    }
                    
                }
            
                Spacer()
                HStack{
                    
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .frame(width: 30, height: 36, alignment: .leading)
                        .foregroundColor(Color(red: 0.6, green: 0.0, blue: 0))
                        .padding()
                        
                    
                    VStack{
                       
                            Text("Share your favorite artworks")
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                            Spacer()
                    
                        
                        Text("Share with your friends and family the ones you love the most.")
                            .foregroundColor(Color(.systemGray))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 14))
                            .padding(.top,-46)
                            .padding(.trailing)
                            
                    }
                    
                }
                Spacer()
                HStack{
                    
                    Image(systemName: "hand.rays.fill")
                        .resizable()
                        .frame(width: 32, height: 38, alignment: .leading)
                        .foregroundColor(Color(red: 0.6, green: 0.0, blue: 0))
                        .padding()
                        
                    
                    VStack{
                       
                            Text("View in full screen mode")
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                            Spacer()
                    
                        
                        Text("Double tap on the main gallery artwork to view it in full screen mode.")
                            .foregroundColor(Color(.systemGray))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 14))
                            .padding(.top,-46)
                            .padding(.trailing)
                            
                    }
                    
                }
                
                Spacer(minLength: 125)
                Button(action:{
                    dismiss()
                }) {
                    Text("Continue")
                        
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 18))
                        .padding(.vertical, 12)
                        .background(Color(red: 0.6, green: 0.0, blue: 0))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                    
                }
                .padding(.horizontal,20)
                
            }
           
        }
        
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        
    }
        
}

#Preview {
    WelcomeView()
}
