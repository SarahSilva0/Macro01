import SwiftUI

struct ConfigurationCard: View {
    let title: String
    
    var body: some View {
        VStack {
            Spacer()
            HStack (alignment: .top) {
                Text(title)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.top, 20)

              
                Button(action: {
                    // Ação a ser executada
                }) {
                  
                    HStack (alignment: .center){
                        ZStack {
                            Circle()
                                .foregroundColor(.black)
                                .frame(width: 60, height: 60)
                            
                            Image(systemName: "speaker.wave.2.fill")
                                .font(.system(size: 20))
                                .foregroundColor(Color(hex: "FFF2D9"))
                        }
                    }
                
                }
            }
//            .background(.red)
            .frame(width: 300, height: 300)
            
            Spacer(minLength: 350)
        }
        .frame(width: 360, height: 490)
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
