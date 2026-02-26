//
//  FHKMemberItem.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 24/2/26.
//

import SwiftUI
import FHKDomain

public struct FHKMemberItem: View {
    let member: FamilyMember
    var action: (FamilyMember) -> Void
    
    public init(member: FamilyMember,
                action: @escaping (FamilyMember) -> Void
    ) {
        self.member = member
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing: FHKSpace.space16) {

            AvatarView(imageName: member.avatar_name.getAvatar,
                       size: FHKSize.size68)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.yellow.opacity(0.9), lineWidth: 2))
                .onTapGesture {
                    action(member)
                }

            Text(member.member_name)
                .font(.PangramSans.medium(16))
                .foregroundColor(.white)
                .padding(.leading, 04)
        }
    }
}

#Preview {
    PreviewContainer {
        
        Group {
            FHKMemberItem(member: FamilyMember(id: nil,
                                               email: "user@gmail.com",
                                               memberName: "Juan",
                                               avatarImage: AvatarType.boy_2.name),
                          action: { _ in })
        }
    }
    
}
