import SwiftUI

struct CustomButtonSquare: View {
    var image : Image = Image("")
    var text : String = ""
    var icon : String = ""
    var colorIcon : Color = .white
    var colorText : Color = .black
    
    var body: some View {
        Button(action:{}) {
            
            Text(text)
                .bold()
                .multilineTextAlignment(.center) .foregroundColor(colorText)

            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding(EdgeInsets(top: 90, leading: 0, bottom: 0, trailing: 110))
                .foregroundColor(colorIcon)
                .opacity(0.6)
            
        }
        .frame(width: 150, height: 150)
        .background(image.resizable().scaledToFill())
        .foregroundColor(.black)
        .cornerRadius(25)
        .shadow(radius: 1)
    }
}
#Preview {
    CustomButtonSquare(image: Image("ragazzaTurbante"), icon: "heart.fill")
}
