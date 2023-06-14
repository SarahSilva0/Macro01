import SwiftUI

struct ConfigurationCard: View {
    let title: String
    
    var body: some View {
        VStack {
            HStack (alignment: .center) {
                Text(title)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .top)
                
                Button(action: {
                    // Ação a ser executada
                }) {
                  
                    HStack (alignment: .center){
                        ZStack {
                            Circle()
                                .foregroundColor(.black)
                                .frame(width: 50, height: 50)
                            
                            Image(systemName: "speaker.wave.2.fill")
                                .font(.system(size: 20))
                                .foregroundColor(Color(hex: "FFF2D9"))
                        }
                    }
                }
            }
//            .background(.red)
            .frame(width: 250, height: 250)
            
            Spacer(minLength: 300)
        }
        .frame(width: 260, height: 390)
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
