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
            characterImage: "",
            imageCenter: "",
            dialogue: "Oi, tudo Bem?"
        )

        let tutorialViewTwoData = TutorialModel(
            charactersName: "SP",
            characterImage: "playerSaci",
            imageCenter: "",
            dialogue: "Vou te explicar um pouco sobre o torneiro."
        )
        
        let tutorialViewThreeData = TutorialModel(
            charactersName: "SP",
            characterImage: "playerSaci",
            imageCenter: "score",
            dialogue: "O torneio consiste em um jogo de cartas, em que, aquele que conseguir 3 pontos primeiro vence!"
        )
        
        let tutorialViewFourData = TutorialModel(
            charactersName: "SP",
            characterImage: "playerSaci",
            imageCenter: "defenseSacie",
            dialogue: "Essa é a Carta de Recarga, sua função é gerar Cargas de Energia utilizadas pelas Cartas de Ataque, entretanto, ao usá-las você fica vulnerável a ataques inimigos, então, é melhor ter cuidado!"
        )
        
        let tutorialViewFiveData = TutorialModel(
            charactersName: "SP",
            characterImage: "playerSaci",
            imageCenter: "attackSaci",
            dialogue: "Ao usar uma Carta de Ataque, você poderá tanto atacar, quanto defender golpes, mas atenção, elas consomem uma Carga de Energia!"
        )
        
        let tutorialViewSixData = TutorialModel(
            charactersName: "SP",
            characterImage: "playerSaci",
            imageCenter: "attackSaci",
            dialogue: "Ao usar uma Carta de Ataque, você poderá tanto atacar, quanto defender golpes, mas atenção, elas consomem uma Carga de Energia!"
        )
        
        let tutorialViewSevenData = TutorialModel(
            charactersName: "SP",
            characterImage: "playerSaci",
            imageCenter: "attackSaci",
            dialogue: "O que acontece quando você utiliza essa carta sem Cargas de Energia? Bem, seu efeito é anulado, ou seja, você perde seu turno, mas fica tranquilo isso não significa derrota."
        )
        
        let tutorialViewEightData = TutorialModel(
            charactersName: "SP",
            characterImage: "playerSaci",
            imageCenter: "defenseSaci",
            dialogue: "O que acontece quando você utiliza essa carta sem Cargas de Energia? Bem, seu efeito é anulado, ou seja, você perde seu turno, mas fica tranquilo isso não significa derrota."
        )
        
        let tutorialViewNineData = TutorialModel(
            charactersName: "SP",
            characterImage: "playerSaci",
            imageCenter: "timer",
            dialogue: "A cada turno você terá 3 Segundos pra elaborar sua próxima jogada."
        )
        
        let tutorialViewTenData = TutorialModel(
            charactersName: "SP",
            characterImage: "playerSaci",
            imageCenter: "selectCard",
            dialogue: "Logo depois, você deverá selecionar uma das cartas, mas atenção, um temporizador de 5 Segundos marcará seu tempo na direita."
        )
        
        let tutorialViewElevenData = TutorialModel(
            charactersName: "SP",
            characterImage: "playerSaci",
            imageCenter: "selectCardOp",
            dialogue: "Durante a seleção de cartas, você poderá visualizar suas Cargas de Energia, lembre-se de mantê-la sempre carregada antes de usar uma Carta de Ataque."
        )
        
        let tutorialViewTwelveData = TutorialModel(
            charactersName: "SP",
            characterImage: "playerSaci",
            imageCenter: "cardTimer",
            dialogue: "Por fim, caso você não selecione nenhuma carta, você perderá seu turno e uma Carta Nula será jogada automaticamente."
        )

        let tutorialViewThirteenData = TutorialModel(
            charactersName: "SP",
            characterImage: "playerSaci",
            imageCenter: "cardTimer",
            dialogue: "Quando ambos jogadores selecionarem suas cartas, um duelo é executado, ganha a rodada aquele que conseguir um Sucesso no Ataque!"
        )

        let tutorialViewFourteenData = TutorialModel(
            charactersName: "SP",
            characterImage: "playerSaci",
            imageCenter: "",
            dialogue: "Quando ambos jogadores selecionarem suas cartas, um duelo é executado, ganha a rodada aquele que conseguir um Sucesso no Ataque!"
        )
        
        let tutorialViewFifteenData = TutorialModel(
            charactersName: "SP",
            characterImage: "playerSaci",
            imageCenter: "attackSaci",
            dialogue: "Como que você consegue isso? Bom, basta você usar uma Carta de Ataque com Carga de Energia e seu oponente não se proteger."
        )
        
        let tutorialViewSixteenData = TutorialModel(
            charactersName: "SP",
            characterImage: "",
            imageCenter: "",
            dialogue: "Olha só o que temos aqui, preparado pra perder?"
        )
        
        
        let tutorialViewSeventeenData = TutorialModel(
            charactersName: "SP",
            characterImage: "",
            imageCenter: "",
            dialogue: "Parece que nossa primeira oponente chegou, vamos!"
        )
        
        
        tutorialData = [tutorialViewOneData, tutorialViewTwoData, tutorialViewThreeData, tutorialViewFourData, tutorialViewFiveData,tutorialViewSixData, tutorialViewSevenData, tutorialViewEightData, tutorialViewNineData, tutorialViewTenData, tutorialViewElevenData, tutorialViewTwelveData, tutorialViewThirteenData, tutorialViewFourteenData, tutorialViewFifteenData, tutorialViewSixteenData, tutorialViewSeventeenData]
    }
}






