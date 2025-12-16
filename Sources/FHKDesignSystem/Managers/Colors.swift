//
//  Colors.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 22/11/25.
//

import SwiftUI

import SwiftUI

public extension Color {
    // Bundle seguro que funciona en todos los contextos
    internal static var safeBundle: Bundle {
        // 1. Primero intentar con Bundle.module (SPM)
        let moduleBundle = Bundle.module
        
        // 2. Verificar si el bundle puede cargar recursos
        // Buscar cualquier archivo conocido para verificar que el bundle funciona
        if let _ = moduleBundle.path(forResource: "Assets", ofType: "car") {
            return moduleBundle
        }
        
        // 3. Buscar en todos los bundles por uno que contenga nuestros recursos
        for bundle in Bundle.allBundles {
            if let bundleId = bundle.bundleIdentifier,
               bundleId.contains("FHKDesignSystem") {
                return bundle
            }
            
            // Verificar si tiene nuestro asset catalog
            if let _ = bundle.path(forResource: "Assets", ofType: "car") {
                return bundle
            }
        }
        
        // 4. Buscar en frameworks
        for bundle in Bundle.allFrameworks {
            if let bundleId = bundle.bundleIdentifier,
               bundleId.contains("FHKDesignSystem") {
                return bundle
            }
        }
        
        // 5. Fallback a main bundle (para previews/testing)
        print("⚠️ No se encontró bundle específico, usando Bundle.main")
        return Bundle.main
    }
    
    // Función para debuggear el bundle
    public static func printBundleInfo() {
        print("=== COLOR BUNDLE DEBUG ===")
        
        // Información del bundle seguro
        let bundle = safeBundle
        print("safeBundle: \(bundle)")
        print("Bundle ID: \(bundle.bundleIdentifier ?? "nil")")
        print("Bundle path: \(bundle.bundlePath)")
        
        // Verificar recursos específicos
        print("\nBuscando recursos específicos:")
        
        let resourceNames = [
            "fuchsiaPink",
            "Assets",  // Asset catalog compilado
            "Assets.car" // Archivo compilado del asset catalog
        ]
        
        for resource in resourceNames {
            let resourcePath = bundle.path(forResource: resource, ofType: nil)
            print("\(resource): \(resourcePath ?? "NOT FOUND")")
        }
        
        // Verificar estructura de directorios del bundle
        print("\n=== Contenido del Bundle ===")
        if let contents = try? FileManager.default.contentsOfDirectory(atPath: bundle.bundlePath) {
            for item in contents {
                print("- \(item)")
            }
        }
        
        // Bundle.module específico
        print("\n=== Bundle.module ===")
        let moduleBundle = Bundle.module
        print("Bundle.module: \(moduleBundle)")
        print("Bundle.module ID: \(moduleBundle.bundleIdentifier ?? "nil")")
        
        // Bundle.main para comparar
        print("\n=== Bundle.main ===")
        print("Bundle.main: \(Bundle.main)")
        
        // Todos los bundles disponibles
        print("\n=== Todos los Bundles (solo los relevantes) ===")
        for bundle in Bundle.allBundles {
            if let identifier = bundle.bundleIdentifier {
                if identifier.contains("FHKDesignSystem") ||
                   identifier.contains("Test") ||
                   identifier == Bundle.main.bundleIdentifier {
                    print("- \(identifier): \(bundle.bundlePath)")
                }
            }
        }
    }
    
    // Definición de colores usando safeBundle
    static let fuchsiaPink = Color("fuchsiaPink", bundle: safeBundle)
    static let gray = Color("gray", bundle: safeBundle)
    static let lunarSand = Color("lunarSand", bundle: safeBundle)
    static let pastelPink = Color("pastelPink", bundle: safeBundle)
    static let silver = Color("silver", bundle: safeBundle)
    static let stone = Color("stone", bundle: safeBundle)
    static let ultraPurple = Color("ultraPurple", bundle: safeBundle)
    static let wine = Color("wine", bundle: safeBundle)
    static let basicWhite = Color("basicWhite", bundle: safeBundle)
    static let basicBlack = Color("basicBlack", bundle: safeBundle)
    static let shadowColor = Color("shadow", bundle: safeBundle)
    static let textColorEnabled = Color("textColorEnabled", bundle: safeBundle)
    static let backgroundPrimary = Color("backgroundPrimary", bundle: safeBundle)
}

// Versión alternativa más simple si tienes problemas
public extension Color {
    // Definición alternativa usando directamente Bundle.module
    static let fuchsiaPinkModule = Color("fuchsiaPink", bundle: .module)
    
    static func testAllBundles() {
        print("=== TESTEO DE TODOS LOS BUNDLES ===")
        
        let bundlesToTest: [Bundle] = [
            .module,
            .main,
            Bundle(for: BundleFinder.self)
        ] + Bundle.allBundles.filter {
            $0.bundleIdentifier?.contains("FHKDesignSystem") == true
        }
        
        for (index, bundle) in bundlesToTest.enumerated() {
            print("\n[Bundle \(index)]: \(bundle)")
            print("ID: \(bundle.bundleIdentifier ?? "nil")")
            
            // Intentar cargar el color
            let testColor = Color("fuchsiaPink", bundle: bundle)
            print("Color creado con este bundle: \(testColor)")
            
            // Verificar si el asset catalog existe
            let assetPath = bundle.path(forResource: "Assets", ofType: "car")
            print("Assets.car: \(assetPath ?? "NO")")
        }
    }
    
    private class BundleFinder {}
}
