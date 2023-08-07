import SwiftUI

@main
struct Macro01App: App {
        
    var body: some Scene {
        WindowGroup {
//            SplashScreen()
            TutorialStartView(countdownSheet: 5)
        }
    }
}
