//import SwiftUI
//
//struct CardOverlayView: View {
//    var cards: [CardModel]
//    var onSelectCard: ((CardModel) -> Void)
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                Color(.black)
//                    .opacity(0.7)
//                
//                VStack {
//                    Text("Cartas do Primeiro Jogador")
//                        .font(.headline)
//                    
//                    HStack(spacing: 10) {
//                        ForEach(cards) { card in
//                            CardComponent(image: Image(card.image))
//                                .onTapGesture {
//                                    onSelectCard(card)
//                                }
//                        }
//                        .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
//                    }
//                }
//                .frame(width: geometry.size.width * 0.9)
//            }
//            .ignoresSafeArea(.all)
//        }
//    }
//}
