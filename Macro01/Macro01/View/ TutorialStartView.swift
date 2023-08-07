//
//  TutorialStarView.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 06/08/23.
//


import SwiftUI

//
//  TutorialStarView.swift
//  Macro01
//
//  Created by Higor Lo Castro on 06/08/23.
//

import SwiftUI

struct TutorialStartView: View {
    
   var countdownSheet: Int
    
    let tutorialCharacter = TutorialStarModel(
        characterImage: ["playerSaci", "playerIara"],
        card: ["attackSaci", "defenseSaci", "rechargeSaci"],
        charactersNames: ["SP", "Raia"],
        dialoguePlayOne: ["Oi, tudo bem?",
                          "Meu nome é Sallo Pereira. Meus amigos me chamam de SP. Então pode me chamar assim.",
                          "Te convido pra disputa de um torneiro. Vem comigo!",
                          "Vou te explicar como será a disputa!",
                          "Esse torneio se chama Folkard, e a primeira adversária será a Raia. Ela é muito competitiva",
                          "O torneio consiste em um jogo de cartas, em 3 turnos. Aquele que vencer os turnos primeiro ganha a Rodada.",
                          "Vou te explicar sobre as cartas.",
                          "Essa é a Carta de Recarga. Sua função é gerar Carga de Energia que será utilizada pelas Cartas de Ataque. Entretanto, ao usá-la você pode tomar um ataque do inimigo. Então cuidado!",
                          "Essa é a Carta de Ataque. Ao usa-la, você ataca, e ao mesmo tempo não sofre dano. Mas fique atento, a Carta de Ataque consome Carga de Energia.",
                          "Ao utilizar uma Carta de Ataque sem Energia,  o efeito do ataque é é nulo, ou seja, você perde o turno. Mas fica tranquilo isso não significa derrota.",
                          "Essa é a Carta de Defesa. Ela é capaz de te proteger de um ataque.",
                          "A cada rodada, suas cartas estarão na parte inferior da mesa, e você terá 3 Segundos para a opção de escolha aparecer.",
                          "Após os 3 segundos você deverá selecionar uma das cartas, mas atenção, um temporizador de 5 Segundos marcará seu tempo na direita.",
                          "Você deve selecionar uma das cartas antes do término de 5 Segundos.",
                          "Se nenhuma carta for selecionada, uma Carta Nula será jogada automaticamente, e você perde o turno.",
                          "Quando ambos jogadores selecionarem suas cartas, um duelo é executado. Ganha a rodada aquele que conseguir um Sucesso no Ataque.",
                          "Será que minha oponente está preparada?"],
        dialoguePlayTwo: ["Olá, SP, estou pronta!  E você, preparado para a Derrota?"],
        buttonLeft: "buttonLeft",
        buttonRight: "buttonRight"
    )
    
    
    
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
                        
                        
                        ForEach(tutorialCharacter.card, id: \.self) { card in
                            (Image(card))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.22, height: geometry.size.height * 0.5)
                        }
                        
                        Spacer()
                        
                        ZStack(alignment: .bottomLeading) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 15, height: 230)
                                .foregroundColor(Color(hex: "FFF2D9"))
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 15, height: 230 * (1 - countdownFraction()))
                                .foregroundColor(Color(hex: "688869"))
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
                    
                    HStack {
                        Character(character: tutorialCharacter.characterImage[0])
                            .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.25)
                        
                        TutorialDialogBox(characterName: tutorialCharacter.charactersNames[0], dialogue: tutorialCharacter.dialoguePlayOne[6], colorBox: "FFC097")
                        
                     
                        
                        VStack {
                            ButtonComponentImage(action: {
                                          print("oi")
                                      }, image: "buttonLeft")
                            
                            ButtonComponentImage(action: {
                                          print("oi")
                                      }, image: "buttonRight")
                        }
                        
                    }
                    .frame(width: geometry.size.width  , height: geometry.size.height * 0.3)
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


