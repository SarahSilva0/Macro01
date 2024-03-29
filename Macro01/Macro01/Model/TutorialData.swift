//  TutorialStartTableModel.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 07/08/23.
//

class TutorialData {
    let tutorialData: [TutorialModel]

    init() {
        let tutorialViewOneData = TutorialModel(
            charactersName: "???",
            characterImage: "saciSilhouette",
            imageCenter: "",
            dialogue: "Oi, tudo Bem?".localizedLanguage(),
            dialogueColor: "FFF2D9"
        )

        let tutorialViewTwoData = TutorialModel(
            charactersName: "SP",
            characterImage: "Saci",
            imageCenter: "",
            dialogue: "Seja bem-vindo ao torneio Folkard, meu nome é Sallo Pereira, mas meus amigos me chamam de SP, então pode me chamar assim.".localizedLanguage(),
            dialogueColor: "FFC097"
        )
        
        let tutorialViewThreeData = TutorialModel(
            charactersName: "SP",
            characterImage: "Saci",
            imageCenter: "",
            dialogue: "Vou te explicar um pouco sobre o torneiro.".localizedLanguage(),
            dialogueColor: "FFC097"
            
        )
        
        let tutorialViewFourData = TutorialModel(
            charactersName: "SP",
            characterImage: "Saci",
            imageCenter: "score",
            dialogue: "O torneio consiste em um jogo de cartas, em que, aquele que conseguir 3 pontos primeiro vence!".localizedLanguage(),
            dialogueColor: "FFC097"
            
        )
        
        let tutorialViewFiveData = TutorialModel(
            charactersName: "SP",
            characterImage: "Saci",
            imageCenter: "rechargeSaci",
            dialogue: "Essa é a Carta de Recarga, sua função é gerar Cargas de Energia utilizadas pelas Cartas de Ataque, entretanto, ao usá-las você fica vulnerável a ataques inimigos, então, é melhor ter cuidado!".localizedLanguage(),
            dialogueColor: "FFC097"
           
        )
        
        let tutorialViewSixData = TutorialModel(
            charactersName: "SP",
            characterImage: "Saci",
            imageCenter: "attackSaci",
            dialogue: "Ao usar uma Carta de Ataque, você poderá tanto atacar, quanto defender golpes, mas atenção, elas consomem uma Carga de Energia!".localizedLanguage(),
            dialogueColor: "FFC097"
           
        )
        
        let tutorialViewSevenData = TutorialModel(
            charactersName: "SP",
            characterImage: "Saci",
            imageCenter: "attackSaci",
            dialogue: "O que acontece quando você utiliza essa carta sem Cargas de Energia? Bem, seu efeito é anulado, ou seja, você perde seu turno, mas fica tranquilo isso não significa derrota.".localizedLanguage(),
            dialogueColor: "FFC097"
        )
        
        let tutorialViewEightData = TutorialModel(
            charactersName: "SP",
            characterImage: "Saci",
            imageCenter: "defenseSaci",
            dialogue: "Também, temos a Carta de Defesa, ela é capaz de te proteger sem a necessidade de uma Carga de Energia.".localizedLanguage(),
            dialogueColor: "FFC097"
        )
        
        let tutorialViewNineData = TutorialModel(
            charactersName: "SP",
            characterImage: "Saci",
            imageCenter: "timer",
            dialogue: "A cada turno você terá 3 Segundos pra elaborar sua próxima jogada.".localizedLanguage(),
            dialogueColor: "FFC097"
        )
        
        let tutorialViewTenData = TutorialModel(
            charactersName: "SP",
            characterImage: "Saci",
            imageCenter: "selectCard",
            dialogue: "Logo depois, você deverá selecionar uma das cartas, mas atenção, um temporizador de 5 Segundos marcará seu tempo na direita.".localizedLanguage(),
            dialogueColor: "FFC097"
        )
        
        let tutorialViewElevenData = TutorialModel(
            charactersName: "SP",
            characterImage: "Saci",
            imageCenter: "selectCardOp",
            dialogue: "Durante a seleção de cartas, você poderá visualizar suas Cargas de Energia, lembre-se de mantê-la sempre carregada antes de usar uma Carta de Ataque.".localizedLanguage(),
            dialogueColor: "FFC097"
        )
        
        let tutorialViewElevenDataTwo = TutorialModel(
            charactersName: "SP",
            characterImage: "Saci",
            imageCenter: "saciManaTutorial",
            dialogue: "Elas também aparecerão ao lado do meu retrato, portanto lembre-se de checá-las...".localizedLanguage(),
            dialogueColor: "FFC097"
        )
        
        
        let tutorialViewTwelveData = TutorialModel(
            charactersName: "SP",
            characterImage: "Saci",
            imageCenter: "cardTimer",
            dialogue: "Por fim, caso você não selecione uma carta, você perderá seu turno e uma Carta Nula será jogada automaticamente.".localizedLanguage(),
            dialogueColor: "FFC097"
        )

        let tutorialViewThirteenData = TutorialModel(
            charactersName: "SP",
            characterImage: "Saci",
            imageCenter: "cardTimer",
            dialogue: "Quando ambos jogadores selecionarem suas cartas, um duelo é executado. Ganha a rodada aquele que conseguir um Sucesso no Ataque!".localizedLanguage(),
            dialogueColor: "FFC097"
        )

        let tutorialViewFourteenData = TutorialModel(
            charactersName: "SP",
            characterImage: "Saci",
            imageCenter: "attackSaci",
            dialogue: "Como que você consegue isso? Bom, basta você usar uma Carta de Ataque com Carga de Energia e seu oponente não se proteger.".localizedLanguage(),
            dialogueColor: "FFC097"
        )
        
      
        let tutorialViewFifteenData = TutorialModel(
            charactersName: "??",
            characterImage: "iaraSilhouette",
            imageCenter: "",
            dialogue: "Olha só o que temos aqui, preparado pra perder?".localizedLanguage(),
            dialogueColor: "FFF2D9"
        )
        
        
        let tutorialViewSixteenData = TutorialModel(
            charactersName: "SP",
            characterImage: "Saci",
            imageCenter: "",
            dialogue: "Parece que nossa primeira oponente chegou, vamos!".localizedLanguage(),
            dialogueColor: "FFC097"
        )
        
        
        tutorialData = [tutorialViewOneData, tutorialViewTwoData, tutorialViewThreeData, tutorialViewFourData, tutorialViewFiveData,tutorialViewSixData, tutorialViewSevenData, tutorialViewEightData, tutorialViewNineData, tutorialViewTenData, tutorialViewElevenData, tutorialViewElevenDataTwo, tutorialViewTwelveData, tutorialViewThirteenData, tutorialViewFourteenData, tutorialViewFifteenData, tutorialViewSixteenData]
    }
}






