//
//  ViewController.swift
//  stopwatch
//
//  Created by GURWINDER SINGH on 1/26/19.
//  Copyright © 2019 GURWINDER SINGH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

var watchTimer = Timer()
    var currentTime = 0
    
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var second: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isHidden = true
        stopButton.isEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func start(_ sender: Any) {
        startButton.isHidden = true
        resetButton.isHidden = false
        stopButton.isEnabled = true
        
        watchTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTime)),userInfo: nil, repeats: true)
    }
    
    @IBAction func reset(_ sender: Any) {
        startButton.isHidden = false
        resetButton.isHidden = true
        
         watchTimer.invalidate()
    }
    
    @IBAction func stop(_ sender: Any) {
        resetButton.isHidden = true
        startButton.isHidden = false
        stopButton.isEnabled = false
        
        currentTime = 0
        timer.text = "0"
        second.text = "0"
        
        watchTimer.invalidate()
    }
    
    @objc func updateTime() {
        currentTime += 1
        timer.text = "\(currentTime / 60)"
        second.text = "\(currentTime % 60)"
        if currentTime == 3600 {
            currentTime = 0
        }
    }
    
}

