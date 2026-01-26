//
//  FHKModalPresenter.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 26/1/26.
//

import SwiftUI

public struct FHKModalPresenter: ViewModifier {
    var manager: FHKModalProtocol

    public func body(content: Content) -> some View {
        content
            .overlay {
                if manager.isPresented, let popupContent = manager.content {
                    FHKPopupContainer(content: popupContent) {
                        manager.dismiss()
                    }
                    .transition(.opacity.combined(with: .scale(scale: 0.9)))
                }
            }
    }
}
