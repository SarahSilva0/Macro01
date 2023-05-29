
import SwiftUI

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            GeometryReader { geometry in
                MatchView(gameModel: GameTableModel())
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
