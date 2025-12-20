//
//  GradientText.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 20/12/25.
//

import SwiftUI

public struct GradientText: View {
    let title: String
    let subtitle: String
    
    var font: Font = .system(size: FHKSize.size48, weight: .black, design: .rounded)
    var colors: [Color] = [
        Color(red: 0.9, green: 0.1, blue: 0.9), // Magenta
        Color(red: 0.5, green: 0.3, blue: 0.9), // Violeta
        Color(red: 0.3, green: 0.7, blue: 1.0), // Azul
        Color(red: 0.4, green: 0.9, blue: 0.9)  // Cian
    ]
    
    // Configuration shadow
    var shadowColor: Color = .black.opacity(0.2)
    var shadowRadius: CGFloat = 4
    var shadowX: CGFloat = 2
    var shadowY: CGFloat = 2

    public var body: some View {
        VStack(spacing: -10) {
            Text(title)
            Text(subtitle)
        }
        .font(font)
        .italic()
        .multilineTextAlignment(.center)
        .foregroundStyle(
            LinearGradient(
                colors: colors,
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .shadow(color: shadowColor, radius: shadowRadius, x: shadowX, y: shadowY)
    }
}

// MARK: - Ejemplos de uso
struct PreviewView: View {
    var body: some View {
        VStack(spacing: 50) {
            
            // 1. Uso con los colores por defecto
            GradientText(title: "FintechHome", subtitle: "Kids")
            
            // 2. Uso con colores custom y fuente distinta
            GradientText(
                title: "Ahorro",
                subtitle: "Total",
                font: .system(size: 40, weight: .bold, design: .monospaced),
                colors: [.orange, .red, .yellow],
                shadowColor: .red.opacity(0.3),
                shadowRadius: 10
            )
        }
    }
}
