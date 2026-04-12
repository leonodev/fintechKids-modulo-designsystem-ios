//
//  FHKCheckBoxItem.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 12/4/26.
//

import SwiftUI

struct FHKCheckBoxItem: Identifiable, Equatable {
    let id = UUID()
    let label: String
    var isChecked: Bool
    
    static func == (lhs: FHKCheckBoxItem, rhs: FHKCheckBoxItem) -> Bool {
        lhs.id == rhs.id && lhs.isChecked == rhs.isChecked
    }
}
