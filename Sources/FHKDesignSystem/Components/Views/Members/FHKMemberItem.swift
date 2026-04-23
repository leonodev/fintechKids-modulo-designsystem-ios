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
    let nameMemberError: String
    let state: ComponentState
    var action: (UUID) -> Void
    
    @State private var isPulsing = false

    public init(id: UUID = UUID(),
                avatarName: String = "",
                nameMember: String = "",
                nameMemberError: String = "",
                state: ComponentState = .loaded,
                action: @escaping (UUID) -> Void
    ) {
        self.id = id
        self.avatarName = avatarName
        self.nameMember = nameMember
        self.nameMemberError = nameMemberError
        self.state = state
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
}

// MARK: - Subviews
private extension FHKMemberItem {
    
    var loadedView: some View {
        VStack(spacing: FHKSpace.space12) {
            AvatarView(image: avatarName.getAvatar,
                       size: FHKSize.size68)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.yellow.opacity(0.9), lineWidth: 2))
                .onTapGesture {
                    action(id)
                }

            Text(nameMember.capitalizingFirstLetter())
                .font(.PangramSans.medium(FHKSize.size16))
                .foregroundColor(.white)
                .padding(.leading, FHKSize.size04)
        }
    }
    
    var skeletonView: some View {
        VStack(spacing: FHKSpace.space12) {
            // Representación del Avatar
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: FHKSize.size68, height: FHKSize.size68)
                .overlay(Circle().stroke(Color.gray.opacity(0.2), lineWidth: 2))

            // Representación del Texto
            RoundedRectangle(cornerRadius: FHKSize.size04)
                .fill(Color.gray.opacity(0.3))
                .frame(width: FHKSize.size60, height: FHKSize.size16)
        }
        .opacity(isPulsing ? 0.5 : 1.0)
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                isPulsing = true
            }
        }
    }
    
    var errorView: some View {
        VStack(spacing: FHKSpace.space12) {
            Image(systemName: "person.crop.circle.badge.exclam")
                .font(.system(size: FHKSize.size48))
                .foregroundColor(.gray.opacity(0.6))

            Text(nameMemberError)
                .font(.PangramSans.medium(FHKSize.size16))
                .foregroundColor(.white.opacity(0.4))
        }
        .frame(width: FHKSize.size80) // Para mantener un ancho similar al avatar
    }
}

extension FHKMemberItem {
    /// Genera una vista con el número de esqueletos deseado.
    @ViewBuilder
    public static func skeletons(count: Int = 3) -> some View {
        HStack(spacing: FHKSpace.space16) {
            ForEach(0..<count, id: \.self) { _ in
                FHKMemberItem(
                    state: .skeleton,
                    action: { _ in }
                )
            }
        }
    }
}

extension FHKRewardCollectedItem {
    /// Genera una vista con el número de esqueletos deseado.
    @ViewBuilder
    public static func skeletons(count: Int = 3) -> some View {
        HStack(spacing: FHKSpace.space16) {
            ForEach(0..<count, id: \.self) { _ in
                FHKRewardCollectedItem(
                    id: 0, memberName: "", avatarName: "", taskName: "", rewardName: "",
                    state: .skeleton,
                    msnDataError: "",
                    action: { _ in }
                )
            }
        }
    }
    
    static func errorItem(message: String) -> FHKRewardCollectedItem {
            FHKRewardCollectedItem(
                id: 0, memberName: "", avatarName: "", taskName: "", rewardName: "",
                state: .error,
                msnDataError: message,
                action: { _ in }
            )
        }
}


#Preview {
    PreviewContainer {
        
        Group {
            FHKMemberItem(id: UUID(),
                          avatarName: AvatarType.boy_1.name,
                          nameMember: "Juan",
                          nameMemberError: "Undefined",
                          state: .loaded,
                          action: { _ in })
        }
    }
}
