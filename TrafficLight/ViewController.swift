//
//  ViewController.swift
//  TrafficLight
//
//  Created by Lex Koby on 31.07.2024.
//

import UIKit

enum TrafficLight {
    case red, yellow, green
}

final class ViewController: UIViewController {
    
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var startButton: UIButton! {
        didSet {
            if startButton.currentTitle == "START" {
                startButton.setTitle("NEXT", for: .normal)
            }
        }
    }
    
    private var trafficLight = TrafficLight.red
    private let lightOn = 1
    private let lightOff = 0.3
    // как было сказано в лекции, у меня 🤷‍♂️ не получилось в Storyboard настроить Alpha на прозрачность 0,3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 15
        
        redView.alpha = lightOff
        yellowView.alpha = lightOff
        greenView.alpha = lightOff
        
        redView.layer.cornerRadius = 75
        yellowView.layer.cornerRadius = 75
        greenView.layer.cornerRadius = 75
    }
    
    @IBAction func startNextButton() {
        
        switch trafficLight {
        case .red:
            greenView.alpha = lightOff
            redView.alpha = CGFloat(lightOn)
            trafficLight = .yellow
        case .yellow:
            redView.alpha = lightOff
            yellowView.alpha = CGFloat(lightOn)
            trafficLight = .green
        case .green:
            greenView.alpha = CGFloat(lightOn)
            yellowView.alpha = lightOff
            trafficLight = .red
            
        }
    }
}

