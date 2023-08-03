//
//  SplashScreen.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 03/08/23.
//

import SwiftUI

import SwiftUI

struct SplashScreen: View {
    @State private var showHomeView = false
    @State var scale = 0.6
    @State var opacity = 0.6
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var body: some View {
        VStack {
            if showHomeView {
                MainView()
            } else {
                VStack(){
                    Image("splash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)

                }
                .scaleEffect(scale)
                .opacity(opacity)
                .onAppear{
                    withAnimation(
                        .easeIn(duration: 2)){
                            self.scale = 1.0
                            self.opacity = 1.0
                        }
                    withAnimation(Animation.linear.delay(2)) {
                        showHomeView = true
                    }
                }
            }
        }
        .background{
            Rectangle()
                .ignoresSafeArea()
                .frame(width: screenWidth, height: screenHeight, alignment: .center)
                .foregroundColor(Color("corFundoSplash"))
        }
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }

    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
}
