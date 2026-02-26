//
//  ToastManagerProtocol.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 26/2/26.
//

public protocol FHKToastManagerProtocol: Sendable {
    var currentToast: ToastInfo? { get set }
    var isVisible: Bool { get set }
    @MainActor func show(info: ToastInfo, duration: Double)
    @MainActor func dismiss()
}
