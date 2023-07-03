//
//  TransparentConfigurationButton.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 14/06/23.
//

import SwiftUI

struct TransparentConfigurationButton: View {
    let text: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
        
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 280, height: 35)
                    .foregroundColor(Color.gray.opacity(0.2))
                
                HStack {
                    Image(icon)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 25,height: 25)
                    
                    Text(text)
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct TransparentConfigurationButton_Previews: PreviewProvider {
    static var previews: some View {
        TransparentConfigurationButton(text: "Suporte", icon: "email") {
            print("email")
        }
    }
}
