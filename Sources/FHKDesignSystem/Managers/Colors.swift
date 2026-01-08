//
//  Colors.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 22/11/25.
//

import SwiftUI

// MARK: - Design System Color Extension
public struct FHKColor {
    
    // MARK: - Bundle Configuration
    /// Static bundle reference for the Design System module resources
//    private static let designSystemBundle: Bundle = {
//        let bundle = Bundle.module
//        #if DEBUG
//        logBundleDetails(bundle)
//        #endif
//        return bundle
//    }()
    
    private final class BundleToken {}

        private static let designSystemBundle: Bundle = {
            #if SWIFT_PACKAGE
            return Bundle.module
            #else
            // Fallback para otros sistemas de build o contextos de test
            return Bundle(for: BundleToken.self)
            #endif
        }()
    
    // MARK: - Color Definitions
    /// Fuchsia Pink color from the asset catalog
    public static let fuchsiaPink = Color("fuchsiaPink", bundle: designSystemBundle)
    
    /// Gray color from the asset catalog
    public static let gray = Color("gray", bundle: designSystemBundle)
    
    /// Lunar Sand color from the asset catalog
    public static let lunarSand = Color("lunarSand", bundle: designSystemBundle)
    
    /// Pastel Pink color from the asset catalog
    public static let pastelPink = Color("pastelPink", bundle: designSystemBundle)
    
    /// Silver color from the asset catalog
    public static let silver = Color("silver", bundle: designSystemBundle)
    
    /// Stone color from the asset catalog
    public static let stone = Color("stone", bundle: designSystemBundle)
    
    /// Ultra Purple color from the asset catalog
    public static let ultraPurple = Color("ultraPurple", bundle: designSystemBundle)
    
    /// Wine color from the asset catalog
    public static let wine = Color("wine", bundle: designSystemBundle)
    
    /// Basic White color from the asset catalog
    public static let basicWhite = Color("basicWhite", bundle: designSystemBundle)
    
    /// Basic Black color from the asset catalog
    public static let basicBlack = Color("basicBlack", bundle: designSystemBundle)
    
    /// Shadow color from the asset catalog
    public static let shadowColor = Color("shadow", bundle: designSystemBundle)
    
    /// Text color for enabled state from the asset catalog
    public static let textColorEnabled = Color("textColorEnabled", bundle: designSystemBundle)
    
    /// Primary background color from the asset catalog
    public static let backgroundPrimary = Color("backgroundPrimary", bundle: designSystemBundle)
    
    private static func logBundleDetails(_ bundle: Bundle) {
        print("🔄 DesignSystem Bundle Loaded")
        print("   Path: \(bundle.bundlePath)")
        
        if let contents = try? FileManager.default.contentsOfDirectory(atPath: bundle.bundlePath) {
            print("   Contents: \(contents.joined(separator: ", "))")
        }
    }
}
