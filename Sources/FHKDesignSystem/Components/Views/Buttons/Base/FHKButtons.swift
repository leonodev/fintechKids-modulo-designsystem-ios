//
//  FHKButtons.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 22/11/25.
//

import SwiftUI

public struct FHKButton: View {
    let title: String
    let type: ButtonType
    let state: Binding<FHKButtonComponent.State>
    let style: Binding<FHKButtonComponent.Style>
    let action: () -> Void
    
    @State private var isPressed = false
    
    public enum ButtonType {
        case primary
        case secondary
        case ternary
    }
    
    // Inicializador público
    public init(title: String,
                type: ButtonType,
                state: Binding<FHKButtonComponent.State>,
                style: Binding<FHKButtonComponent.Style>,
                action: @escaping () -> Void) {
        self.title = title
        self.type = type
        self.state = state
        self.style = style
        self.action = action
    }
    
    public var body: some View {
        
        switch type {
        case .primary:
            FHKButtonPrimary(mainTitle: "Login",
                             state: state,
                             style: style,
                             action: {
                
            })
        case .secondary:
            EmptyView()
        case .ternary:
            EmptyView()
        }
    }
}


#Preview {
    VStack {
        FHKButton(title: "LOGIN",
                  type: .primary,
                  state: .constant(.enabled),
                  style: .constant(.filled),
                  action: {
            
        })
    }
}
