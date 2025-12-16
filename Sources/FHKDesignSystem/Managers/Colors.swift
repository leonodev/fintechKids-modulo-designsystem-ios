//
//  Colors.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 22/11/25.
//

import SwiftUI

private class BundleFinder {}

extension Bundle {
    static var designSystem: Bundle {
        // Si estamos en un paquete, Bundle.module funciona
        #if SWIFT_PACKAGE
        return .module
        #else
        // Para cuando se integra como framework
        return Bundle(for: BundleFinder.self)
        #endif
    }
}

public extension Color {
    // Usamos Bundle.module directamente, que es el bundle del módulo de Swift Package.
    static let fuchsiaPink = Color("fuchsiaPink", bundle: .designSystem)
    static let gray = Color("gray", bundle: .designSystem)
    static let lunarSand = Color("lunarSand", bundle: .designSystem)
    static let pastelPink = Color("pastelPink", bundle: .designSystem)
    static let silver = Color("silver", bundle: .designSystem)
    static let stone = Color("stone", bundle: .designSystem)
    static let ultraPurple = Color("ultraPurple", bundle: .designSystem)
    static let wine = Color("wine", bundle: .designSystem)
    static let basicWhite = Color("basicWhite", bundle: .designSystem)
    static let basicBlack = Color("basicBlack", bundle: .designSystem)
    static let shadowColor = Color("shadow", bundle: .designSystem)
    static let textColorEnabled = Color("textColorEnabled", bundle: .designSystem)
    static let backgroundPrimary = Color("backgroundPrimary", bundle: .designSystem)
}
