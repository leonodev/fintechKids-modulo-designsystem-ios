//
//  IntegerOnlyModifier.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 14/3/26.
//

import SwiftUI

struct IntegerOnlyModifier: ViewModifier {
    @Binding var text: String

    func body(content: Content) -> some View {
        content
            .keyboardType(.numberPad) // Configuramos el teclado automáticamente
            .onChange(of: text) { _, newValue in
                let filtered = newValue.filter { "0123456789".contains($0) }
                if filtered != newValue {
                    text = filtered
                }
            }
    }
}

extension View {
    /// Fuerza a que un TextField solo acepte números enteros.
    func onlyIntegers(text: Binding<String>) -> some View {
        self.modifier(IntegerOnlyModifier(text: text))
    }
}
