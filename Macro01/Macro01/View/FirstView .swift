import SwiftUI
import Foundation

struct FirstView: View {
    @ScaledMetric(relativeTo: .body) var buttonSize: CGFloat = 50
    @State private var showConfiguration = false
    @State private var showGaleria = false
        
    @AppStorage("tutorial") var isActiveTutorial: Bool = true
    
    
    @State private var isTutorialSheetPresented = false
    @State private var showDificultyView = false
    
    @AppStorage("Raia") var raiaWin: Bool = false
    @AppStorage("Boto") var botoWin: Bool = false
    @AppStorage("Cuca") var cucaWin: Bool = false
    
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
                                           image: "buttonConf",
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
                    .frame(width: geometry.size.width * 1.02, height: geometry.size.height * 0.2)
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            if isActiveTutorial {
                                isTutorialSheetPresented = true
                            }
                            if isActiveTutorial == false {
                                showDificultyView = true
                            }
                        }) {
                            Text("Jogar".localizedLanguage())
                                .font(Font.custom("CooperBlackStd", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(width: 200, height: 15)
                                .padding()
                                .background(Color(hex: "FFF2D9"))
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 10)
                        .sheet(isPresented: $isTutorialSheetPresented, onDismiss: {
                            showDificultyView = true
                        }) {
                            TutorialStartCardsView(isActiveTutorial: $isActiveTutorial, isTutorialSheetPresented: $isTutorialSheetPresented, showDificultyView: $showDificultyView)
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
            GaleriaSaciView(raiaWin: $raiaWin, botoWin: $botoWin, cucaWin: $cucaWin, isPresented: $showGaleria)
            }
        }
        
        
    }
   

