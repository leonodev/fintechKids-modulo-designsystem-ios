//
//  ContentView.swift
//  FHKDesignSystemDemo
//
//  Created by Fredy Leon on 15/11/25.
//

import SwiftUI
import FHKDesignSystem

/* GlassEffectContainer: Cuando se tiene un grupo de botones o iconos con el efecto Liquid Glass (ej. en una barra de herramientas o un menú de acciones flotante) y se quiere que sus formas se fusionen en un solo sitio de vidrio al estar quietos, o se separen/morfoseen durante las transiciones (como al aparecer o desaparecer) */

/* @Namespace actúa como un ámbito que agrupa todas las vistas que participan en ese conjunto específico de animaciones, En resumen, utiliza @Namespace cuando necesites que una vista parezca que se mueve y se transforma fluidamente de una posición/contenedor a otra en tu interfaz */

/*
 El uso principal de glassEffectID() es hacer que dos o más áreas de Liquid Glass se comporten como una sola en términos de ciertas propiedades dinámicas.

 Ejemplo: Si tienes dos tarjetas separadas con .glassEffect(), pero quieres que el brillo dinámico o la refracción que reacciona al movimiento del dispositivo (inclinación) sea idéntica y sincronizada entre ellas, les asignas el mismo glassEffectID.
 */


struct ContentView: View {
    let items = ["Glass Style", "Solid Styles", "Lotties"]
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                // 1. Background primero
                Image.backgroundDemo
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                // 2. List con transparencia
                List(items, id: \.self) { item in
                    
                    switch item {
                    case items[0]:
                        NavigationLink(destination: GlassView(title: item)) {
                            Text(item)
                                .font(.body)
                                .foregroundColor(FHKColor.textColorEnabled)
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        
                    case items[1]:
                        NavigationLink(destination: EmptyView()) {
                            Text(item)
                                .font(.body)
                                .foregroundColor(FHKColor.textColorEnabled)
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        
                    case items[2]:
                        NavigationLink(destination: LottiesView()) {
                            Text(item)
                                .font(.body)
                                .foregroundColor(FHKColor.textColorEnabled)
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        
                    default:
                        EmptyView()
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .navigationTitle("Menú Principal")
            }
        }
    }
}
    
struct GlassView: View {
    let title: String
    let items = ["Bottoms", "Slider", "Images", "Containers"]
    
    var body: some View {
        ZStack {
            
            Image.backgroundDemo
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            
            List(items, id: \.self) { item in
     
                NavigationLink {
                    
                    switch item {
                    case "Bottoms":
                        BottonsView(title: item)
                        
                    case "Slider":
                        SliderView(title: item)
                        
                    case "Images":
                        ImagesView(title: item)
                        
                    case "Containers":
                        ContainersView(title: item)
                        
                    default:
                        Text("Vista no encontrada para: \(item)")
                    }
                } label: {
                    Text(item)
                        .font(.body)
                        .foregroundColor(FHKColor.textColorEnabled)
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
            .scrollContentBackground(.hidden)
            .background(Color.clear)
            .navigationTitle("Example Glass")
        }
    }
}
    
struct BottonsView: View {
    let title: String
    
    var body: some View {
        VStack {
            ScrollView {
                FHKButtonPrimary(title: "Button Primary",
                                 state: .enabled,
                                 mode: .glass(.clear),
                                 action: {
                    
                })
                .padding()
                
                //------------------------------
                Button {
                
                } label: {
                Image(systemName: "applelogo")
                .font(.system(size: 36))
                .frame(width: 180, height: 80)
                }
                .buttonStyle(.plain)
                .glassEffect(.clear.interactive())
                
                
            }
            .applyBackgroundDemoModifier()
            .navigationTitle("Buttons")
        }
    }
}

struct SliderView: View {
    let title: String
    @State private var spacing = 0.0
    
    var body: some View {
        VStack {
            ScrollView {
                Slider(value: $spacing, in: 0...80)
                .padding()
            }
            .applyBackgroundDemoModifier()
            .navigationTitle("Sliders")
        }
    }
}

struct ImagesView: View {
    let title: String
    
    var body: some View {
        VStack {
            ScrollView {
                //Image Glass
                Image(systemName: "applelogo")
                .font(.system(size: 36))
                .frame(width: 80, height: 80)
                .glassEffect(.clear)
                
                
                Image(systemName: "applelogo")
                .font(.system(size: 36))
                .frame(width: 80, height: 80)
                .glassEffect(.regular.interactive())
            }
            .applyBackgroundDemoModifier()
            .navigationTitle("Images")
        }
    }
}

struct ContainersView: View {
    @Namespace var nameSpace
    @Namespace var nameSpace2
    @Namespace var nameSpaceMenu
    
    let title: String
    
    @State private var isExpanded = false
    @State private var name = ""
    
    var body: some View {
        VStack {
            ScrollView {
                //Image Glass
                GlassEffectContainer {
                    
                    VStack {
                        
                        HStack {
                        Image(systemName: "cloud.bolt.rain.fill")
                            .font(.system(size: 36))
                            .frame(width: 80, height: 80)
                            .glassEffect()
                            .glassEffectUnion(id: 1, namespace: nameSpace)
                        
                        Image(systemName: "sun.rain.fill")
                            .font(.system(size: 36))
                            .frame(width: 80, height: 80)
                            .glassEffect()
                            .glassEffectUnion(id: 1, namespace: nameSpace)
                        
                        Image(systemName: "cloud.bolt.rain.fill")
                            .font(.system(size: 36))
                            .frame(width: 80, height: 80)
                            .glassEffect()
                            .glassEffectUnion(id: 2, namespace: nameSpace)
                        
                        Image(systemName: "sun.rain.fill")
                            .font(.system(size: 36))
                            .frame(width: 80, height: 80)
                            .glassEffect()
                            .glassEffectUnion(id: 2, namespace: nameSpace)
                        }
                        
                        HStack {
                            Group {
                                Image(systemName: "cloud.bolt.rain.fill")
                                    .font(.system(size: 36))
                                    .frame(width: 80, height: 80)
                                    .glassEffect()
                                    .glassEffectUnion(id: 3, namespace: nameSpace2)
                                
                                
                                Image(systemName: "sun.rain.fill")
                                    .font(.system(size: 36))
                                    .frame(width: 80, height: 80)
                                    .glassEffect()
                                    .glassEffectUnion(id: 3, namespace: nameSpace2)
                                
                            }
                            
                        }
                    }
                }
                
                
                GlassEffectContainer {
                    HStack {
                        Image(systemName: "photo")
                            .font(.system(size: 36))
                            .frame(width: 80, height: 80)
                            .glassEffect(.regular.tint(.teal.opacity(0.4)).interactive())
                            .glassEffectID("photo", in: nameSpaceMenu)
                            .onTapGesture {
                                withAnimation(.linear(duration: 0.5)) {
                                    isExpanded .toggle()
                                }
                            }
                        
                        if isExpanded {
                            Group {
                                Image(systemName: "building.2")
                                    .font(.system(size: 36))
                                    .frame(width: 80, height: 80)
                                    .glassEffectID("building", in: nameSpaceMenu)
                                
                                Image(systemName: "fish")
                                    .font(.system(size: 36))
                                    .frame(width: 80, height: 80)
                                    .glassEffectID("fish", in: nameSpaceMenu)
                                
                            }
                            .glassEffect()
                            .glassEffectUnion(id: 1, namespace: nameSpaceMenu)
                            .glassEffectTransition(.matchedGeometry)
                        }
                    }
                    
                    // TextField
                    HStack {
                        
                        if isExpanded {
                            TextField("Name", text: $name)
                                .padding()
                                .glassEffect()
                                .glassEffectID("text", in: nameSpaceMenu)
                                .glassEffectTransition(.matchedGeometry)
                        }
                        
                        
                        Image(systemName: isExpanded ? "checkmark" : "plus")
                            .font(.system(size: 36))
                            .frame(width: 70, height: 70)
                            .glassEffect(.regular.interactive())
                            .glassEffectID("plus", in: nameSpaceMenu)
                            .contentTransition(.symbolEffect(.replace.magic(fallback: .replace))) // Efecto de animacion del icono
                            .onTapGesture {
                                withAnimation {
                                    isExpanded.toggle()
                                }
                            }
                    }
                    .padding()
                }
            }
            .applyBackgroundDemoModifier()
            .navigationTitle("Images")
        }
    }
}

struct LottiesView: View {
    
    var body: some View {
        VStack {
            LottieView(animationName: Lotties.loading,
                        loopMode: .loop,
                        contentMode: .scaleAspectFit)
            .frame(height: 198)
        }
    }
}

#Preview {
    VStack {
        LottiesView()
    }
    .applyBackgroundDemoModifier()
}
