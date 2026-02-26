//
//  ToastAppareance.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 19/1/26.
//

import Foundation
import SwiftUI
import FHKDomain

public extension View {
    func setToastStyle(isVisible: Binding<Bool>, info: ToastInfo) -> some View {
        modifier(ToastModifier(isVisible: isVisible, info: info))
    }
}

public extension ToastAppareanceProtocol {
    var borderColor: Color {
        return FHKColor.gray
    }
    
    @MainActor
    var fontText: Font {
        return .PangramSans.medium(FHKSize.size20)
    }
    
    var cornerRadius: CGFloat {
        return CGFloat(FHKSize.size20)
    }
    
    var borderWidth: CGFloat {
        return CGFloat(1)
    }
    
    var shadow: CGFloat {
        return CGFloat(FHKSize.size04)
    }
}

fileprivate struct ToastModifier: ViewModifier, ToastAppareanceProtocol {
    @Binding var isVisible: Bool
    let info: ToastInfo?
    
    
    func body(content: Content) -> some View {
        ZStack(alignment: .top) {
 
            if isVisible {
                content
                .font(fontText)
                .foregroundColor(getTextColor())
                .padding(.horizontal, FHKSize.size16)
                .background(getBackgroundColor())
                .cornerRadius(cornerRadius)
                .shadow(radius: shadow)
                .padding(.top, safeAreaPadding())
                .transition(.move(edge: .top))
                .offset(y: isVisible ? paddingOffset() : -UIScreen.main.bounds.height)
                .animation(.easeInOut(duration: 2), value: isVisible)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            isVisible = false
                        }
                    }
                }
                .padding()
                Spacer()
            }
        }
    }
    
    private func getBackgroundColor() -> Color {
        switch info?.type {
        case .success:
            return FHKColor.success
        case .error:
            return FHKColor.error
        case .warning:
            return FHKColor.warning
        case .notification:
            return FHKColor.basicBlack
        default:
            return Color.clear
        }
    }
    
    private func getTextColor() -> Color {
        switch info?.type {
        case .success, .error, .notification:
            return FHKColor.basicWhite
        case .warning:
            return FHKColor.basicBlack
        default:
            return Color.clear
        }
    }
    
    private func paddingOffset() -> CGFloat {
        let valuePadding: CGFloat = -100
        print(valuePadding)
        return valuePadding
    }
    
    private func safeAreaPadding() -> CGFloat {
        let keyWindow = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        
        let topPadding = keyWindow?.safeAreaInsets.top ?? 0
        let finalTopPadding = topPadding >= 20 ? topPadding : 0
        return finalTopPadding
    }
}
