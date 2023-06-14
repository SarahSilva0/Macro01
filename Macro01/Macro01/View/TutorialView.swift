//
//  TutorialView.swift
//  Macro01
//
//  Created by Julia Mendes on 12/06/23.
//

import SwiftUI

struct TutorialView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var count = 0
    @State var tutorialImages: [String] = ["duelo01",
                                           "duelo02",
                                           "duelo03",
                                           "duelo04"]
    
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                Image("bg-tutorial")
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .aspectRatio(contentMode: .fill)
                Image(tutorialImages[count])
                    .resizable()
                    .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.9)
                    .padding([.top, .leading], 20)
                    .onTapGesture {
                        print("blabla")
                        count += 1
                        if count == 3 {
                            dismiss()
                        }
                    }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
