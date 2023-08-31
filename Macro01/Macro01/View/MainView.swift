
import SwiftUI

struct PresentationKey: EnvironmentKey {
    static let defaultValue: [Binding<Bool>] = []
}

extension EnvironmentValues {
    var presentations: [Binding<Bool>] {
        get { return self[PresentationKey] }
        set { self[PresentationKey] = newValue }
    }
}

struct MainView: View {
    var body: some View {
        
        @StateObject var dificultyViewModel = DificultyViewModel()
        
        NavigationStack{
            VStack {
                FirstView()
                    .environmentObject(dificultyViewModel)
    
            }
        }
    }
}


