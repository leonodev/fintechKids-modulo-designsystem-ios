//
//  Colors.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 22/11/25.
//

import SwiftUI

// MARK: - Design System Color Extension
public extension Color {
    
    // MARK: - Bundle Configuration
    /// Static bundle reference for the Design System module resources
    private static let designSystemBundle: Bundle = {
        let bundle = Bundle.module
        #if DEBUG
        logBundleDetails(bundle)
        #endif
        return bundle
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
}

// MARK: - Bundle Diagnostics
public extension Color {
    
    /// Performs comprehensive diagnostics on the Design System bundle and assets
    static func performBundleDiagnostics() {
        print("\n🎨 DESIGN SYSTEM BUNDLE DIAGNOSTICS")
        print("=====================================")
        
        let bundle = Bundle.module
        
        // Bundle Information
        print("\n📦 BUNDLE INFORMATION:")
        print("   • Path: \(bundle.bundlePath)")
        print("   • Identifier: \(bundle.bundleIdentifier ?? "Not available")")
        
        // Asset Catalog Discovery
        print("\n🔍 ASSET CATALOG SEARCH:")
        discoverAssetCatalogs(in: bundle)
        
        // Color Asset Verification
        print("\n🎯 COLOR ASSET VERIFICATION:")
        verifyColorAssets(in: bundle)
    }
    
    // MARK: - Private Helper Methods
    private static func logBundleDetails(_ bundle: Bundle) {
        print("🔄 DesignSystem Bundle Loaded")
        print("   Path: \(bundle.bundlePath)")
        
        if let contents = try? FileManager.default.contentsOfDirectory(atPath: bundle.bundlePath) {
            print("   Contents: \(contents.joined(separator: ", "))")
        }
    }
    
    private static func discoverAssetCatalogs(in bundle: Bundle) {
        guard let enumerator = FileManager.default.enumerator(atPath: bundle.bundlePath) else {
            print("   Unable to enumerate bundle contents")
            return
        }
        
        var foundCatalogs: [String] = []
        for case let file as String in enumerator {
            if file.hasSuffix(".xcassets") || file.hasSuffix(".car") {
                foundCatalogs.append(file)
            }
        }
        
        if foundCatalogs.isEmpty {
            print("   No asset catalogs found")
        } else {
            foundCatalogs.forEach { print("   • \($0)") }
        }
    }
    
    private static func verifyColorAssets(in bundle: Bundle) {
        let colorAssets = [
            ("FuchsiaPink", "Fuchsia Pink"),
            ("Gray", "Gray"),
            ("LunarSand", "Lunar Sand"),
            ("PastelPink", "Pastel Pink"),
            ("Silver", "Silver"),
            ("Stone", "Stone"),
            ("UltraPurple", "Ultra Purple"),
            ("Wine", "Wine"),
            ("basicWhite", "Basic White"),
            ("basicBlack", "Basic Black"),
            ("shadow", "Shadow"),
            ("textColorEnabled", "Text Color Enabled"),
            ("backgroundPrimary", "Background Primary")
        ]
        
        for (assetName, displayName) in colorAssets {
            let color = Color(assetName, bundle: bundle)
            print("   • \(displayName): \(color)")
        }
    }
}
