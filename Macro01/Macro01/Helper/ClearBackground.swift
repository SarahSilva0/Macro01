//
//  ClearBackground.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 05/06/23.
//

import SwiftUI

//MARK: ESSA STRUCT E PARA O FUNDO DA VIEW FICAR TRANSPARENTE

struct ClearBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return InnerView()
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }

    private class InnerView: UIView {
        override func didMoveToWindow() {
            super.didMoveToWindow()

            superview?.superview?.backgroundColor = .clear
        }

    }
}



