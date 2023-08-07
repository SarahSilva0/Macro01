import SwiftUI

struct TutorialStartCardsView: View {
    
var tutorialCharacter = TutorialStartTableModel()
var countdownSheet: Int
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Circle()
                            .frame(width: 45, height: 45)
                            .foregroundColor(Color(hex: "FFF2D9"))
                            .overlay(
                                Text("1")
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(.black)
                            )
                            .frame(width: geometry.size.width * 0.15, height: geometry.size.height * 0.7)
                        
                        ForEach(tutorialCharacter.tutorialCharacterModel.card, id: \.self) { card in
                            (Image(card))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.22, height: geometry.size.height * 0.5)
                        }
                        
                        Spacer()
                        
                        //Contador provisório
                        ZStack {
                            CountdownBar(countdownFraction: countdownFraction())
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            print("oi")
                        }) {
                            Text("Pular Tutorial")
                                .font(.system(size: 12))
                                .foregroundColor(Color.white)
                        }
                        
                    }
                    .frame(width: geometry.size.width , height: geometry.size.height * 0.7)
                    //                    .background(.white)
                    
                    Spacer()
                    
                    HStack (alignment: .bottom) {
                        
                        Spacer()
                        
                        Character(character: tutorialCharacter.tutorialCharacterModel.characterImage[0])
                            .frame(width: geometry.size.width * 0.25, height: geometry.size.height * 0.3)
                        
//                        Spacer()
                        
                        TutorialDialogBox(characterName: tutorialCharacter.tutorialCharacterModel.charactersNames[0],
                            dialogue: tutorialCharacter.tutorialCharacterModel.dialoguePlayOne[6],
                            colorBox: "FFC097")
//
//                        Spacer()
                        
                        HStack {
                            VStack {
                                ButtonComponentImage(action: {
                                    print("oi")
                                }, image: "btn-back")
                                
                                ButtonComponentImage(action: {
                                    print("oi")
                                }, image: "btn-next")
                            }
                        }
                        
                    }
                    .ignoresSafeArea()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.28)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    
    
    //Funcao para mover o contador
    private func countdownFraction() -> CGFloat {
        let totalDuration: CGFloat = 5
        let remainingTime: CGFloat = CGFloat(countdownSheet)
        return (totalDuration - remainingTime) / totalDuration
    }
}
