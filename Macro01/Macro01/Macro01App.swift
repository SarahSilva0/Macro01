import SwiftUI

@main
struct Macro01App: App {
   
    init() {
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
    }
    
    var body: some Scene {
        WindowGroup {
//            MainView()
            MatchView(gameModel: GameTableModel())
            
        }
    }
}
