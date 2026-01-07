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
    var isSecure: Bool = false
    
    public init(text: Binding<String>, placeholder: String, isSecure: Bool = false) {
        self._text = text
        self.placeholder = placeholder
        self.isSecure = isSecure
    }
    
    let accentGradient = LinearGradient(
        gradient: Gradient(colors: [Color.blue, Color.purple]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(accentGradient, lineWidth: 3)
            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.white)
            .cornerRadius(10)
            .padding(4)
        }
        .frame(height: 50)
    }
}
