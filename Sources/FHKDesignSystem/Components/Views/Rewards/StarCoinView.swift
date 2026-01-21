//
//  StarCoinView.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 21/1/26.
//
import SwiftUI

public struct StarCoinView: View {
    var text: String
    var balance: String
    
    public init(text: String, balance: String) {
        self.text = text
        self.balance = balance
    }
    
    public var body: some View {
        HStack(spacing: FHKSize.size12) {
            
            Image(systemName: "star.fill")
                .foregroundColor(FHKColor.yellow)
                .font(.system(size: FHKSize.size28, weight: .bold))
            
            HStack(spacing: 4) {
                Text(text)
                    .font(.system(size: FHKSize.size16, weight: .medium))
                    .foregroundColor(.white.opacity(0.9))
                
                Text(balance)
                    .font(.system(size: FHKSize.size20, weight: .bold))
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical, FHKSize.size12)
        .padding(.horizontal, FHKSize.size20)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(FHKColor.indigo)
                
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
            }
        )
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    StarCoinView(text: "StarCoins",
                 balance: "1.250")
}
