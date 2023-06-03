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
        GeometryReader { geometry in
            
//            ZStack {
                VStack {
                    HStack (alignment: .top) {
                        Text("ROUND " + String(combatViewModel.turn))
                            .fontWeight(.bold)
                    }
                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                    .background(Color.yellow)
                    
                    Spacer (minLength: 100)
                    
                    HStack (alignment: .center) {
                        if combatViewModel.isCountdownVisible {
                            Text("\(combatViewModel.countdown)")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                            
                        }
                    }
                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                    .background(Color.white)
                    
                    
            
                    
                    HStack {
                        VStack{
                            Text("Ganhou: \(combatViewModel.player1.winTurno)")
                                .foregroundColor(.red)
                                .offset(y: 200)
                            Text("Mana: \(combatViewModel.player1.mana)")
                                .foregroundColor(.red)
                                .offset(y: 200)
                            Image(combatViewModel.player1.image)
                                .offset(y: 170)
                        }
                        VStack {
                            Image(combatViewModel.player1.selectedCard)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 160)
                                .offset(y: 100)
                        }
                        Spacer()
                            .frame(width: 150)
                        VStack {
                            if !combatViewModel.isCountdownVisible{
                                Image(combatViewModel.player2.selectedCard)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120, height: 160)
                                    .offset(y:100)
                            }
                            else{
                                Image("")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120, height: 160)
                            }
                        }
                        VStack{
                            Text("Ganhou: \(combatViewModel.player2.winTurno)")
                                .foregroundColor(.red)
                                .offset(y: 200)
                            Text("Mana: \(combatViewModel.player2.mana)")
                                .foregroundColor(.red)
                                .offset(y: 200)
                            Image(combatViewModel.player2.image)
                                .offset(y: 170)
                        }
                    }
                    
                    //CARTAS DO PLAYER 1
                    HStack {
                        ForEach(combatViewModel.player1.cards, id: \.self) { card in
                            CardComponent(image: Image(card))
                                .onTapGesture {
                                    combatViewModel.isSheetVisible = true
                                }
                        }
                    }
                    .allowsHitTesting(combatViewModel.isInteractionEnabled)
                    .frame(width: 300, height: 300)
                    
                }
                
                .onAppear {
                    combatViewModel.startCountdown()
                }
                .ignoresSafeArea()
                .background(Color.gray)
                
                
                .sheet(isPresented: $combatViewModel.isSheetVisible, onDismiss: {
                }) {
                    SheetView(combatViewModel: combatViewModel, isSheetVisible: $combatViewModel.isSheetVisible).background(ClearBackgroundView())
                }
                .alert(isPresented: $combatViewModel.isGameEndAlertPresented) {
                    Alert(title: Text("Fim do Jogo"),
                          message: Text("\(combatViewModel.getScore())"),
                          dismissButton: .default(Text("OK"), action: {
                        presentationMode.wrappedValue.dismiss()
                    }))
                }
            }
            
        }
    }
//}

//MARK: SHEET VIEW EM QUE AS VIEWS APARECEM. PRECISA SER SEPARADA EM OUTRO ARQUIVO
struct SheetView: View {
    @ObservedObject var combatViewModel: CombatViewModel
    @Binding var isSheetVisible: Bool
    
    var body: some View {
        VStack {
            HStack {
                ForEach(combatViewModel.player1.cards, id: \.self) { card in
                    CardComponent(image: Image(card))
                        .onTapGesture {
                            combatViewModel.player1.selectedCard = card
                            print(combatViewModel.player1.selectedCard)
                            isSheetVisible = false
                        }
                }
            }
        }
    }
}

struct CombatView_Previews: PreviewProvider {
    static var previews: some View {
        CombatView()
    }
}

//MARK: ESSA STRUCT E PARA O FUNDO DA VIEW FICAR TRANSPARENTE
struct ClearBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return InnerView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    private class InnerView: UIView {
        override func didMoveToWindow() {
            super.didMoveToWindow()
            
            superview?.superview?.backgroundColor = .clear
        }
        
    }
}

