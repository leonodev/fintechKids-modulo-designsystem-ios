//
//  ErrorView.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 8/1/26.
//

import SwiftUI


public struct ErrorView: View {
    var title: String
    var msnError: String
    var titleBtn: String
    var onActionPressed: (() -> Void)
    
    public init(title: String,
                msnError: String,
                titleBtn: String,
                onActionPressed: @escaping () -> Void
    ) {
        self.title = title
        self.msnError = msnError
        self.titleBtn = titleBtn
        self.onActionPressed = onActionPressed
    }
    
    public var body: some View {
        VStack {
            Text(title)
                .foregroundStyle(Color.fuchsiaPink)
                .font(Font.PangramSans.bold(FHKSize.size32))
                .padding(.bottom, FHKSize.size20)
            
            Text(msnError)
                .foregroundStyle(Color.basicBlack)
                .font(Font.PangramSans.light(FHKSize.size20))
                .padding(.bottom, FHKSize.size20)
            
            LottieView(animationName: Lotties.errorUser,
                       loopMode: .loop,
                       contentMode: .scaleAspectFit)
            .frame(height: 200)
            .padding(.bottom, FHKSize.size40)
            
            
            FHKButtonPrimary(title: titleBtn,
                             textColor: .fuchsiaPink,
                             state: .enabled,
                             mode: .glass(.clear),
                             action: {
                onActionPressed()
            })
            .padding()
        }
        .padding()
    }
}

#Preview {
    ErrorView(title: "Opppss...",
              msnError: "Algo ha ido mal, inténtalo más tarde.",
              titleBtn: "Entendido".uppercased(),
              onActionPressed: {
        
    })
}
