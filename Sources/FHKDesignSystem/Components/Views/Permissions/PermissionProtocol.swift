//
//  PermissionProtocol.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 17/1/26.
//

public enum PermissionStatus {
    case notDetermined, authorized, denied
}

public protocol PermissionProtocol {
    var title: String { get }
    var message: String { get }
    var status: PermissionStatus { get }
    var titleButtonSetting: String { get }
    var titleButtonLater: String { get }
    func requestPermission(completion: @escaping (PermissionStatus) -> Void)
}
