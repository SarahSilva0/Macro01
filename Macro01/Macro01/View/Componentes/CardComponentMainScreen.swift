//
//  CardComponentMainScreen.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 20/06/23.
//

import SwiftUI

struct CardComponentMainScreen: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 120)
       
    }
    
}



