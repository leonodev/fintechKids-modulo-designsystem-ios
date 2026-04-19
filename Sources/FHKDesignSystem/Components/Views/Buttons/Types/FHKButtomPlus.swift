//
//  FHKButtomPlus.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 19/4/26.
//

import SwiftUI

public struct FHKButtomPlus: View {
    
    public var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.indigo)
                .frame(width: FHKSize.size72, height: FHKSize.size72)
                .shadow(radius: 5)
            
            Image(systemName: "plus")
                .foregroundColor(.white)
                .font(.title)
        }
    }
}
