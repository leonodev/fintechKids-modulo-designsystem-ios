//
//  GradientDivider.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 15/5/26.
//

import SwiftUI

public struct GradientDivider: View {
    public let initColor: Color
    public let middleColor: Color
    public let endColor: Color
    
    public init(initColor: Color, middleColor: Color, endColor: Color) {
        self.initColor = initColor
        self.middleColor = middleColor
        self.endColor = endColor
    }
    
    public var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    colors: [initColor, middleColor, endColor],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .frame(height: 3.5)
            .padding(.horizontal)
    }
}
