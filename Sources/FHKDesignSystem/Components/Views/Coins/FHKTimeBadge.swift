//
//  FHKTimeBadge.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 31/3/26.
//

import SwiftUI

public struct FHKTimeBadge: View {
    let amount: String
    let description: String
    let size: CGFloat
    
    public init(amount: String,
                description: String,
                size: CGFloat = FHKSize.size12
    ) {
        self.amount = amount
        self.description = description
        self.size = size
    }
    
    public var body: some View {
        HStack(spacing: FHKSpace.space16) {
            Image(systemName: "watch.analog")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
            
            VStack(alignment: .leading) {
                Text("\(amount)")
                    .font(.PangramSans.bold(size))
                
                Text(description)
                    .font(.PangramSans.bold(size / 2))
                    .foregroundStyle(FHKColor.stone)
            }
        }
        .padding(.vertical, size / 2)
        .padding(.horizontal, size)
        .foregroundColor(FHKColor.yellow)
        .background(Color.blue)
        .clipShape(Capsule())
    }
}

#Preview {
    PreviewContainer {
        FHKTimeBadge(amount: "2 hours",
                     description: "Tu tiempo actual",
                     size: 40)
    }
}
