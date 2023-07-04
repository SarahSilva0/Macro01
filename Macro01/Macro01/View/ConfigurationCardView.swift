import SwiftUI

struct ConfigurationCardView: View {
    @ScaledMetric(relativeTo: .body) var buttonSize: CGFloat = 50
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
           
            ZStack {
                Color(.black)
                    .opacity(0.65)
                
                VStack {
                    VStack {
                        HStack {
                            ButtonGenRound(action: {
                                self.dismissView()
                                print("Oiii")
                            },
                            image: "sound",
                            foregroundColor: (Color(hex: "FFF2D9")),
                            backgroundColor: (Color(hex: "FFF2D9")))
                            
                            .frame(width: buttonSize, height: buttonSize)
                            Spacer()
                        }
                    }
                }
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                
                
                HStack {
                    VStack  {
                        ZStack {
                            HStack  {
                                Text("Configuração")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                            }
                            
                            HStack  {
                                Spacer()
                                ButtonGenRound(action: {
                                    print("SOM")
                                },
                                               image: "sound",
                                               foregroundColor: (Color(hex: "FFF2D9")),
                                               backgroundColor: (Color(hex: "FFF2D9")))
                            }
                            .frame(width: geometry.size.width * 0.38, height: geometry.size.height * 0.2)
                        }
                        
                        Spacer()
                            .frame(height: geometry.size.height * 0.1)
                        
                        VStack {
                            TransparentConfigurationButton(text: "Tutorial", icon: "book") {
                                print("Tutorial")
                                self.dismissView()
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
                        .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.5)
                        Spacer()
                        
                    }
                    .frame(width: geometry.size.width * 0.4)
                    .background(Color(hex: "FFF2D9"))
                    .cornerRadius(10)
                    .shadow(radius: 2)
                }
            }
            .ignoresSafeArea()
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        
    }
   
    private func dismissView() {
           self.presentationMode.wrappedValue.dismiss()
       }
}

struct ConfigurationCard_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationCardView()
    }
}





