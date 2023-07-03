import SwiftUI

struct SettingsView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    ConfigurationCardView()
                    VStack {
                        Spacer()
                        TransparentConfigurationButton(text: "Tutorial")
                            .padding(.bottom, 20)
                        TransparentConfigurationButton(text: "Tutorial")
                            .padding(.bottom, 20)
                        TransparentConfigurationButton(text: "Tutorial")
                            .padding(.bottom, 20)
                    }
                  
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
