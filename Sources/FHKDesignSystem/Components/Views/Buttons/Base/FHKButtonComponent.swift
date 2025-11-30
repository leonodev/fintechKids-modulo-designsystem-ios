//
//  FHKButtonComponent.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 24/11/25.
//

import SwiftUI

public enum FHKButtonComponent {
    
    public enum Style {
        case filled
        case outlined
    }
    
    public enum State {
        case enabled
        case disabled
        case skeleton
    }
    
    public enum Variant {
        case simple          // Solo texto
        case withIcon        // Texto + ícono
        case withSubtitle    // Título + subtítulo
        case detailed        // Título + subtítulo + metadata
    }
    
    public enum VariantPosition {
        case left
        case right
    }
}
