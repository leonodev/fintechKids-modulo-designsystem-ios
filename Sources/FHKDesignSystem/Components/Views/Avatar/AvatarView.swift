//
//  AvatarView.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 20/1/26.
//

import SwiftUI

public struct AvatarView: View {
    var imageName: Image
    var size: CGFloat
    
    public init(imageName: Image, size: CGFloat = 60) {
        self.imageName = imageName
        self.size = size
    }

    public var body: some View {
        imageName
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.purple.opacity(0.8), lineWidth: 3)
            )
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}


#Preview {
    VStack {
        AvatarView(imageName: Image.avatarGirl1)
    }
}
