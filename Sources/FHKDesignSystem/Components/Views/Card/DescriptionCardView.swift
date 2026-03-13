//
//  DescriptionCardView.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 13/3/26.
//

import SwiftUI

public struct FHKDescriptionCardView: View {
    let title: String
    let description: String
    
    public init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(.PangramSans.bold(FHKSize.size16))
                .foregroundColor(FHKColor.pastelPink.opacity(0.8))
            
            Text(description)
                .font(.Minimalist.simpleBold())
                .foregroundColor(.white.opacity(0.8))
        }
    }
}
