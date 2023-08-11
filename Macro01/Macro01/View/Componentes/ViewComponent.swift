//
//  ViewComponent.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 29/07/23.
//

import SwiftUI

struct ViewComponent: View {
    @Environment(\.dismiss) var dismiss
    @Binding var count: Int
    var Images: [String]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                Image("bg-tutorial")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)

                Image(Images[count])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 672, height: 336)
                    .padding(EdgeInsets(top: 38, leading: 86, bottom: 16, trailing: 86))

                HStack {
                    if count > 1 {
                        Button(action: {
                            if count >= 1 {
                                count -= 1
                            } else {
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
                    }
                    Spacer()
                    if count < Images.count - 1 {
                        Button(action: {
                            if count < Images.count - 1 {
                                count += 1
                                print(count)
                            } else {
                                dismiss()
                                print(count)
                            }
                        }) {
                            Image("btn-next")
                                .resizable()
                                .frame(width: 46, height: 44)
                                .aspectRatio(contentMode: .fit)
                                .padding(.trailing, 50)
                                .padding(.top, 263)
                        }
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
        .navigationBarBackButtonHidden(true)
    }
}
