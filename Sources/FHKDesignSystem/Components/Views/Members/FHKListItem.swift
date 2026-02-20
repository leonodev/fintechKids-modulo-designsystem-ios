//
//  NewMemberContentView.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 29/1/26.
//

import SwiftUI

public struct FHKListItem: View {
    let name: String
    let amount: String
    let avatarName: String
    let iconName: String
    var action: () -> Void
    
    public init(name: String,
                amount: String,
                avatarName: String,
                iconName: String,
                action: @escaping () -> Void) {
        self.name = name
        self.amount = amount
        self.avatarName = avatarName
        self.iconName = iconName
        self.action = action
    }

    public var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading) {
                
                Text(name)
                    .font(.PangramSans.medium(16))
                    .foregroundColor(.white)
                    .padding(.leading, 04)
                
                FHKCoinBadge(amount: amount)
            }
 
            Spacer()
            
            AvatarView(imageName: avatarName.getAvatar, size: FHKSize.size44)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white.opacity(0.2), lineWidth: 1))
            
            Button(action: action) {
                Image(systemName: iconName)
                    .resizable()
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(FHKColor.yellow)
                    .frame(width: FHKSize.size24, height: FHKSize.size24)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

#Preview {
    PreviewContainer {
        
        Group {
            FHKListItem(name: "Pepito Perez",
                        amount: "0,00",
                        avatarName: "boy_3",
                        iconName: "trash",
                        action: {
                
            })
        }
        
    }
}
