//
//  TransparentConfigurationButton.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 14/06/23.
//

import SwiftUI

struct TransparentConfigurationButton: View {
    let text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 50)
                .foregroundColor(Color.gray.opacity(0.5))
            
            HStack(spacing: 10) {
                Circle()
                    .foregroundColor(.black)
                    .frame(width: 35, height: 35)
                
                Text(text)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
        }
    }
}

struct TransparentConfigurationButton_Previews: PreviewProvider {
    static var previews: some View {
        TransparentConfigurationButton(text: "Tutorial")
    }
}
