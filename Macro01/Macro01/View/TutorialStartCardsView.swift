import SwiftUI

struct TutorialStartCardsView: View {
    
    var tutorialData = TutorialData()
    @State private var currentIndex = 0
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    
                    VStack {
                        Image(tutorialData.tutorialData[currentIndex].imageCenter)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geometry.size.height * 0.5)

                    }
                    .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.7, alignment: .center)
                    .ignoresSafeArea()
                    
                    HStack {
                        VStack{
                            Character(character: tutorialData.tutorialData[currentIndex].characterImage)
                        }
                        .frame(width: geometry.size.width * 0.3)
                        .ignoresSafeArea()
                        
                        HStack (spacing: 0) {
                            TutorialDialogBox(
                                characterName: tutorialData.tutorialData[currentIndex].charactersName,
                                dialogue: tutorialData.tutorialData[currentIndex].dialogue,
                                colorBox: tutorialData.tutorialData[currentIndex].dialogueColor)
                            .frame(width: geometry.size.width * 0.7)
                            
                            VStack {
                                ButtonComponentImage(action: {
                                    increaseIndex()
                                }, image: "NextRight")
                                
                                ButtonComponentImage(action: {
                                    decreaseIndex()
                                }, image: "NextLeft")
                                .opacity(currentIndex > 0 ? 1.0 : 0.0)
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
    
    private func increaseIndex() {
        currentIndex = min(currentIndex + 1, tutorialData.tutorialData.count - 1)
    }
    
    private func decreaseIndex() {
        currentIndex = max(currentIndex - 1, 0)
    }
}
