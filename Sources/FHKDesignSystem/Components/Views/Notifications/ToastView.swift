//
//  ToastView.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 18/1/26.
//

import SwiftUI

import Foundation
import SwiftUI

public enum ToastType {
    case success
    case error
    case alert
    case undefined
}

public class ToastInfo {
    public var type: ToastType
    public var message: String
    public var hasIcon: Bool
    
    init(type: ToastType = .success, message: String = "", hasIcon: Bool = false) {
        self.type = type
        self.message = message
        self.hasIcon = hasIcon
    }
}

extension View {
    func toast(isVisible: Binding<Bool>, info: ToastInfo?) -> some View {
        self.modifier(ToastModifier(isVisible: isVisible, info: info))
    }
    
    func setToastStyle(isVisible: Binding<Bool>, info: ToastInfo) -> some View {
        modifier(ToastModifier(isVisible: isVisible, info: info))
    }
    
    func setToastIconStyle(type: ToastType) -> some View {
        self.modifier(ToastIconModifier(type: type))
    }
}

protocol ToastAppareanceProtocol {
    var borderColor: Color { get }
    var fontText: Font { get }
    var cornerRadius: CGFloat { get }
    var borderWidth: CGFloat { get }
    var shadow: CGFloat { get }
}


extension ToastAppareanceProtocol {
    var borderColor: Color {
        return FHKColor.gray
    }
    
    @MainActor
    var fontText: Font {
        return .PangramSans.medium(FHKSize.size20)
    }
    
    var cornerRadius: CGFloat {
        return CGFloat(20)
    }
    
    var borderWidth: CGFloat {
        return CGFloat(1)
    }
    
    var shadow: CGFloat {
        return CGFloat(5)
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
                .padding(.horizontal, 16)
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
        case .alert:
            return FHKColor.warning
        case .undefined, .none:
            return Color.clear
        }
    }
    
    private func getTextColor() -> Color {
        switch info?.type {
        case .success, .error:
            return FHKColor.basicWhite
        case .alert:
            return FHKColor.basicBlack
        case .undefined, .none:
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
    
    private func hasNotch() -> Bool {
        let keyWindow = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        
        let topPadding = keyWindow?.safeAreaInsets.top ?? 0
        return topPadding > 20
    }
    
    private var iconSystemName: String {
        switch info?.type {
        case .success:
            return "checkmark.circle"
        case .error:
            return "xmark.circle"
        case .alert:
            return "exclamationmark.circle"
        case .undefined, .none:
            return ""
        }
    }
}

fileprivate struct ToastIconModifier: ViewModifier {
    let type: ToastType
    
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
            .clipShape(Circle())
            .foregroundColor(colorIcon)
            .shadow(radius: 10)
    }
    
    var colorIcon: Color {
        switch type {
        case .success, .error:
            return FHKColor.basicWhite
        case .alert:
            return FHKColor.basicBlack
        case .undefined:
            return Color.clear
        }
    }
}

public struct ToastView: View {
    @Binding public var isVisible: Bool
    public var info: ToastInfo
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    public var body: some View {
        
        VStack {
            if isVisible {
                
                HStack(spacing: 20) {
                    if info.hasIcon {
                        Image(systemName: iconSystemName)
                            .resizable()
                            .setToastIconStyle(type: info.type)
                    }
                    
                    Text(info.message)
                    
                    Spacer()
                }
                .padding(.vertical)
            }
        }
        .frame(maxWidth: .infinity)
        .edgesIgnoringSafeArea(.top)
        .setToastStyle(isVisible: $isVisible, info: info)
    }
    
    private var iconSystemName: String {
        switch info.type {
        case .success:
            return "checkmark.circle"
        case .error:
            return "xmark.circle"
        case .alert:
            return "exclamationmark.circle"
        case .undefined:
            return "exclamationmark.circle"
        }
    }
}

#Preview {
    VStack {
        ToastView(isVisible: .constant(true),
                  info: ToastInfo(type: .success,
                                  message: "Prueba de notificacion si incluso a doble linea o mas ...",
                                  hasIcon: true ))
        
    }
    .frame(width: .infinity)
}
