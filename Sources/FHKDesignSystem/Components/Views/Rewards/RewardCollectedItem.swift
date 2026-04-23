//
//  RewardCollectedItem.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 22/4/26.
//

import SwiftUI
import FHKUtils

public struct FHKRewardCollectedItem: View {
    let id: Int
    let memberName: String
    let avatarName: String
    let taskName: String
    let rewardName: String
    let state: ComponentState
    let msnDataError: String
    var action: (UUID) -> Void
    
    @State private var isPulsing = false
    
    public init(id: Int,
                memberName: String,
                avatarName: String,
                taskName: String,
                rewardName: String,
                state: ComponentState,
                msnDataError: String,
                action: @escaping (UUID) -> Void
    ) {
        self.id = id
        self.memberName = memberName
        self.avatarName = avatarName
        self.taskName = taskName
        self.rewardName = rewardName
        self.state = state
        self.msnDataError = msnDataError
        self.action = action
    }
    
    public var body: some View {
        content
            .animation(.easeInOut(duration: 0.3), value: state)
    }
    
    @ViewBuilder
    private var content: some View {
        switch state {
        case .skeleton:
            skeletonView
            
        case .error:
            errorView
            
        case .loaded:
            loadedView
        }
    }
    
    var loadedView: some View {
        HStack(spacing: FHKSpace.space12) {
            AvatarView(image: avatarName.getAvatar, size: FHKSize.size52)
            
            VStack(alignment: .leading, spacing: FHKSpace.space04) {
                Text(memberName)
                    .font(.PangramSans.bold(FHKSize.size16))
                    .foregroundColor(FHKColor.lunarSand)
                
                Group {
                    Text(taskName)
                        .font(.PangramSans.bold(FHKSize.size16))
                        .foregroundColor(FHKColor.lunarSand)
                    
                    Text("🏅 \(rewardName)")
                        .font(.PangramSans.bold(FHKSize.size16))
                        .padding(.leading, -FHKSize.size04)
                        .colorDegradeStyle()
                }
                .font(.PangramSans.bold(FHKSize.size16))
                .foregroundColor(FHKColor.lunarSand.opacity(0.8))
                .lineLimit(1)
            }
            
            Spacer()
            
            // Icono sutil del Golden Ticket
            Image(systemName: "ticket.fill")
                .font(.PangramSans.bold(FHKSize.size32))
                .colorDegradeStyle()
                .rotationEffect(.degrees(-25))
        }
        .padding()
        .frame(height: FHKSize.size112)
        .cardBackgroundGlassStyle()
    }
    
    var errorView: some View {
        VStack(spacing: FHKSpace.space12) {
            Image(systemName: "xmark.icloud.fill")
                .font(.system(size: FHKSize.size48))
                .foregroundColor(.gray.opacity(0.6))

            Text(msnDataError)
                .font(.PangramSans.medium(FHKSize.size16))
                .foregroundColor(.white.opacity(0.4))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: FHKSize.size20)
                .fill(.white.opacity(0.1))
                .background(
                    RoundedRectangle(cornerRadius: FHKSize.size20)
                        .stroke(.white.opacity(0.2), lineWidth: 1)
                )
        )
        .clipShape(RoundedRectangle(cornerRadius: FHKSize.size20))
    }
    
    var skeletonView: some View {
        HStack(spacing: FHKSpace.space12) {
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: FHKSize.size52, height: FHKSize.size52)
                .blinkCircleSkeleton()
            
            VStack(alignment: .leading, spacing: FHKSpace.space12) {
                // Representación del Texto
                RoundedRectangle(cornerRadius: FHKSize.size04)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: FHKSize.size52, height: FHKSize.size16)
                
                RoundedRectangle(cornerRadius: FHKSize.size04)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: FHKSize.size160, height: FHKSize.size16)
                
                RoundedRectangle(cornerRadius: FHKSize.size04)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: FHKSize.size96, height: FHKSize.size16)
            }
            .blinkTextSkeleton()
            
            Spacer()
            
            // Icono sutil del Golden Ticket
            Image(systemName: "ticket.fill")
                .foregroundStyle(.gray.opacity(0.4))
                .font(.PangramSans.bold(FHKSize.size32))
                .rotationEffect(.degrees(-25))
                .blinkTextSkeleton()
        }
        .padding()
        .cardBackgroundGlassStyle()
    }
}

#Preview {
    PreviewContainer {
        FHKRewardCollectedItem(
            id: 1,
            memberName: "childName",
            avatarName: "boy_9",
            taskName: "task",
            rewardName: "reward",
            state: .skeleton,
            msnDataError: "Data Unavailable",
            action: { _ in }
        )
    }
}
