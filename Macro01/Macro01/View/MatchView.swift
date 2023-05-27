//
//  MatchView.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 27/05/23.
//

import SwiftUI

struct MatchView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack {
                VStack(alignment: .trailing) {
                    Spacer()
                    CharacterTextBox(character: "character")
                        .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.22)
                }
                
                VStack(alignment: .leading) {
                    Spacer()
                    CharacterTextBox(character: "character")
                        .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.22)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}







struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView()
    }
}
