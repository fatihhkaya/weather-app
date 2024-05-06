//
//  SkeletonBlink.swift
//  bulutsystem
//
//  Created by Fatih on 4.05.2024.
//

import SwiftUI

struct BlinkViewModifier: ViewModifier {
    let duration: Double
    @State private var blinking: Bool = false

    func body(content: Content) -> some View {
        content
            .opacity(blinking ? 0.3 : 1)
            .animation(.smooth(duration: duration).repeatForever(), value: blinking)
            .onAppear {
                // Animation will only start when blinking value changes
                blinking.toggle()
            }
    }
}

extension View {
    func blinking(duration: Double = 1) -> some View {
        modifier(BlinkViewModifier(duration: duration))
    }
}
#Preview {
    BlinkViewModifier(duration: 0.2) as! any View
}
