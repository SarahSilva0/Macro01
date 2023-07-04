import SwiftUI

struct FirstView: View {
    @ScaledMetric(relativeTo: .body) var buttonSize: CGFloat = 50
    @State private var showConfiguration = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                    Image("BG GERAL")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea(.all)
                    VStack {
                        VStack{
                            HStack(spacing: 20) {
                                ButtonGenRound(action: {
                                    withAnimation {
                                        showConfiguration = true
                                    }
                                },
                                image: "config",
                                foregroundColor: Color(hex: "FFF2D9"),
                                backgroundColor: Color(hex: "FFF2D9"))
                                .frame(width: buttonSize, height: buttonSize)
                                
                                ButtonGenRound(action: {
                                    print("Galeria")
                                },
                                image: "",
                                foregroundColor: Color(hex: "FFF2D9"),
                                backgroundColor: Color(hex: "FFF2D9"))
                                .frame(width: buttonSize, height: buttonSize)
                                
                                Spacer()
                            }
                            .padding(.leading)
                        }
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                        
                        VStack {
                            Text("Título")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding()
                            
                            VStack {
                                NavigationLink(destination: SecondView()){
                                    Text("História")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .frame(width: 200, height: 20)
                                        .padding()
                                        .background(Color(hex: "FFF2D9"))
                                        .cornerRadius(10)
                                    
                                }
                                
                                NavigationLink(destination: DificultyView_()){
                                    Text("Jogo Livre")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .frame(width: 200, height: 20)
                                        .padding()
                                        .background(Color(hex: "FFF2D9"))
                                        .cornerRadius(10)
                                }
                            }
                            .padding()
                        }
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                .overlay(
                    Group {
                        if showConfiguration {
                            ConfigurationCardView(isPresented: $showConfiguration)
                                .background(ClearBackgroundView())
                                .transition(.move(edge: .leading))
                                .onTapGesture {
                                    withAnimation {
                                        showConfiguration = false
                                    }
                                }
                        }
                    }
                    .onAppear {
                        withAnimation {
                            showConfiguration = false
                        }
                    }
                )
            }
            .navigationBarHidden(true)
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
