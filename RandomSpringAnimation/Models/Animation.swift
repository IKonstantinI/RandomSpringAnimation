//
//  Animation.swift
//  RandomSpringAnimation
//
//  Created by horze on 25.01.2024.
//

import UIKit

struct Animation {
    let preset: String
    let curve: String
    let force: CGFloat
    let duration: CGFloat
    let delay: CGFloat
    
    private static func createAnimation(preset: String, curve: String) -> Animation {
        return Animation(
            preset: preset,
            curve: curve,
            force: CGFloat.random(in: 0.3...3.0),
            duration: CGFloat.random(in: 0.3...3.0),
            delay: CGFloat.random(in: 0.1...1.0)
        )
    }
    
    static func getRandomAnimation() -> Animation? {
        guard let preset = DataStore.shared.animation.randomElement(),
              let curve = DataStore.shared.curves.randomElement() else {
            return nil
        }
        return createAnimation(preset: preset, curve: curve)
    }
}



