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
                .aspectRatio(contentMode: .fill)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .clipShape(Circle())
               
        }
    }
}

