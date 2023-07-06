//
//  PolicyAndPrivacyView.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 05/07/23.
//

import SwiftUI

struct PolicyAndPrivacyView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
            AboutAndPolitics(isPresented: $isPresented,
                             title: "Politica e Privacidade",
                             text: "Testando")
    }
}


