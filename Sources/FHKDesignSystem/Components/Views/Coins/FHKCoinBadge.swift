//
//  FHKCoinBadge.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 20/2/26.
//

import SwiftUI

public struct FHKCoinBadge: View {
    let amount: String
    let size: CGFloat
    
    public init(amount: String, size: CGFloat = FHKSize.size12) {
        self.amount = amount
        self.size = size
    }
    
    public var body: some View {
        HStack(spacing: size) {
            Image(systemName: ImageSystem.star_fill.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
            
            Text("KidsCoins: \(amount)")
                .font(.PangramSans.bold(size))
        }
        .padding(.vertical, size / 2)
        .padding(.horizontal, size)
        .foregroundColor(FHKColor.yellow)
        .background(Color.indigo)
        .clipShape(Capsule())
    }
}
