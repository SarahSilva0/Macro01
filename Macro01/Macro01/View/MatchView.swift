import SwiftUI

struct MatchView: View {
    @ObservedObject var gameModel: GameTableModel
    @State private var showCardOverlay = false
    @State private var centerCards: [CardModel] = []
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0) {
                    HStack {
                        Text("PLACAR")
                            .foregroundColor(.white)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.2)
                    .background(Color.black)
                    
                    HStack {
//                        Text("Cartas player 2")
//
//                        ForEach(gameModel.players[1].cards.prefix(3)) { card in
//                            CardComponent(image: Image(card.image))
//                                .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
//                        }
                        
                    }.background(Color.red)
                    
                    HStack(alignment: .bottom, spacing: 0) {
                       
                        VStack {
                            //Personagem 1
                            CharacterAndTextBox(character: "character")
                                .frame(width: geometry.size.width * 0.10, height: geometry.size.height * 0.20)
                            
                            
                            //Botao para escolher a carta jogador 1
                            Button(action: {
                                showCardOverlay.toggle()
                            }) {
                                Text("ABRIR A ESCOLHA DE CARTAS")
                                    .foregroundColor(.yellow)
                            }
                            
                            
//                            Text("JOGADOR 1")
//                            Text("\(gameModel.players[0].mana)")
//                            Text("\(gameModel.players[0].points)")
//
//                            Button(action: {
//                                clearCenterCards()
//                            }) {
//                                Text("Limpar Center Cards")
//                                    .foregroundColor(.yellow)
//                            }
                        }
                        .frame(width: geometry.size.width * 0.3, height: geometry.size.height)
                        .background(Color.blue)
                        
                        VStack(spacing: 0) {
                            HStack {
                                Text("Cartas no centro")
                                ForEach(centerCards) { card in
                                    CardComponent(image: Image(card.image))
                                }
                            }
                            .frame(width: geometry.size.width * 0.15, height: geometry.size.height * 0.25)
                            .background(Color.yellow)
                            
                            Spacer(minLength: 150)
                            HStack(alignment: .top, spacing: 0) {
                                ForEach(gameModel.players[0].cards.prefix(3)) { card in
                                    CardComponent(image: Image(card.image))
                                        .frame(width: geometry.size.width * 0.15, height: geometry.size.height * 0.15)
                                }
                            }

                            .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.3)
                            .background(Color.green)
                            
                            Spacer()
                            
                        }
                        
                        VStack {
                            //Personagem 2
                            CharacterAndTextBox(character: "character")
                                .frame(width: geometry.size.width * 0.10, height: geometry.size.height * 0.20)
                            Button(action: {
                                if let card = gameModel.players[1].cards.first {
                                    centerCards.append(card)
                                    gameModel.players[1].cards.removeFirst()

                                    //TESTE
                                    print(centerCards)
                                }
                            }) {
                                Text("ESCOLHER CARTAS 2")
                                    .foregroundColor(.yellow)
                            }
//
//                            Button(action: {
//                                gameModel.addRandomCardToPlayerOneFromDeck()
//                                gameModel.addRandomCardToPlayerTwoFromDeck()
//                            }) {
//                                Text("Adicionar Cartas Aleatórias")
//                                    .foregroundColor(.green)
//                            }
//
//                            Text("JOGADOR 2")
//                            Text("\(gameModel.players[1].mana)")
//                            Text("\(gameModel.players[1].points)")
//
//                            Button(action: {
//                                compareCardsInCenter()
//                                clearCenterCards()
//                            }) {
//                                Text("Comparar Cartas")
//                                    .foregroundColor(.yellow)
//                            }
                        }
                        .frame(width: geometry.size.width * 0.3, height: geometry.size.height)
                        .background(Color.red)
                        
                        
                    }
                    
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                
                if showCardOverlay {
                    CardOverlayView(cards: gameModel.players[0].cards) { selectedCard in
                        gameModel.selectCard(selectedCard)
                        centerCards.append(selectedCard)
                        showCardOverlay = false
                    }
                    .environmentObject(gameModel) // Compartilhar a instância do gameModel com o CardOverlayView
                }
            }
        }
    }
    
    // Esvazia o clearCenterCards
    func clearCenterCards() {
        centerCards.removeAll()
    }
    
    func compareCardsInCenter() {
        guard centerCards.count == 2 else {
            return
        }

        let card1 = centerCards[0]
        let card2 = centerCards[1]

        switch (card1.type, card2.type) {
        
        case ("attack", "attack"):
            print("Ambos perdem 1 de Mana")
            
        case ("attack", "recharge"):
            print("Vitória do atacante")
            
        case ("attack", "defense"):
            print("O atacante perde 1 de Mana")
            
        case ("defense", "defense"):
            print("Nada acontece")
            
        case ("defense", "recharge"):
            print("O carregador ganha 1 de Mana")
            
        case ("recharge", "recharge"):
            print("Ambos ganham 1 de Mana")
            
        default:
            print("Nada acontece")
        }
    }




}
