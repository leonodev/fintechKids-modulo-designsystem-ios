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

    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(accentGradient, lineWidth: 2)
            
            HStack(spacing: 12) {
                Group {
                    if isTextVisible {
                        TextField(placeholder, text: $text)
                            .autocapitalization(.none)
                    } else {
                        SecureField(placeholder, text: $text)
                    }
                }
                .foregroundColor(FHKColor.basicBlack)
                
                
                if isSecure {
                    Button(action: { isTextVisible.toggle() }) {
                        Image(systemName: isTextVisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(FHKColor.gray)
                            .font(.system(size: 18))
                    }
                }
            }
            .padding(.horizontal, FHKSize.size16)
            .cornerRadius(10)
            .padding(2)
        }
        .frame(height: FHKSize.size56)
    }
}

#Preview {
    VStack {
        GradientBorderField(
            text: .constant("password"),
            placeholder: "Introduce tu contraseña",
            isSecure: true
        )
    }
    .background(Color.blue)
    
}

