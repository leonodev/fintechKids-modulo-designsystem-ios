//
//  FHKDesignSystemDemoApp.swift
//  FHKDesignSystemDemo
//
//  Created by Fredy Leon on 15/11/25.
//

import SwiftUI
import FHKDesignSystem

@main
struct FHKDesignSystemDemoApp: App {
    init() {
        // Registrar fuentes al iniciar la app
        FontManager.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
