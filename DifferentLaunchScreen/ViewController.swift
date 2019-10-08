//
//  ViewController.swift
//  DifferentLaunchScreen
//
//  Created by 黃士軒 on 2019/10/7.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animation()
    }
    
    func getDeviceHour() -> Int {
        dateFormatter.dateFormat = "HH"
        return Int(dateFormatter.string(from: Date()))!
    }
    
    private func animation() {
        guard let launchScreen = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController() else {return}
        self.view.addSubview(launchScreen.view)
        
        if let image = launchScreen.view.viewWithTag(1) as? UIImageView {
            if getDeviceHour() >= 18 || getDeviceHour() < 7 {
                image.image = UIImage(named: "evening")
            } else {
                image.image = UIImage(named: "morning")
            }
        }
        
        if let label = launchScreen.view.viewWithTag(2) as? UILabel {
            if getDeviceHour() >= 18 || getDeviceHour() < 7 {
                label.text = "Good evening~~"
            } else {
                label.text = "Good morning~~"
            }
            UIView.animate(withDuration: 5,
                           delay: 2,
                           options: .curveEaseInOut,
                           animations: {
                            label.transform = CGAffineTransform(rotationAngle: .pi)
                            label.transform = .identity
                            launchScreen.view.alpha = 0
            }) { (finished) in
                launchScreen.view.removeFromSuperview()
            }
        }
    }
}

