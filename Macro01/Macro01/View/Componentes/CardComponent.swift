
import SwiftUI

struct CardComponent: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 110, height: 110)
       
    }
}
