
import SwiftUI

struct MainView: View {
    var body: some View {
        
        NavigationView{
            VStack {
                FirstView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
