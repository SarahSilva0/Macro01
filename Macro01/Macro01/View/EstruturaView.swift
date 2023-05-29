//
//  SwiftUIView.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 29/05/23.
//

import SwiftUI

struct EstrutruraView: View {
    var body: some View {
        GeometryReader { geometry in
            
        VStack (spacing: 0){
                        
                HStack {
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.2)
                .background(Color.black)
               
                HStack(alignment: .bottom, spacing: 0) {
                    
                    VStack {
                        
                    } .frame(width: geometry.size.width * 0.3, height: geometry.size.height)
                        .background(Color.green)
                    
                    
                    HStack () {
                        
                    } .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.2 )
                        .background(Color.white)
                    
                    VStack {
                        
                    }.frame(width: geometry.size.width * 0.3, height: geometry.size.height)
                        .background(Color.blue)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.red)
        }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        EstrutruraView()
    }
}
