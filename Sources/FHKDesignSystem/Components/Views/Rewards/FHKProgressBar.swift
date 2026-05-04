//
//  FHKProgressBar.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 3/5/26.
//

import SwiftUI

public struct FHKProgressBarView: View {
    let current: Double
    let total: Double
    let workType: String
    let color: Color
    
    public init(current: Double,
                total: Double,
                workType: String,
                color: Color = FHKColor.basicBlack.opacity(0.7)
    ) {
        self.current = current
        self.total = total
        self.workType = workType
        self.color = color
    }
    
    public var body: some View {
        // Barra de progreso y Valor faltante
        HStack(spacing: FHKSpace.space12) {
            // Barra de progreso personalizada
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(FHKColor.purpleBackground.opacity(0.15))
                        .frame(height: FHKSize.size12)

                    Capsule()
                        .fill(FHKColor.purpleBackground)
                        .frame(width: geo.size.width * CGFloat(min(current / total, 1.0)), height: FHKSize.size12)
                }
            }
            .frame(height: FHKSize.size12)
            
            // Cálculo de lo que falta
            Text("+\(Int(total - current)) \(workType)")
                .font(.PangramSans.bold(FHKSize.size12))
                .foregroundColor(color)
                .fixedSize(horizontal: true, vertical: false)
        }
    }
}

#Preview {
    PreviewContainer {
        FHKProgressBarView(current: 20,
                           total: 100,
                           workType: "KidsCoins",
                           color: FHKColor.lunarSand.opacity(0.8))
    }
}
