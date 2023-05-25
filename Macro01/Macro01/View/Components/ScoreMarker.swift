//
//  ScoreMarker.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 25/05/23.
//

import SwiftUI

struct ScoreMarker: View {
    var color: Color 
    
    var body: some View {
        Circle()
            .fill(color)
    }
}

struct ScoreMarker_Previews: PreviewProvider {
    static var previews: some View {
        ScoreMarker(color: .red)
    }
}

