import SwiftUI

struct MatchView: View {
    
    @ObservedObject var gameModel: GameTableModel
    
    @State private var showCardOverlay = false
    @State private var selectedCard: CardModel?
    
    var body: some View {
        GeometryReader { geometry in
//        VStack {
            ZStack {
            
                VStack (spacing: 0){
                    HStack {
                        Text(" HIGONaaaa ")
                            .foregroundColor(.white)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.2)
                    .background(Color.black)
                    
                    HStack(alignment: .bottom, spacing: 0) {
                        
                        VStack {
                            Text(" MARCELO ")
                        } .frame(width: geometry.size.width * 0.3, height: geometry.size.height)
                            .background(Color.green)
                        
                        Text("oi")
                        
                        VStack(spacing: 0){
                            
                            HStack(){
                                Text("Higona")
                            }.frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.8 )
                                .background(.yellow)
                            
                            HStack {
                                if let cards = gameModel.players[0].cards {
                                    ForEach(cards) { card in
                                        CardComponent(image: Image(card.image))
                                            .onTapGesture {
                                                //                                                selectedCard = card
                                                showCardOverlay = true
                                                
                                            }
                                    }
                                }
                                
                            }
                            .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.2, alignment: .center )
                            .background(Color.white)
                        }
                        
                        VStack {
                            Text(" GUSTAVO ")
                        }.frame(width: geometry.size.width * 0.3, height: geometry.size.height)
                            .background(Color.blue)
                    }
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                
                if showCardOverlay {
                  
                    VStack{
                        CardOverlayView(showCardOverlay: $showCardOverlay, selectedCard: $selectedCard, gameModel: gameModel)
                            .frame(width: geometry.size.width)
                    }
                    
                    
    
                }
            }
    }
        
//        .sheet(isPresented: $showCardOverlay) {
//                   CardOverlayView(showCardOverlay: $showCardOverlay, selectedCard: $selectedCard, gameModel: gameModel)
//
//               }
    }
    
}


struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView(gameModel: GameTableModel())
    }
}
