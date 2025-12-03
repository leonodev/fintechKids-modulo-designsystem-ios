//
//  FHKButtonPrimary.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 24/11/25.
//

import SwiftUI

public struct FHKButtonPrimary: FHKButtonProtocol {
    @State public var title: String
    public var appearance: FHKButtonAppearance
    public var action: () -> Void
    
    public init(title: String,
                style: FHKButtonComponent.Style = .filled,
                state: FHKButtonComponent.State = .enabled,
                variant: FHKButtonComponent.Variant = .simple,
                position: FHKButtonComponent.Position = .none,
                mode: FHKButtonComponent.Mode = .glass(.clear),
                action: @escaping () -> Void = {})
    {
        _title = State(initialValue: title)
        appearance = FHKButtonAppearance(type: .primary,
                                         style: style,
                                         state: state,
                                         variant: variant,
                                         position: position,
                                         mode: mode)
        self.action = action
        
    }

    
    public var body: some View {
        Button(action: action) {
            if case .glass(let glassVariant) = appearance.mode {
                
                Text(title)
                    .font(appearance.font)
                    .foregroundColor(appearance.foregroundColor)
                    .frame(maxWidth: appearance.maxWidth,
                                       minHeight: appearance.maxHeight, // Forzamos el mínimo
                                       maxHeight: appearance.maxHeight) // Y el máximo
                    .glassEffect(appearance.modeGlass(variant: glassVariant))
            }
            else {
                Text(title)
                    .font(appearance.font)
                    .foregroundColor(appearance.foregroundColor)
                    .background(appearance.solidBackgroundColor())
                    .cornerRadius(30)
                    .shadow(radius: 4, y: 2)
                    .frame(maxWidth: appearance.maxWidth, maxHeight: appearance.maxHeight)
            }
        }
        .contentShape(Rectangle())
        .disabled(appearance.state != .enabled)
    }
}


#Preview {
    VStack {
        FHKButtonPrimary(title: "Button Primary",
                         state: .enabled,
                         mode: .glass(.clear),
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
