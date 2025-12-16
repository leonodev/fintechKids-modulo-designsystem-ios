//
//  Colors.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 22/11/25.
//

import SwiftUI

public extension Color {
    // Usamos Bundle.module directamente, que es el bundle del módulo de Swift Package.
    static let fuchsiaPink = Color("fuchsiaPink", bundle: .module)
    static let gray = Color("gray", bundle: .module)
    static let lunarSand = Color("lunarSand", bundle: .module)
    static let pastelPink = Color("pastelPink", bundle: .module)
    static let silver = Color("silver", bundle: .module)
    static let stone = Color("stone", bundle: .module)
    static let ultraPurple = Color("ultraPurple", bundle: .module)
    static let wine = Color("wine", bundle: .module)
    static let basicWhite = Color("basicWhite", bundle: .module)
    static let basicBlack = Color("basicBlack", bundle: .module)
    static let shadowColor = Color("shadow", bundle: .module)
    static let textColorEnabled = Color("textColorEnabled", bundle: .module)
    static let backgroundPrimary = Color("backgroundPrimary", bundle: .module)
}

// Para depuración
public extension Color {
    static func checkColorExistence() {
        let colorNames = [
            "fuchsiaPink", "gray", "lunarSand", "pastelPink",
            "silver", "stone", "ultraPurple", "wine",
            "basicWhite", "basicBlack", "shadow",
            "textColorEnabled", "backgroundPrimary"
        ]
        
        for name in colorNames {
            // Intentar crear el color y ver si es válido
            let color = Color(name, bundle: .module)
            // No hay una forma directa de verificar, pero podemos imprimir el nombre
            print("Color \(name): \(color)")
        }
    }
}
