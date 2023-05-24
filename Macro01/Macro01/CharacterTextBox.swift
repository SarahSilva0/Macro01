//
//  CharacterTextBox.swift
//  Macro01
//
//  Created by Julia Mendes on 24/05/23.
//

import SwiftUI

struct CharacterTextBox: View {
    
    private var character: String
    
    init(character: String) {
        self.character = character
    }

    var body: some View {
        ZStack{
            Circle()
                .frame(width: 250)
                .foregroundColor(.gray)
            Image(character)
                .resizable()
                .frame(width: 250, height: 400)
        }
    }
}

struct CharacterTextBox_Previews: PreviewProvider {
    static var previews: some View {
        CharacterTextBox(character: "character")
    }
}
