//
//  ViewController.swift
//  RandomSpringAnimation
//
//  Created by horze on 25.01.2024.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    @IBOutlet var springView: SpringView!
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var animateButton: SpringButton!
    
    private var currentAnimation: Animation?
    private var nextAnimation: Animation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        springView.layer.cornerRadius = 10
        animateButton.setTitle("Run", for: .normal)
        nextAnimation = Animation.getRandomAnimation()
        currentAnimation = nextAnimation
        updateLabels()
    }
    
    @IBAction func startSpringAnimation(_ sender: SpringButton) {
        if let animation = nextAnimation {
            springView.animation = animation.preset
            springView.curve = animation.curve
            springView.force = animation.force
            springView.duration = animation.duration
            springView.delay = animation.delay
            springView.animate()
            
            currentAnimation = nextAnimation
            nextAnimation = Animation.getRandomAnimation()
            animateButton.setTitle("Run \(nextAnimation?.preset ?? "")", for: .normal)
            updateLabels()
        }
    }
    
    private func updateLabels() {
        if let animation = currentAnimation {
            presetLabel.text = "preset: \(animation.preset)"
            curveLabel.text = "curve: \(animation.curve)"
            forceLabel.text = "force: \(String(format: "%.2f", animation.force))"
            durationLabel.text = "duration: \(String(format: "%.2f", animation.duration))"
            delayLabel.text = "delay: \(String(format: "%.2f", animation.delay))"
        }
    }
}
