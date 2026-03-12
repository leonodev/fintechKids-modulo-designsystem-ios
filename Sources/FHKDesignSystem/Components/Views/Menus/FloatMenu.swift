//
//  FloatMenu.swift
//  FHKDesignSystem
//
//  Created by Fredy Leon on 20/1/26.
//

import SwiftUI
import Algorithms

public struct FloatMenu: View {
    public enum OptionType {
        case members
        case tasks
        case goals
        case rewards
    }
    
    public struct Option {
        var title: String
        var image: Image
        var color: Color
        var menuType: OptionType
        
        public init(title: String, image: Image, color: Color, menuType: OptionType) {
            self.title = title
            self.image = image
            self.color = color
            self.menuType = menuType
        }
    }
    
    let iconDiameter: Double = 70
    let menuDiameter: Double = 200
    let options: [FloatMenu.Option]
    @State var isOpen = false
    let callback: (OptionType) -> Void
    
    public init(options: [FloatMenu.Option],
                isOpen: Bool = false,
                callback: @escaping (OptionType) -> Void
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
            withAnimation(.spring()) {
                isOpen = false // close menu
            }
            callback(option.menuType)
        }) {
            ZStack {
                Circle()
                    .foregroundColor(option.color)
                    .frame(width: 55, height: 55)
                VStack {
                    option.image
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.top, FHKSpace.space08)
                    
                    Text(option.title)
                        .foregroundColor(.white)
                        .font(.PangramSans.bold(FHKSize.size12))
                        
                }
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
    PreviewContainer {
        let options: [FloatMenu.Option] = [
            .init(title: "One",
                  image: .init(systemName: "person.crop.circle.badge.plus"),
                  color: .purple,
                  menuType: .members),
            
            
            .init(title: "Two",
                  image: .init(systemName: "note.text.badge.plus"),
                  color: .pink,
                  menuType: .tasks),
            
            .init(title: "Three",
                  image: .init(systemName: "questionmark.circle.dashed"),
                  color: .gray,
                  menuType: .goals),
            
            
            .init(title: "Four",
                  image: .init(systemName: "questionmark.circle.dashed"),
                  color: .gray,
                  menuType: .rewards)
        ]
        VStack {
            FloatMenu(options: options, callback: { index in
                print(index)
            })
        }
    }
}
