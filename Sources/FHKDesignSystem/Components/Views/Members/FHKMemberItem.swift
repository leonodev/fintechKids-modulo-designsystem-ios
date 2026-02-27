//
//  FHKMemberItem.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 24/2/26.
//

import SwiftUI
import FHKUtils

public struct FHKMemberItem: View {
    let id: UUID
    let avatarName: String
    let nameMember: String
    var action: (UUID) -> Void
    
    public init(id: UUID,
                avatarName: String,
                nameMember: String,
                action: @escaping (UUID) -> Void
    ) {
        self.id = id
        self.avatarName = avatarName
        self.nameMember = nameMember
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing: FHKSpace.space12) {

            AvatarView(imageName: avatarName.getAvatar,
                       size: FHKSize.size68)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.yellow.opacity(0.9), lineWidth: 2))
                .onTapGesture {
                    action(id)
                }

            Text(nameMember.capitalizingFirstLetter())
                .font(.PangramSans.medium(16))
                .foregroundColor(.white)
                .padding(.leading, 04)
        }
    }
}

#Preview {
    PreviewContainer {
        
        Group {
            FHKMemberItem(id: UUID(),
                          avatarName: AvatarType.boy_1.name,
                          nameMember: "Juan",
                          action: { _ in })
        }
    }
}
