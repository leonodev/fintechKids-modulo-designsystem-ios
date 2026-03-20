//
//  LottieView.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 14/12/25.
//

import SwiftUI
import Lottie

public enum LottieLoop {
    case loop
    case playOnce
    case autoReverse
    case `repeat`(number: Float)
    case repeatBackwards(number: Float)
    
    public func mode() -> LottieLoopMode {
        switch self {
        case .loop:
            return .loop
        case .playOnce:
            return .playOnce
        case .autoReverse:
            return .autoReverse
        case let .repeat(number):
            return .repeat(number)
        case let .repeatBackwards(number):
            return .repeatBackwards(number)
        }
    }
}

public struct LottieView: UIViewRepresentable {
    let animationName: String
    var loopMode: LottieLoop
    var contentMode: UIView.ContentMode
    
    public init(animationName: String,
                loopMode: LottieLoop = .loop,
                contentMode: UIView.ContentMode = .scaleAspectFit
    ) {
        self.animationName = animationName
        self.loopMode = loopMode
        self.contentMode = contentMode
    }
    
    public func makeUIView(context: Context) -> UIView {
        let view = UIView()
        
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named(animationName, bundle: .module)
        animationView.contentMode = contentMode
        animationView.loopMode = loopMode.mode()
        animationView.animationSpeed = 1.5
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {}
}
