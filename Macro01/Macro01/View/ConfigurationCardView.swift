import SwiftUI

struct ConfigurationCardView: View {

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                        Text("Configuração")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        
                        Button(action: {
                            // Ação a ser executada
                        }) {
                            HStack (alignment: .center){
                                ZStack {
                                    Circle()
                                        .foregroundColor(.black)
                                        .frame(width: 44, height: 44)
                                    
                                    Image(systemName: "speaker.wave.2.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color(hex: "FFF2D9"))
                                }
                            }
                        }
                    }
                    .background(.red)
                VStack {
                    TransparentConfigurationButton(text: "Tutorial", icon: "book")
                    TransparentConfigurationButton(text: "Sobre", icon: "info")
                    TransparentConfigurationButton(text: "Políticas de Privacidade", icon: "info")
                    TransparentConfigurationButton(text: "Suporte", icon: "email")
                }
                    
                
            } .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .frame(width: 300, height: 390)
        .background(Color(hex: "FFF2D9"))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct ConfigurationCard_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationCardView()
    }
}
