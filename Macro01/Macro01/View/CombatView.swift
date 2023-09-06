//
//  CombatView.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 30/05/23.
//

import SwiftUI

//MARK: VIEW DO COMBATE. ESSA VIEW PRECISA SER REFATORADA DEPOIS E DEIXADA MAIS RESPONSIVA
struct CombatView: View {
    
    @ObservedObject var combatViewModel: CombatViewModel
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.presentations) var presentations
    @Environment(\.dismiss) var dismiss
    @Binding var raiaWin: Bool
    @Binding var botoWin: Bool
    @Binding var cucaWin: Bool
    private let sound = SoundManager.instance
    
    
    var body: some View {
        ZStack {
            Image("backgroundOne")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                if combatViewModel.timeAndSheetIsVisible(){
                    //Vitoria e derrota > Exibido quando ganha ou perde a partida.
                    if combatViewModel.checkSomeoneWon() {
                        WinnerText(text: combatViewModel.checkGameWinner()[0], size: 50)
                            .padding(.top, 30)
                        WinnerText(text: combatViewModel.checkGameWinner()[1], size: 15)
                        if combatViewModel.player1Won() {
                            ButtonPlayAgain(action: {
                                if combatViewModel.RaiaDiff.winLevel == true{
                                    raiaWin = combatViewModel.RaiaDiff.winLevel
                                }
                                if combatViewModel.BotoDiff.winLevel == true {
                                    botoWin = combatViewModel.BotoDiff.winLevel
                                }
                                if combatViewModel.CucaDiff.winLevel == true {
                                    cucaWin = combatViewModel.CucaDiff.winLevel
                                }
                                sound.buttonSound()
                                combatViewModel.gameReset()
                                dismiss()
                                sound.playSound(music: .lobbyMusic)
                            }, btnName: "Sair")
                        }
                        else {
                            HStack {
                                ButtonPlayAgain(action: {
                                    sound.buttonSound()
                                    combatViewModel.gameReset()
                                    dismiss()
                                    sound.playSound(music: .lobbyMusic)
                                }, btnName: "Sair")
                                Spacer()
                                    .frame(width: 30)
                                ButtonPlayAgain(action: {
                                    sound.buttonSound()
                                    combatViewModel.startCountdown()
                                    combatViewModel.gameReset()
                                }, btnName: "Jogar Novamente")
                            }
                        }
                    }
                    //Parabens, Empate e Cuidado > Exibido a cada jogada de cartas
                    else {
                        WinnerText(text: combatViewModel.checkPlayerVictory()[0], size: 50)
                        WinnerText(text: combatViewModel.checkPlayerVictory()[1], size: 15)
                    }
                }
            }
            
            //MARK: CONTADOR DO CENTRO DA TELA
            VStack {
                if combatViewModel.isCountdownVisible {
                    Text("\(combatViewModel.countdown)")
                        .font(Font.custom("CooperBlackStd", size: 75))
                        .foregroundColor(Color(hex: "3C3634"))
                        .bold()
                }
            }
            
            GeometryReader { geometry in
                VStack {
                    //MARK: PLACAR
                    VStack {
                        ScoreView(player1Wins: combatViewModel.player1.winTurno,
                                  player2Wins: combatViewModel.player2.winTurno)
                        .padding(.bottom)
                    }
                    .frame(width: geometry.size.width * 0.25, height: geometry.size.height * 0.22, alignment: .center)
                    Spacer()
                    
                    VStack {
                        //MARK: CARTA JOGADA NO CENTRO PELO PLAYER 1
                        HStack (alignment: .center) {
                            Image(combatViewModel.player1.selectedCard.name)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: geometry.size.height * 0.4)
                            
                            
                            Spacer(minLength: 300)
                            
                            if !combatViewModel.isSheetVisible {
                                Image(combatViewModel.player2.selectedCard.name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: geometry.size.height * 0.4)
                            } else {
                                Image("")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }
                        }
                        .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.7, alignment: .center)
                        .animation(.easeOut(duration: 0.3))
                    }
                    .frame(height: geometry.size.height * 0.5, alignment: .bottom)
                    
                    //MARK: AS 3 CARTAS DO PLAYER 1 NA PARTE DEBAIXO
                    HStack {
                        ForEach(combatViewModel.player1.cards, id: \.self) { card in
                            if !combatViewModel.checkSomeoneWon() {
                                CardComponentMainScreen(image: Image(card.name))
                            }
                        }
                        .frame(width: geometry.size.width * 0.13, height: geometry.size.height * 0.1)
                        
                    }
                    .animation(.easeInOut(duration: 1.0))
                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2, alignment: .bottom)
                    
                }
                //AQUI MEXE NA ALTURA DAS CARTAS EM RELACAO AS CARTAS DO CENTRO
                .frame(width: geometry.size.width, height: geometry.size.height * 1.1, alignment: .center)
                
                ZStack {
                    VStack {
                        //MARK: BOTÃO DE PAUSE
                        HStack {
                            ButtonGenRound(action: {
                                sound.buttonSound()
                                combatViewModel.isPaused = true
                                print(combatViewModel.isPaused)
                            },
                                           image: "pause",
                                           foregroundColor: Color(hex: "FFF2D9"),
                                           backgroundColor: Color(hex: "FFF2D9"))
                            .frame(width: 40, height: 40)
                            .padding(.all)
                        }
                        .disabled(!combatViewModel.endTurnButtonInteraction)
                        .sheet(isPresented: $combatViewModel.isPaused){
                            PausedView(isPresented: $combatViewModel.isPaused, combatViewModel: combatViewModel)
                                .environment(\.presentations, presentations + [$combatViewModel.isPaused])
                                .background(ClearBackgroundView())
                            
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.5, alignment: .topLeading)
                        
                        HStack {
                            //MARK: PERSONAGEM PLAYER 1
                            VStack {
                                Character(character: combatViewModel.player1.name)
                                    .frame(width: geometry.size.width * 0.19, height: geometry.size.height * 0.32)
                            }
                            
                            Spacer()
                            
                            //MARK: PERSONAGEM PLAYER 2
                            VStack {
                                Character(character: combatViewModel.player2.name)
                                    .frame(width: geometry.size.width * 0.19, height: geometry.size.height * 0.32)
                            }
                        }
                        .ignoresSafeArea()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.48, alignment: .bottom)
                    }
                    
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width: 58, height: 58)
                                .foregroundColor(Color(hex: "3C3634"))
                            
                            Circle()
                                .frame(width: 45, height: 45)
                                .foregroundColor(Color(hex: "FFF2D9"))
                                .overlay(
                                    Text("1")
                                        .font(.system(size: 30, weight: .bold))
                                        .foregroundColor(.black)
                                )
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .bottomLeading)
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
        .navigationBarHidden(true)
    }
}
