//  TutorialStartTableModel.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 07/08/23.
//

import Foundation


class TutorialStartTableModel: ObservableObject {
    
    let tutorialCharacterModel = TutorialStartModel(
        imageCenter: ["score", "rechargeSaci", "attackSaci", "defenseSaci"],
        characterImage: ["playerSaci", "playerIara"],
        charactersNames: ["SP"],
        dialoguePlayOne: [
            "O torneio consiste em um jogo de cartas, em que, aquele que conseguir 3 pontos primeiro vence!",
            "Essa é a Carta de Recarga, sua função é gerar Cargas de Energia utilizadas pelas Cartas de Ataque, entretanto, ao usá-las você fica vulnerável a ataques inimigos, então, é melhor ter cuidado!",
            "Ao usar uma Carta de Ataque, você poderá tanto atacar, quanto defender golpes, mas atenção, elas consomem uma Carga de Energia!"
        ],
        dialoguePlayTwo: ["Olha só o que temos aqui, preparado pra perder?"]
    )
}

