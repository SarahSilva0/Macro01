
import SwiftUI

struct CreditsView: View {
    @ScaledMetric(relativeTo: .body) var buttonSize: CGFloat = 50
    @Binding var isPresented: Bool
    private let sound = SoundManager.instance
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .opacity(0.65)
                
                VStack {
                    HStack {
                        ButtonGenRound(action: {
                            sound.buttonSound()
                            withAnimation {
                                isPresented = false
                            }
                            
                        },
                                       image: "out",
                                       foregroundColor: (Color(hex: "FFF2D9")),
                                       backgroundColor: (Color(hex: "FFF2D9")))
                        .frame(width: buttonSize, height: buttonSize)
                        
                        Spacer()
                        
                    }
                    Spacer()
                        .frame(height: geometry.size.height * 0.85)
                        
                    
                }
                .frame(width: geometry.size.width * 0.98, height: geometry.size.height * 0.1)
                
                VStack {
                    VStack {
                        HStack {
                            Text("Créditos".localizedLanguage())
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                        .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.2)
                        
                        
                        VStack{
                            VStack {
                                Section {
                                    Text("Desenvolvimento".localizedLanguage())
                                        .font(.system(size: 12).weight(.bold))
                                    Text("""
                                    Higor Lo Castro
                                    Júlia Mendes
                                    Sarah Silva
                                    """)
                                    .multilineTextAlignment(.center)

                                }
                            }
                            .frame(height: geometry.size.height * 0.2)
                            
                            
                            VStack{
                                Section {
                                    Text("Design".localizedLanguage())
                                        .fontWeight(.bold)
                                    
                                    Text("""
                                Thiago Nakayama
                                """)
                                }
//                                Divider()
                            }
                            .frame(height: geometry.size.height * 0.1, alignment: .top)
                            
                            
                            VStack{
                                Section {
                                    Text("Músicas e Sons".localizedLanguage())
                                        .fontWeight(.semibold)
                                    
                                    Text("""
                                   Fiftysounds
                                   Freesound
                                   """)
                                    .multilineTextAlignment(.center)
                                }
                            }
                            .frame(height: geometry.size.height * 0.2, alignment: .top)
                            
                            Spacer()

                        }
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                        .lineSpacing(2)
                        .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.8)
                        
                        
                    }
                    .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 1.051)
                    .background(Color(hex: "FFF2D9"))
                    .cornerRadius(10)
                    .shadow(radius: 2)
 
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }
            .ignoresSafeArea()
            .transition(.move(edge: .leading))
            .animation(.easeOut(duration: 4), value: false)
            
            .onDisappear {
                DispatchQueue.main.async {
                    isPresented = false
                }
            }
        }
    }
}


//struct CreditsView_Previews: PreviewProvider {
//    @State var ispresent: Bool = true
//
//    static var previews: some View {
//        CreditsView()
//    }
//}
