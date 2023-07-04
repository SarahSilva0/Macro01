import SwiftUI



struct ButtonGenRound: View {
    let action: () -> Void
    let image: String
    let foregroundColor: Color
    let backgroundColor: Color
    
    var body: some View {
        Button(action: action) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(foregroundColor)
                .padding()
                .background(backgroundColor)
                .clipShape(Circle())
               
        }
    }
}

