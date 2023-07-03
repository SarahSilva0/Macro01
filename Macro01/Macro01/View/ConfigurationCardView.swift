import SwiftUI

struct ConfigurationCardView: View {
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .opacity(0.65)
                VStack {
                    VStack {
                        HStack {
                            Text("Configuração")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            
                            Button(action: {
                                print("SOM")
                            }) {
                                Image("sound")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(width: 44,height: 44)
                            }
                           
                        }
                        
                    }
                    
                    VStack {
                        TransparentConfigurationButton(text: "Tutorial", icon: "book") {
                            print("Tutorial")
                        }
                        TransparentConfigurationButton(text: "Sobre", icon: "info") {
                            print("Sobre")
                        }
                        TransparentConfigurationButton(text: "Políticas de Privacidade", icon: "info") {
                            print("Privacidade")
                        }
                        TransparentConfigurationButton(text: "Suporte", icon: "email") {
                            print("email")
                        }
                    }
                    
                }
                .frame(width: geometry.size.width * 0.4, height: geometry.size.height)
                .background(Color(hex: "FFF2D9"))
                .cornerRadius(10)
                .shadow(radius: 2)
                
            }
            .ignoresSafeArea()
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct ConfigurationCard_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationCardView()
    }
}
