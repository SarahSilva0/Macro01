//import SwiftUI
//
//@main
//struct Macro01App: App {
//    var body: some Scene {
//        WindowGroup {
//            SplashScreen()
//                .preferredColorScheme(.light)
//        }
//    }
//}



import SwiftUI

@main
struct Macro01App: App {
    @StateObject private var combatViewModel = CombatViewModel() // Criando uma instância de CombatViewModel
    
    var body: some Scene {
        WindowGroup {
            // Passando a instância de CombatViewModel para EndOfGameResultView
            EndOfGameResultView(combatViewModel: combatViewModel, raiaWin: $combatViewModel.RaiaDiff.winLevel)
        }
    }
}
