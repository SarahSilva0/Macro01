//
//  TutorialView.swift
//  Macro01
//
//  Created by Julia Mendes on 14/06/23.
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
        GeometryReader { geometry in
            ZStack{
                Color.black
                    .ignoresSafeArea()
                Image("bg-tutorial")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
                
                Image(tutorialImages[count])
                    .resizable()
                    .frame(width: 672, height: 336)
                    .padding(EdgeInsets(top: 38, leading: 86, bottom: 16, trailing: 86))
                
                HStack {
                    
                    Button(action: {
                        if count >= 1 {
                            count -= 1
                            print(count)
                        }
                        else {
                            dismiss()
                            print(count)
                        }
                    }) {
                        Image("btn-back")
                            .resizable()
                            .frame(width: 46, height: 44)
                            .aspectRatio(contentMode: .fit)
                            .padding(.leading, 50)
                            .padding(.top, 263)
                    }
                    Spacer()
                    Button(action: {
                        if  count < 3  {
                            count += 1
                            print(count)
                        }
                        else {
                            dismiss()
                            print(count)
                        }
                    }) {
                        Image("btn-next")
                            .resizable()
                            .frame(width: 46, height: 44)
                            .aspectRatio(contentMode: .fit)
                            //border(.blue)
                            .padding(.trailing, 50)
                            .padding(.top, 263)
                    }
                }
                
            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
