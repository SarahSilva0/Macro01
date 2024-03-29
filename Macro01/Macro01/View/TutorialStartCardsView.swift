
import SwiftUI

struct TutorialStartCardsView: View {
    
    var tutorialData = TutorialData()
   
    @State private var currentIndex = 0
    @State private var shouldNavigate = false
    
    @Binding var isActiveTutorial: Bool
    @Binding var isTutorialSheetPresented: Bool
    @Binding var showDificultyView: Bool
    private let sound = SoundManager.instance
    
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            isTutorialSheetPresented = false
                            isActiveTutorial = false
                        }) {
                            Text("Pular Tutorial".localizedLanguage())
                                .font(.custom("SF Pro", size: 12))
                                .foregroundColor(.white)
                                .padding(.top, 25)
                        }
                      
                    }
                    Spacer()
                }
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
                        VStack {
                            Character(character: tutorialData.tutorialData[currentIndex].characterImage)
                                .frame(width: geometry.size.width * 0.25, height: geometry.size.height * 0.25, alignment: .bottomLeading)
                        }
                        .frame(width: geometry.size.width * 0.25, height: geometry.size.height * 0.42, alignment: .bottom)
                        .ignoresSafeArea()
                        
                        Spacer()

                        HStack (spacing: 0) {
                            TutorialDialogBox(
                                characterName: tutorialData.tutorialData[currentIndex].charactersName,
                                dialogue: tutorialData.tutorialData[currentIndex].dialogue,
                                colorBox: tutorialData.tutorialData[currentIndex].dialogueColor)
                            .frame(width: geometry.size.width * 0.7)
                            
                            HStack {
                                VStack {
                                    ButtonComponentImage(action: {
                                        decreaseIndex()
                                        sound.buttonSound()
                                    }, image: "NextLeft")
                                    .opacity(currentIndex > 0 ? 1.0 : 0.0)
                                    
                                    ButtonComponentImage(action: {
                                        increaseIndex()
                                        sound.buttonSound()
                                    }, image: "NextRight")
                                }
                            }
                            .frame(width: geometry.size.width * 0.057)
                        }
                        .frame(width: geometry.size.width * 0.7, alignment: .trailing)
                        
                    }
                    .frame(width: geometry.size.width * 1, height: geometry.size.height * 0.3, alignment: .center)
                    .background(.black)
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }
        }
        .sheet(isPresented: $shouldNavigate) {
            DificultyView_(combatViewModel: CombatViewModel())
        }
        .onAppear{
            sound.playSound(music: .tutorial)
        }
        .onDisappear{
            sound.playSound(music: .lobbyMusic)
        }
        
    }
    
    private func increaseIndex() {
        if currentIndex < tutorialData.tutorialData.count - 1 {
            currentIndex += 1
        } else {
            isTutorialSheetPresented = false
            isActiveTutorial = false
        }
    }
    
    private func decreaseIndex() {
        currentIndex = max(currentIndex - 1, 0)
    }
    
}
