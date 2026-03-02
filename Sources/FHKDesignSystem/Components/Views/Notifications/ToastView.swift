//
//  ToastView.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 18/1/26.
//

import Foundation
import SwiftUI

public enum ToastType {
    case success
    case error
    case warning
    case notification
}

public struct ToastView: View {
    @Binding public var isVisible: Bool
    public var hasIcon: Bool
    public var message: String
    public var type: ToastType
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    public init(isVisible: Binding<Bool>,
                hasIcon: Bool,
                message: String,
                type: ToastType
    ) {
        self._isVisible = isVisible
        self.hasIcon = hasIcon
        self.message = message
        self.type = type
    }
    
    public var body: some View {
        HStack(spacing: 15) {
            if hasIcon {
                Image(systemName: iconSystemName)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: FHKSize.size24, height: FHKSize.size24)
                    .foregroundColor(.white)
            }
            
            Text(self.message)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding(.horizontal, FHKSize.size04)
        .padding(.vertical, FHKSize.size16)
        .frame(maxWidth: .infinity)
        .setToastStyle(isVisible: $isVisible, type: self.type)
    }
    
    private var iconSystemName: String {
        switch self.type {
        case .success:
            return "checkmark.circle.fill"
        case .error:
            return "xmark.circle.fill"
        case .warning:
            return "exclamationmark.circle.fill"
        case .notification:
            return "wifi.exclamationmark.circle.fill"
        }
    }
}

#Preview {
    VStack {
        ToastView(isVisible: .constant(true),
                  hasIcon: true,
                  message: "Prueba de notificacion si incluso a doble linea o mas ...",
                  type: .success)
    
    }
    .frame(width: .infinity)
}
