<<<<<<< Updated upstream
//
//  MatchView.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 27/05/23.
//

import SwiftUI
=======
>>>>>>> Stashed changes


import SwiftUI
struct MatchView: View {
    var gameModel: GameModel
    
    var body: some View {
        GeometryReader { geometry in
<<<<<<< Updated upstream
            HStack {
                VStack(alignment: .trailing) {
                    Spacer()
                    CharacterTextBox(character: "character")
                        .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.22)
                }
                
                VStack {
                    Spacer()
                    HStack {
                        ForEach(gameModel.players[0].cards) { card in
                            CardComponent(image: Image(card.image))
                                .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.5)
                        }
=======
            VStack (spacing: 0) {
                
                if let cards = gameModel.players[0].cards {
                
                    ForEach(cards) { card in
                        CardComponent(image: Image(card.image))
                            .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.5)
                            .onTapGesture {
                                selectedCard = card
                                showCardOverlay = true
                                
                            }
>>>>>>> Stashed changes
                    }
                    .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
                }
<<<<<<< Updated upstream
                .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 1.0)

            
                
                VStack(alignment: .leading) {
                    Spacer()
                    CharacterTextBox(character: "character")
                        .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.22)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
=======
                 
            }
            .sheet(isPresented: $showCardOverlay) {
                CardOverlayView(showCardOverlay: $showCardOverlay, selectedCard: $selectedCard, gameModel: gameModel)
            }
>>>>>>> Stashed changes
        }
    }
}







struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView(gameModel: GameModel())
    }
}
