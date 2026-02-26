//
//  ToastInfo.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 26/2/26.
//

import Foundation
import SwiftUI

public enum ToastType {
    case success
    case error
    case warning
    case notification
}

public class ToastInfo {
    public var type: ToastType
    public var message: String
    public var hasIcon: Bool
    
    public init(type: ToastType = .success, message: String = "", hasIcon: Bool = false) {
        self.type = type
        self.message = message
        self.hasIcon = hasIcon
    }
}
