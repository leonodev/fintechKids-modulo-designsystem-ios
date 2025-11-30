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
    @State private var isPressed: Bool = false
    @State private var state: FHKButtonComponent.State = .enabled
    @State private var spacing = 0.0
    @Namespace var nameSpace
    @Namespace var nameSpace2
    @Namespace var nameSpaceMenu
    
    @State private var name = ""
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            //Slider
            Slider(value: $spacing, in: 0...80)
                .padding()
                .colorInvert()
            
            // Bottom Libary
            FHKButtonPrimary(mainTitle: "Primary Button",
                             state: $state,
                             style: .constant(.filled),
                             action: {
                
            })
            .padding()
            
            //Image Glass
            Image(systemName: "applelogo")
                .font(.system(size: 36))
                .frame(width: 80, height: 80)
                .glassEffect(.clear)
            
            //Image Regular Interactive
            Image(systemName: "applelogo")
                .font(.system(size: 36))
                .frame(width: 80, height: 80)
                .glassEffect(.regular.interactive())
            
            // Bottom Glass Interactive
            Button {
                
            } label: {
                Image(systemName: "applelogo")
                    .font(.system(size: 36))
                    .frame(width: 180, height: 80)
            }
            .buttonStyle(.plain)
            .glassEffect(.clear.interactive())
            
            
            // Bottom Glass size custom Interactive
            Button {
                
            } label: {
                Text("Button Glass")
                    .font(.system(size: 28))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 48)
            }
            .buttonStyle(.plain)
            .glassEffect(.clear.interactive())
            .padding()
            
            //Group
            GlassEffectContainer {
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
                    
                    // tambien se podria agrupar asi:
                    /*
                     Group {
                     Image(systemName: "cloud.bolt.rain.fill")
                     .font(.system(size: 36))
                     .frame(width: 80, height: 80)
                     .glassEffect()
                     
                     
                     Image(systemName: "sun.rain.fill")
                     .font(.system(size: 36))
                     .frame(width: 80, height: 80)
                     .glassEffect()
                     
                     }
                     .glassEffectUnion(id: 2, namespace: nameSpace)
                     */
                }
            }
                
                // Menu Interactivo And TextField
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Image.background
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    VStack {
        ContentView()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        Image.background
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
    .ignoresSafeArea()
}
