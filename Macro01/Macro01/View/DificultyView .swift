//
//  DificultyView .swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 13/06/23.
//

import SwiftUI

struct DificultyView_: View {
    
    @State private var shouldNavigate = false
    @ObservedObject var combatViewModel: CombatViewModel
    @Environment(\.presentations) private var presentations
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("Raia") var raiaWin: Bool = false
    @AppStorage("Boto") var botoWin: Bool = false
    @AppStorage("Cuca") var cucaWin: Bool = false
    let sound = SoundManager.instance

    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("BG Galeria")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                
                VStack {
                    HStack {
                        ButtonGenRound(action: {
                            withAnimation {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        },
                                       image: "out",
                                       foregroundColor: (Color(hex: "FFF2D9")),
                                       backgroundColor: (Color(hex: "FFF2D9")))
                                       .frame(width: 50, height: 50)
                    
                        Spacer()
                        
                    }
                    Spacer()
                        .frame(width: geo.size.width * 0.01, height: geo.size.height * 0.8)
                }
                .frame(width: geo.size.width * 1.06, height: geo.size.height * 0.1)
                
                
                
                VStack{
                    VStack(alignment: .center, spacing: 35){
                        Text("Selecione um Oponente")
                            .font(Font.custom("CooperBlackStd", size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        HStack(spacing: 20){
                            Button {
                                iaraButton()
                                sound.playSound(music: .iaraSong)
                            } label: {
                               iaraImage()
                            }
                        
                            Button {
                                botoButton()
                                sound.playSound(music: .botoSong)
                            } label: {
                                botoImage()
                            }.disabled(!raiaWin)
                            
                            Button {
                                cucaButton()
                                sound.playSound(music: .cucaSong)
                            } label: {
                                cucaImage()
                            }.disabled(!botoWin)


                            
                        }
                    }
                    .frame(width: geo.size.width * 0.6)
                    .padding(.vertical) // mudar aqui caso não de certo
                }.frame(height: geo.size.height * 0.8, alignment: .bottom)
            }.frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            
        }.sheet(isPresented: $shouldNavigate, onDismiss: {
            combatViewModel.startCountdown()
            combatViewModel.gameReset()
            sound.playSound(music: .lobbyMusic)
        }){
            CombatView(combatViewModel: combatViewModel, raiaWin: $raiaWin, botoWin: $botoWin, cucaWin: $cucaWin)
                .environment(\.presentations, presentations + [$shouldNavigate])
        }
    }
}

//MARK: CONFIGURANDO OS BOTOES
extension DificultyView_{
    func iaraButton(){
        print("Raia")
        combatViewModel.BotoDiff.selectdedLevel = false
        combatViewModel.RaiaDiff.selectdedLevel = true
        combatViewModel.CucaDiff.selectdedLevel = false
        combatViewModel.setPlayer()
        shouldNavigate.toggle()
    }
    func botoButton(){
        print("Boto")
        combatViewModel.RaiaDiff.selectdedLevel = false
        combatViewModel.BotoDiff.selectdedLevel = true
        combatViewModel.CucaDiff.selectdedLevel = false
        combatViewModel.setPlayer()
        shouldNavigate.toggle()
    }
    func cucaButton(){
        print("Cuca")
        combatViewModel.RaiaDiff.selectdedLevel = false
        combatViewModel.BotoDiff.selectdedLevel = false
        combatViewModel.CucaDiff.selectdedLevel = true
        combatViewModel.setPlayer()
        shouldNavigate.toggle()
    }
}

//MARK: CONFIGURANDO AS IMAGENS
extension DificultyView_{
    @ViewBuilder
    func botoImage() -> some View {
        if raiaWin == false {
            Image(combatViewModel.BotoDiff.imageInitial)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        else if raiaWin == true && botoWin == false {
            Image(combatViewModel.BotoDiff.imageSillhoute)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        else if botoWin == true {
            Image(combatViewModel.BotoDiff.imageWin)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
    @ViewBuilder
    func iaraImage() -> some View {
        if raiaWin == true {
            Image("charWinIara")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        else{
            Image("charIara")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
    @ViewBuilder
    func cucaImage() -> some View{
        if botoWin == false{
            Image("charBlockCuca")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        else if botoWin == true && cucaWin == false {
            Image("charCuca")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        
        else if cucaWin == true{
            Image("charWinCuca")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}



