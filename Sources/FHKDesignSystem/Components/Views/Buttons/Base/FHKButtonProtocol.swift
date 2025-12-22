//
//  FHKButtons.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 22/11/25.
//

import SwiftUI

@MainActor
public protocol FHKButtonProtocol: View {
    var title: String { get set }
    var appearance: FHKButtonAppearance { get set }
    var action: () -> Void { get }
}

@MainActor
public struct FHKButtonAppearance {
    let type: FHKButtonComponent.Types
    let style: FHKButtonComponent.Style
    let state: FHKButtonComponent.State
    let variant: FHKButtonComponent.Variant
    let position: FHKButtonComponent.Position
    let mode: FHKButtonComponent.Mode
    
    /// return width calculate
    var maxWidth: CGFloat {
        switch type {
        case .primary:
            return .infinity
            
        case .secondary:
            return FHKSize.size256
            
        case .terciary:
            return FHKSize.size128
        }
    }
    
    /// return height calculate
    var maxHeight: CGFloat {
        switch type {
        case .primary:
            return FHKSize.size44
            
        case .secondary:
            return FHKSize.size36
            
        case .terciary:
            return FHKSize.size28
        }
    }
    
    /// return font calculate
    var font: Font {
        switch type {
        case .primary:
            return .PangramSans.bold(FHKSize.size20)
        case .secondary:
            return .PangramSans.bold(FHKSize.size16)
        case .terciary:
            return .PangramSans.bold(FHKSize.size12)
        }
        
    }
    
    
    var foregroundColor: Color {
        switch state {
     
        case .disabled:
            return .pastelPink
            
        case .skeleton:
            return .clear
            
        default:
            return .basicWhite
        }
    }
    
    /// return mode glass variant calculate
    @available(iOS 26.0, *)
    func modeGlass(variant: FHKButtonComponent.Mode.Style) -> Glass {
        switch variant {
        case .clear:
                .clear
            
        case .clearWithInteractive:
                .clear.interactive()
            
        case .regular:
                .regular
            
        case .regularWithInteractive:
                .regular.interactive()
        default:
                .clear
        }
    }
    
    func solidBackgroundColor() -> LinearGradient {
        switch (state, type) {
        case (.enabled, .primary):
            return LinearGradient(
                gradient: Gradient(colors: [.ultraPurple, .fuchsiaPink]),
                startPoint: .top,
                endPoint: .bottom
            )
            
        case (.enabled, .secondary):
            return LinearGradient(
                gradient: Gradient(colors: [.ultraPurple, .wine]),
                startPoint: .top,
                endPoint: .bottom
            )
            
        case (.enabled, .terciary):
            return LinearGradient(
                gradient: Gradient(colors: [.wine, .pastelPink]),
                startPoint: .top,
                endPoint: .bottom
            )
            
        case (.disabled, _), (.skeleton, _):
            return LinearGradient(
                gradient: Gradient(colors: [.stone, .silver]),
                startPoint: .top,
                endPoint: .bottom
            )
        }
    }
}
