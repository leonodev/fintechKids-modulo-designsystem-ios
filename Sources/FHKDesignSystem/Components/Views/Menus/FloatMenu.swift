//
//  FloatMenu.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 20/1/26.
//

import SwiftUI
import Algorithms

public struct FloatMenu: View {
    public struct Option {
        var image: Image
        var color: Color
        
        public init(image: Image, color: Color) {
            self.image = image
            self.color = color
        }
    }
    
    let iconDiameter: Double = 70
    let menuDiameter: Double = 200
    let options: [FloatMenu.Option]
    @State var isOpen = false
    let callback: (Int) -> Void
    
    public init(options: [FloatMenu.Option],
                isOpen: Bool = false,
                callback: @escaping (Int) -> Void
    ) {
        self.options = options
        self.isOpen = isOpen
        self.callback = callback
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.indigo).opacity(0.1)
                .frame(width: isOpen ? menuDiameter : 0)
            
            ForEach(options.indexed(), id: \.index) { index, option in
                button(option: option, atIndex: index)
                    .scaleEffect(isOpen ? 1 : 0.1)
            }
            .disabled(!isOpen)
            
            MainMenu(iconDiameter: iconDiameter, isOpen: $isOpen)
        }
    }
    
    func button(option: Option, atIndex index: Int) -> some View {
        let angle = .pi / 4 * Double(index) - .pi * (isOpen ? 0.6 : 1)
        let radious = menuDiameter / 2
        
        return Button(action: {
            callback(index)
        }) {
            ZStack {
                Circle()
                    .foregroundColor(option.color)
                    .frame(width: 55, height: 55)
                option.image
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
        .offset(x: cos(angle) * radious, y: sin(angle) * radious)
    }
}

public extension FloatMenu {
    
    struct MainMenu: View {
        let iconDiameter: Double
        @Binding var isOpen: Bool
        
        public var body: some View {
            Button {
                withAnimation {
                    isOpen.toggle()
                }
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(.indigo)
                        .frame(width: iconDiameter, height: iconDiameter)
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.title)
                        .rotationEffect(isOpen
                                        ? .degrees(45)
                                        : .degrees(0))
                }
            }
        }
    }
}

#Preview {
    var options: [FloatMenu.Option] = [
        .init(image: .init(systemName: "person.crop.circle.badge.plus"), color: .purple),
        .init(image: .init(systemName: "note.text.badge.plus"), color: .pink),
        .init(image: .init(systemName: "questionmark.circle.dashed"), color: .gray),
        .init(image: .init(systemName: "questionmark.circle.dashed"), color: .gray),
        .init(image: .init(systemName: "questionmark.circle.dashed"), color: .gray)
    ]
    VStack {
        FloatMenu(options: options, callback: { index in
            print(index)
        })
    }
}
