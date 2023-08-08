//  TutorialStartTableModel.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 07/08/23.
//

class TutorialStartTableModel {
    let tutorialSteps: [TutorialModel]

    init() {
        let tutorialViewOneData = TutorialModel(
            charactersName: "SP",
            characterImage: "playerSaci",
            imageCenter: "",
            dialogue: "Oi, tudo Bem?"
        )

        let tutorialViewTwoData = TutorialModel(
            charactersName: "SP",
            characterImage: "playerSaci",
            imageCenter: "",
            dialogue: "Seja bem-vindo ao torneio Folkard, meu nome é Sallo Pereira, mas meus amigos me chamam de SP, então pode me chamar assim."
        )

        tutorialSteps = [tutorialViewOneData, tutorialViewTwoData]
    }
}






