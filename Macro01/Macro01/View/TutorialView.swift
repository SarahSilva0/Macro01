//
//  TutorialView.swift
//  Macro01
//
//  Created by Julia Mendes on 14/06/23.
//

import SwiftUI

struct TutorialView: View {

    @State private var count = 0
    @State var tutorialImages: [String] = ["duelo01",
                                           "duelo02",
                                           "duelo03",
                                           "duelo04"]
    
    var body: some View {
        ViewComponent(count: $count, Images: tutorialImages)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
