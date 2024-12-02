import SwiftUI

struct CustomButtonSquare: View {
    var image: UIImage? // Accepts UIImage
    var text: String = ""
    var icon: String = "star" // Default icon
    var colorIcon: Color = .white
    var colorText: Color = .black
    
    var body: some View {
        Button(action: {
            // Add your action here
        }) {
            ZStack {
                // Background image
                if let uiImage = image {
                    Image(uiImage: uiImage) // Convert UIImage to Image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .cornerRadius(25)
                        .clipped()
                } else {
                    // Placeholder for when image is nil
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 150, height: 150)
                        .cornerRadius(25)
                        .overlay(
                            Text("No Image")
                                .font(.caption)
                                .foregroundColor(.white)
                        )
                }
                
                VStack {
                    // Text
                    Text(text)
                        .font(.headline)
                        .bold()
                        .foregroundColor(colorText)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .trailing], 8)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer()
                    
                    // Icon
                   /* Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundColor(colorIcon.opacity(0.6))
                        .padding(10)
                        .background(Circle().fill(colorIcon.opacity(0.3)))
                        .offset(x: 45, y: 45) // Position icon at the bottom-right corner*/
                }
                .frame(width: 150, height: 150)
            }
        }
        .frame(width: 150, height: 150)
        .shadow(radius: 1)
    }
}

#Preview {
    CustomButtonSquare(
        image: UIImage(named: "ragazzaTurbante"), // Replace with a real UIImage
        text: "",
        icon: "",
        colorIcon: .yellow,
        colorText: .white
    )
}

