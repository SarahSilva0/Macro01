import SwiftUI

struct FirstView: View {
    @ScaledMetric(relativeTo: .body) var buttonSize: CGFloat = 50
    @State private var showConfiguration = false
    @State private var showGaleria = false
    
    @State var isActiveTutorial: Bool = true
    
//    let userDefault = UserDefaults.standard
    
    @State private var showTutorialStart = false
    @State private var showDificultyView = false
    
  
//    init() {
//        isActiveTutorial = getTutorialActive()
//    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black
                    .ignoresSafeArea()
                Image("BG GERAL")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
                
                Image("FolkardLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                
                VStack {
                    VStack {
                        HStack(spacing: 20) {
                            ButtonGenRound(action: {
                                withAnimation {
                                    showConfiguration = true
                                }
                            },
                                           image: "Configuração",
                                           foregroundColor: Color(hex: "FFF2D9"),
                                           backgroundColor: Color(hex: "FFF2D9"))
                            .frame(width: buttonSize, height: buttonSize)
                            
                            ButtonGenRound(action: {
                                showGaleria = true
                            },
                                           image: "Galeria",
                                           foregroundColor: Color(hex: "FFF2D9"),
                                           backgroundColor: Color(hex: "FFF2D9"))
                            .frame(width: buttonSize, height: buttonSize)
                            
                            Spacer()
                        }
                        .padding(.leading)
                    }
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                    
                    Spacer()
                    
                    VStack {
                        Button(action: {
                            if isActiveTutorial {
                                showTutorialStart = true
                            } else {
                                showDificultyView = true
                            }
                        }) {
                            Text("Jogar")
                                .font(Font.custom("CooperBlackStd", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(width: 200, height: 15)
                                .padding()
                                .background(Color(hex: "FFF2D9"))
                                .cornerRadius(10)
                        }
                        .sheet(isPresented: $showTutorialStart) {
                            TutorialStartCardsView()
                        }
                        .sheet(isPresented: $showDificultyView) {
                            DificultyView_(combatViewModel: CombatViewModel())
                        }
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
        .sheet(isPresented: $showGaleria){
            GaleriaSaciView()
        }
    }
    
//    func getTutorialActive() -> Bool {
//        guard let load = userDefault.object(forKey: "tutorialActive") as? Bool else {return true}
//        return load
//    }
    
   
}
