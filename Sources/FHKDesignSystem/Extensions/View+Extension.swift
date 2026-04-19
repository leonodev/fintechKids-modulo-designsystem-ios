//
//  View+Extension.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 19/4/26.
//

import SwiftUI

public extension View {
    @ViewBuilder
    public func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
