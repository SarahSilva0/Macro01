import SwiftUI

@main
struct Macro01App: App {
    
    init() {
        for family in UIFont.familyNames {
            print("family")
            for font in UIFont.fontNames(forFamilyName: family) {
                print("     \(font)")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
