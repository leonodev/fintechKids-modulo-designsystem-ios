//
//  LottieView.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 14/12/25.
//

import SwiftUI
import Lottie

public struct LottieView: UIViewRepresentable {
    let animationName: String
    var loopMode: LottieLoopMode
    var contentMode: UIView.ContentMode
    
    public init(animationName: String, loopMode:
                LottieLoopMode = .loop,
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
        animationView.loopMode = loopMode
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
