
import SwiftUI

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            GeometryReader { geometry in
                MatchView(gameModelBinding: .constant(GameTableModel()))
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
