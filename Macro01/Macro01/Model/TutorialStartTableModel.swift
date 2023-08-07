//  TutorialStartTableModel.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 07/08/23.
//

import Foundation
    
    //Classe que colocar os dados no TutorialStarModel
    class TutorialStartTableModel: ObservableObject {
        
        let tutorialCharacterModel = TutorialStartModel(
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
    }
