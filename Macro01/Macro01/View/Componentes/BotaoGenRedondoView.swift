import SwiftUI

struct BotaoGenRedondoView: View {
    let action: () -> Void
    let image: String
    let foregroundColor: Color
    let padding: CGFloat
    let backgroundColor: Color
    
    var body: some View {
        Button(action: action) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(foregroundColor)
                .padding(padding)
                .background(backgroundColor)
                .clipShape(Circle())
               
        }
    }
}

struct BotaoGenRedondo_Previews: PreviewProvider {
    static var previews: some View {
        BotaoGenRedondoView(action: {},
                            image: "Saci",
                            foregroundColor: .white,
                            padding: 10,
                            backgroundColor: .blue)
    }
}
