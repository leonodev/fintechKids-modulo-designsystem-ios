//
//  ScreenContainer.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 29/12/25.
//

import SwiftUI
import FHKInjections

public struct ScreenContainer<Content: View>: View {
    @Inject(\.languageManager) private var langManager
    
    private let content: Content
    private let showNavigationBar: Bool

    public init(
        showNavigationBar: Bool = true,
        @ViewBuilder content: () -> Content
    ) {
        self.showNavigationBar = showNavigationBar
        self.content = content()
    }

    public var body: some View {
        ZStack {
            Color(Color.backgroundPrimary)
                .ignoresSafeArea()
            
            content
                // Automatic language reactivity is applied
                .observeLanguage()
                
                // add new globals features:
                // .onTapGesture { hideKeyboard() }
                // .trackScreenView("NombreDeLaPantalla") analiticas
        }
        .navigationBarHidden(!showNavigationBar)
    }
}
