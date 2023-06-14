import SwiftUI

struct ConfigurationCard: View {
    let title: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.top, 20)
                
                Button(action: {
                    // Ação a ser executada
                }) {
                    ZStack {
                        Circle()
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                        
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 20))
                            .foregroundColor(Color(hex: "FFF2D9"))
                    }
                }
            }
            
            Spacer()
        }
        .frame(width: 360, height: 390)
        .background(Color(hex: "FFF2D9"))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct ConfigurationCard_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationCard(title: "Configurações")
    }
}
