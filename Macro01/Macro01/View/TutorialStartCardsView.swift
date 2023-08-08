import SwiftUI

struct TutorialStartCardsView: View {
    
    var tutorialData = TutorialData()
    
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                
                VStack {
                    
                    
                    VStack {
                        Image(tutorialData.tutorialData[0].imageCenter)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: geometry.size.width * 0.15, height: geometry.size.height * 0.5, alignment: .center)
                    
                    
                    .frame(height: geometry.size.height * 0.7)
                    .ignoresSafeArea()
                    
                    
                    HStack {
                        VStack{
                            Character(character: tutorialData.tutorialData[0].characterImage)
                        }
                        .frame(width: geometry.size.width * 0.3)
                        .ignoresSafeArea()
                        
                        HStack (spacing: 0) {
                            TutorialDialogBox(
                                characterName: tutorialData.tutorialData[0].charactersName,
                                dialogue: tutorialData.tutorialData[0].dialogue,
                                colorBox: "FFC097")
                            .frame(width: geometry.size.width * 0.7)
                            
                            VStack {
                                ButtonComponentImage(action: {
                                    print("oi")
                                }, image: "NextLeft")
                                
                                ButtonComponentImage(action: {
                                    print("oi")
                                }, image: "NextRight")
                            }
                        }
                        .frame(width: geometry.size.width * 0.7, alignment: .trailing)
                        
                    }
                    .frame(width: geometry.size.width * 1, height: geometry.size.height * 0.3, alignment: .center)
                    .background(.black)
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                
            }
        }
        }
    }
}
