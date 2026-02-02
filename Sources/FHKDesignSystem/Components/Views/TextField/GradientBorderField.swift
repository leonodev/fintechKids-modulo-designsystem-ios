//
//  GradientBorderField.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 7/1/26.
//

import SwiftUI

public struct GradientBorderField: View {
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool
    
    @State private var isTextVisible: Bool = false
    
    public init(text: Binding<String>, placeholder: String, isSecure: Bool = false) {
        self._text = text
        self.placeholder = placeholder
        self.isSecure = isSecure
        self._isTextVisible = State(initialValue: !isSecure)
    }
    
    private var accentGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [FHKColor.ultraPurple, FHKColor.fuchsiaPink]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    // Lógica para determinar si el label debe flotar
    private var isFloating: Bool {
        !text.isEmpty
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            // Borde con degradado
            RoundedRectangle(cornerRadius: 12)
                .stroke(accentGradient, lineWidth: 2)
            
            // Placeholder Animado (Floating Label)
            Text(placeholder)
                .font(.PangramSans.bold(isFloating ? FHKSize.size12 : FHKSize.size20))
                .foregroundColor(FHKColor.lunarSand.opacity(isFloating ? 1.0 : 0.4))
                .padding(.horizontal, isFloating ? 4 : 0)
                .background(isFloating ? FHKColor.indigo : Color.clear) // Fondo para "tapar" el borde si sube mucho
                .offset(x: isFloating ? 12 : 16, y: isFloating ? -28 : 0) // Se mueve hacia arriba
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isFloating)
            
            // Campo de texto e icono
            HStack(spacing: 12) {
                Group {
                    if isTextVisible {
                        TextField("", text: $text)
                            .autocapitalization(.none)
                            .font(.PangramSans.bold(FHKSize.size20))
                            .foregroundColor(FHKColor.lunarSand)
                    } else {
                        SecureField("", text: $text)
                            .font(.PangramSans.bold(FHKSize.size20))
                            .foregroundColor(FHKColor.lunarSand)
                    }
                }
                .padding(.top, isFloating ? 8 : 0) // Baja un poco el texto si el label flota
                
                if isSecure {
                    Button(action: { isTextVisible.toggle() }) {
                        Image(systemName: isTextVisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(FHKColor.lunarSand.opacity(0.7))
                            .font(.system(size: 18))
                    }
                }
            }
            .padding(.horizontal, FHKSize.size16)
        }
        .frame(height: FHKSize.size56)
    }
}

#Preview {
    VStack {
        Spacer()
        GradientBorderField(
            text: .constant("password"),
            placeholder: "Introduce tu contraseña",
            isSecure: true
        )
        Spacer()
    }
    .background(FHKColor.indigo)
    
}

