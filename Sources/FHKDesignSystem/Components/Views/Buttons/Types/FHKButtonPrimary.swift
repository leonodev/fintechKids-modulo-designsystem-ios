//
//  FHKButtonPrimary.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 24/11/25.
//

import SwiftUI

public struct FHKButtonPrimary: View {
    let title: String
    let state: Binding<FHKButtonComponent.State>
    let style: Binding<FHKButtonComponent.Style>
    @State private var isPressed = false
    public let action: () -> Void
    
    public init(mainTitle: String,
        state: Binding<FHKButtonComponent.State>,
        style: Binding<FHKButtonComponent.Style>,
        action: @escaping () -> Void
    ) {
        self.title = mainTitle
        self.state = state
        self.style = style
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: FHKSize.size48)
                .font(.PangramSans.bold())
                .foregroundColor(.white)
                .glassEffect(.clear.interactive())
                //.glassEffect(.clear, in: .rect(cornerRadius: 8))
        
        }
    }
}

#Preview {
    VStack {
        FHKButtonPrimary(mainTitle: "Button Primary",
                         state: .constant(.enabled),
                         style: .constant(.filled),
                         action: {
            
        })
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        Image.background
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
    .ignoresSafeArea()
}
