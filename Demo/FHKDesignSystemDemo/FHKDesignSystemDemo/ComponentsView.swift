//
//  ComponentsView.swift
//  FHKDesignSystemDemo
//
//  Created by fleon  on 19/5/26.
//

import FHKDesignSystem
import SwiftUI

struct ComponentsView: View {
    @State var coinsRequired = ""
    var dummyPlaceholder = "Placeholder Here!"
    
    var body: some View {
        VStack {
            FHKTextField(
                text: $coinsRequired,
                placeholder: dummyPlaceholder,
                keyboardType: .numberPad
            )
        }
        .padding()
    }
}

//#Preview {
//    VStack {
//        LottiesView()
//    }
//    .applyBackgroundDemoModifier()
//}
