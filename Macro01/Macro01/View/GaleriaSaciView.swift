//
//  GaleriaSaciView.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 29/07/23.
//

import Foundation
import SwiftUI

struct GaleriaSaciView: View {

    @State private var count = 0
    @State var Images: [String] = ["saci01",
                                           "saci02",
                                           "saci03"]
    
    var body: some View {
        ViewComponent(count: $count, Images: Images)
    }
}
