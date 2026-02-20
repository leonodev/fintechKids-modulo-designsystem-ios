//
//  PreviewContainer.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 20/2/26.
//

import SwiftUI

public struct PreviewContainer<Content: View>: View {
    private let content: () -> Content
    
    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }
     
    public var body: some View {
        VStack {
            Spacer()
            content()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Spacer()
        }
        .padding()
        .background(FHKColor.indigo)
    }
}
