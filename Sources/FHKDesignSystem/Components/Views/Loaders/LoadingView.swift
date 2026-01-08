//
//  LoadingView.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 8/1/26.
//

import SwiftUI

public struct LoadingView: View {
    var msn: String
    
    public init(msn: String) {
        self.msn = msn
    }
    
    public var body: some View {
        VStack {
            LottieView(animationName: Lotties.loading,
                       loopMode: .loop,
                       contentMode: .scaleAspectFit)
            .frame(height: 200)
            .padding(.bottom, FHKSize.size20)
            
            Text(msn)
                .foregroundStyle(Color.pastelPink)
                .font(Font.PangramSans.semibold(FHKSize.size20))
                .padding(.bottom, FHKSize.size20)
        }
        
    }
}

#Preview {
    LoadingView(msn: "Procesando...")
}
