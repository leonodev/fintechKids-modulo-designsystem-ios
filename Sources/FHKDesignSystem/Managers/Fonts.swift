//
//  Fonts.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 22/11/25.
//

import SwiftUI

// Minimalist
public extension Font {
    
    struct Minimalist {
        
        @MainActor
        static func simpleRegular(_ size: CGFloat = FHKSize.size16) -> Font {
            FontManager.registerFontsIfNeeded()
            return Font.custom("SimpleMinimalistRegular", fixedSize: size)
        }
        
        @MainActor
        static func simpleBold(_ size: CGFloat = FHKSize.size16) -> Font {
            FontManager.registerFontsIfNeeded()
            return Font.custom("SimpleMinimalistRegular", fixedSize: size).weight(.bold)
        }
    }
}


// PangramSans
public extension Font {
    
    
    struct PangramSans {
        
        struct Narrow {
            
            @MainActor
            static func extraboldItalic(_ size: CGFloat = FHKSize.size16) -> Font {
                FontManager.registerFontsIfNeeded()
                return Font.custom("PPPangramSansRounded-NarrowExtraboldItalic", fixedSize: size)
            }
            
            @MainActor
            static func extralightReclined(_ size: CGFloat = FHKSize.size16) -> Font {
                FontManager.registerFontsIfNeeded()
                return Font.custom("PPPangramSansRounded-NarrowExtralightReclined", fixedSize: size)
            }
            
            @MainActor
            static func semiboldItalic(_ size: CGFloat = FHKSize.size16) -> Font {
                FontManager.registerFontsIfNeeded()
                return Font.custom("PPPangramSansRounded-NarrowSemiboldItalic", fixedSize: size)
            }
            
            @MainActor
            static func semibold(_ size: CGFloat = FHKSize.size16) -> Font {
                FontManager.registerFontsIfNeeded()
                return Font.custom("PPPangramSansRounded-NarrowSemibold", fixedSize: size)
            }
        }
        
        struct Condensed {
            
            @MainActor
            static func thin(_ size: CGFloat = FHKSize.size16) -> Font {
                FontManager.registerFontsIfNeeded()
                return Font.custom("PPPangramSansRounded-CondensedThin", fixedSize: size)
            }
        }
        
        struct Compact {
            
            @MainActor
            static func regular(_ size: CGFloat = FHKSize.size16) -> Font {
                FontManager.registerFontsIfNeeded()
                return Font.custom("PPPangramSansRounded-CompactRegular", fixedSize: size)
            }
            
            @MainActor
            static func extralightReclined(_ size: CGFloat = FHKSize.size16) -> Font {
                FontManager.registerFontsIfNeeded()
                return Font.custom("PPPangramSansRounded-CompactExtralightReclined", fixedSize: size)
            }
            
            @MainActor
            static func thinItalic(_ size: CGFloat = FHKSize.size16) -> Font {
                FontManager.registerFontsIfNeeded()
                return Font.custom("PPPangramSansRounded-CompactThinItalic", fixedSize: size)
            }
        }
        
        struct Compressed {
            
            @MainActor
            static func mediumReclined(_ size: CGFloat = FHKSize.size16) -> Font {
                FontManager.registerFontsIfNeeded()
                return Font.custom("PPPangramSansRounded-CompressedMediumReclined", fixedSize: size)
            }
            
            @MainActor
            static func extrabold(_ size: CGFloat = FHKSize.size16) -> Font {
                FontManager.registerFontsIfNeeded()
                return Font.custom("PPPangramSansRounded-CompressedExtrabold", fixedSize: size)
            }
        }
        
        @MainActor
        static func medium(_ size: CGFloat = FHKSize.size16) -> Font {
            FontManager.registerFontsIfNeeded()
            return Font.custom("PPPangramSansRounded-Medium", fixedSize: size)
        }

        @MainActor
        static func slimSemiboldItalic(_ size: CGFloat = FHKSize.size16) -> Font {
            FontManager.registerFontsIfNeeded()
            return Font.custom("PPPangramSansRounded-SlimSemiboldItalic", fixedSize: size)
        }

        @MainActor
        static func light(_ size: CGFloat = FHKSize.size16) -> Font {
            FontManager.registerFontsIfNeeded()
            return Font.custom("PPPangramSansRounded-Light", fixedSize: size)
        }
        
        @MainActor
        static func bold(_ size: CGFloat = FHKSize.size16) -> Font {
            FontManager.registerFontsIfNeeded()
            return Font.custom("PPPangramSansRounded-Bold", fixedSize: size)
        }
        
        @MainActor
        static func extraboldItalic(_ size: CGFloat = FHKSize.size16) -> Font {
            FontManager.registerFontsIfNeeded()
            return Font.custom("PPPangramSansRounded-ExtraboldItalic", fixedSize: size)
        }
        
        @MainActor
        static func slimExtralight(_ size: CGFloat = FHKSize.size16) -> Font {
            FontManager.registerFontsIfNeeded()
            return Font.custom("PPPangramSansRounded-SlimExtralight", fixedSize: size)
        }
        
        @MainActor
        static func semibold(_ size: CGFloat = FHKSize.size16) -> Font {
            FontManager.registerFontsIfNeeded()
            return Font.custom("PPPangramSansRounded-Semibold", fixedSize: size)
        }

        @MainActor
        static func thin(_ size: CGFloat = FHKSize.size16) -> Font {
            FontManager.registerFontsIfNeeded()
            return Font.custom("PPPangramSansRounded-Thin", fixedSize: size)
        }
        
        @MainActor
        static func slimMediumReclined(_ size: CGFloat = FHKSize.size16) -> Font {
            FontManager.registerFontsIfNeeded()
            return Font.custom("PPPangramSansRounded-SlimMediumReclined", fixedSize: size)
        }
    }
}

