//
//  CardView.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 12/3/26.
//

import SwiftUI

struct CardView<Content: View, T>: View {
    let content: Content
    let data: T?
    let action: (T?) -> Void
    let isSelected: Bool

    init(data: T,
         isSelected: Bool = false,
         action: @escaping (T?) -> Void,
         @ViewBuilder content: () -> Content
    ) {
        self.data = data
        self.isSelected = isSelected
        self.action = action
        self.content = content()
    }

    init(isSelected: Bool = false,
         action: @escaping (T?) -> Void,
         @ViewBuilder content: () -> Content
    ) where T == Any {
        self.data = nil
        self.isSelected = isSelected
        self.action = action
        self.content = content()
    }

    var body: some View {
        VStack {
            content
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            FHKColor.lunarSand.opacity(0.08)
        )
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(isSelected ? Color.purple : Color.clear, lineWidth: 2)
        )
        .onTapGesture {
            action(data)
        }
    }
}

#Preview {
    PreviewContainer {
        CardView { _ in
            print("Navegando al perfil del usuario: ")
        } content: {
            VStack(alignment: .leading, spacing: 15) {
                // Título de la tarjeta
                Text("Título de la Card")
                    .font(.headline)
                    .foregroundColor(.white)
                
                // Descripción o cuerpo
                Text("Este es un ejemplo de una tarjeta básica en SwiftUI con el fondo degradado que pediste.")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
        .padding()
    }
}
