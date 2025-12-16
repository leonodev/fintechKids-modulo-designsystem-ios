//
//  Colors.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 22/11/25.
//

import SwiftUI

// MARK: - Solución definitiva para SPM con asset catalog
public extension Color {
    // Bundle dinámico que encuentra el recurso correctamente
    private static var designSystemBundle: Bundle {
        // Opción 1: Bundle.module (debería funcionar)
        let moduleBundle = Bundle.module
        
        // Verificamos si el asset catalog existe
        #if DEBUG
        print("📦 Bundle.module path: \(moduleBundle.bundlePath)")
        
        // Listar contenido del bundle para debug
        if let contents = try? FileManager.default.contentsOfDirectory(atPath: moduleBundle.bundlePath) {
            print("📁 Contenido del bundle:")
            contents.forEach { print("  • \($0)") }
        }
        #endif
        
        return moduleBundle
    }
    
    // MARK: - Colores principales
    static let fuchsiaPink = Color("FuchsiaPink", bundle: designSystemBundle)
    static let gray = Color("Gray", bundle: designSystemBundle)
    static let lunarSand = Color("LunarSand", bundle: designSystemBundle)
    static let pastelPink = Color("PastelPink", bundle: designSystemBundle)
    static let silver = Color("Silver", bundle: designSystemBundle)
    static let stone = Color("Stone", bundle: designSystemBundle)
    static let ultraPurple = Color("UltraPurple", bundle: designSystemBundle)
    static let wine = Color("Wine", bundle: designSystemBundle)
    static let basicWhite = Color("basicWhite", bundle: designSystemBundle)
    static let basicBlack = Color("basicBlack", bundle: designSystemBundle)
    static let shadowColor = Color("shadow", bundle: designSystemBundle)
    static let textColorEnabled = Color("textColorEnabled", bundle: designSystemBundle)
    static let backgroundPrimary = Color("backgroundPrimary", bundle: designSystemBundle)
}

// MARK: - Función de diagnóstico
public extension Color {
    static func diagnoseBundleIssue() {
        print("\n🔍 DIAGNÓSTICO DE BUNDLE Y ASSETS")
        print("=====================================")
        
        let bundle = Bundle.module
        
        // 1. Información del bundle
        print("\n📦 Bundle Information:")
        print("   - Path: \(bundle.bundlePath)")
        print("   - Identifier: \(bundle.bundleIdentifier ?? "nil")")
        
        // 2. Buscar asset catalog
        print("\n🔍 Buscando Asset Catalogs:")
        
        // Buscar todos los archivos .xcassets
        if let enumerator = FileManager.default.enumerator(atPath: bundle.bundlePath) {
            for case let file as String in enumerator {
                if file.hasSuffix(".xcassets") || file.hasSuffix(".car") {
                    print("   • \(file)")
                }
            }
        }
        
        // 3. Verificar colores específicos
        print("\n🎨 Verificando colores en el asset catalog:")
        let colorNames = [
            "FuchsiaPink", "Gray", "LunarSand", "PastelPink",
            "Silver", "Stone", "UltraPurple", "Wine",
            "basicWhite", "basicBlack", "shadow",
            "textColorEnabled", "backgroundPrimary"
        ]
        
        for colorName in colorNames {
            // Intentar crear el color
            let color = Color(colorName, bundle: bundle)
            print("   - \(colorName): \(color)")
            
            // Verificar en UIKit (si está disponible)
            #if canImport(UIKit)
            let uiColor = UIColor(named: colorName, in: bundle, compatibleWith: nil)
            print("     UIKit: \(uiColor != nil ? "✅ Encontrado" : "❌ No encontrado")")
            #endif
        }
    }
}
