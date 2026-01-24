//
//  AvatarType.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 24/1/26.
//

import SwiftUI

public enum AvatarType: String, CaseIterable {
    case boy1 = "boy_1"
    case boy2 = "boy_2"
    case boy3 = "boy_3"
    case boy4 = "boy_4"
    case boy5 = "boy_5"
    case boy6 = "boy_6"
    case boy7 = "boy_7"
    case boy8 = "boy_8"
    case girl1 = "girl_1"
    case girl2 = "girl_2"
    case girl3 = "girl_3"
    case girl4 = "girl_4"
    case girl5 = "girl_5"
    case girl6 = "girl_6"
    case girl7 = "girl_7"
    case girl8 = "girl_8"
    case girl9 = "girl_9"
    
    var image: Image {
        Image(self.rawValue)
    }
    
    public var name: String {
        self.rawValue
    }
    
    public func getAvatar(name: String) -> Image {
        return Image(name)
    }
}

