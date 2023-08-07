//
//  TutorialStartViewGeneric.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 07/08/23.
//

import SwiftUI

struct TutorialStartGenericView: View {
    
    var tutorialCharacter = TutorialStartTableModel()

    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {

                    HStack {
                        Button(action: {
                            print("oi")
                        }) {
                            Text("Pular Tutorial")
                                .font(.system(size: 12))
                                .foregroundColor(Color.white)
                        }
                        
                    }
                    .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.7)
                                        .background(.blue)
                    
                    HStack {
                        
                        Character(character: tutorialCharacter.tutorialCharacterModel.characterImage[0])
                            .frame(width: geometry.size.width * 0.25, height: geometry.size.height * 0.3)
                        
                        TutorialDialogBox(characterName: tutorialCharacter.tutorialCharacterModel.charactersNames[0],
                            dialogue: tutorialCharacter.tutorialCharacterModel.dialoguePlayOne[6],
                            colorBox: "FFC097")
                        
                        VStack {
                            ButtonComponentImage(action: {
                                          print("oi")
                                      }, image: "buttonLeft")
                            
                            ButtonComponentImage(action: {
                                          print("oi")
                                      }, image: "buttonRight")
                        }
                        .frame(width: geometry.size.width * 0.252, height: geometry.size.height * 0.2)

                    }
                    .ignoresSafeArea()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.28)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

