//
//  CharacterTextBox.swift
//  Macro01
//
//  Created by Julia Mendes on 24/05/23.
//

import SwiftUI

struct Character: View {
    
    private var character: String
    
    init(character: String) {
        self.character = character
    }

    var body: some View {
            Image(character)
                .resizable()
                .scaledToFill()
    }
}

struct CharacterTextBox_Previews: PreviewProvider {
    static var previews: some View {
        Character(character: "character")
    }
}
