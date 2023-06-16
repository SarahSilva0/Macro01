//
//  CombatView.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 30/05/23.
//

import SwiftUI

//MARK: VIEW DO COMBATE. ESSA VIEW PRECISA SER REFATORADA DEPOIS E DEIXADA MAIS RESPONSIVA
struct CombatView: View {
    
    @StateObject private var combatViewModel = CombatViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ZStack {
            Image("backgroundOne")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                if combatViewModel.isCountdownVisible {
                    Text("\(combatViewModel.countdown)")
                        .font(.custom("Helvetica Neue", size: 50))
                        .foregroundColor(Color(hex: "3C3634"))
                        .fontWeight(.bold)
                }
                
            }
            
            GeometryReader { geometry in
                VStack {
                    //CARTA DOS PLAYERS
                    VStack {
                        //PLACAR
                        ScoreView(player1Wins: combatViewModel.player1.winTurno,
                                  player2Wins: combatViewModel.player2.winTurno)
                        .padding(.bottom)
                        
                    }
                    .frame(width: geometry.size.width * 0.25, height: geometry.size.height * 0.22, alignment: .center)
                    Spacer()
                    
                    VStack {
                        //CARTAS AO CENTRO
                        HStack (alignment: .center){
                            Image(combatViewModel.player1.selectedCard)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: geometry.size.height * 0.4)
                            
                            Spacer(minLength: 130)
                            
                            if !combatViewModel.isSheetVisible {
                                Image(combatViewModel.player2.selectedCard)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: geometry.size.height * 0.4)
                            } else {
                                Image("")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }
                        }
                        .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.6, alignment: .bottom)
                    }
                    .frame(height: geometry.size.height * 0.5, alignment: .bottom)
//                    .background(.yellow)

                        HStack {
                            ForEach(combatViewModel.player1.cards, id: \.self) { card in
                                CardComponent(image: Image(card))
                            }
                            .frame(width: geometry.size.width * 0.12, height: geometry.size.height * 0.12, alignment: .top)
                            
                            //VERIFICAR SE ESTÁ NO LUGAR CORRETIO
                            .allowsHitTesting(combatViewModel.isInteractionEnabled)
                        }
                        .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.25, alignment: .bottom)
//                        .background(.red)

                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                
                ZStack {
                    VStack{
                        HStack{
                            ButtonGenRound(action: {
                                presentationMode.wrappedValue.dismiss()
                            },
                                           image: "pause",
                                           foregroundColor: Color(hex: "FFF2D9"),
                                           backgroundColor: Color(hex: "FFF2D9"))
                            .frame(width: 40, height: 40)
                            .padding(.all)
                            
                            
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.5, alignment: .topLeading)
                        
                        HStack {
                            VStack {
                                Character(character: "player1")
                                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.25)
                            }
                            
                            Spacer()
                            
                            VStack {
                                Character(character: "player2")
                                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.32)
                            }
                        }
                        .ignoresSafeArea()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.5, alignment: .bottom)
                    }
                }
            }
        }
        .onAppear {
            combatViewModel.startCountdown()
        }
        .sheet(isPresented: $combatViewModel.isSheetVisible, onDismiss: {
        }) {
            SheetView(combatViewModel: combatViewModel, isSheetVisible: $combatViewModel.isSheetVisible, countdownSheet: $combatViewModel.countdownSheet).background(ClearBackgroundView())
        }
        .alert(isPresented: $combatViewModel.isGameEndAlertPresented) {
            Alert(title: Text("Fim do Jogo"),
                  message: Text("\(combatViewModel.getScore())"),
                  dismissButton: .default(Text("OK"), action: {
                presentationMode.wrappedValue.dismiss()
            }))
        }
        .navigationBarHidden(true)
    }
}

struct CombatView_Previews: PreviewProvider {
    static var previews: some View {
        CombatView()
    }
}








