//
//  ViewController.swift
//  Stopwatch
//
//  Created by Maxim Vladysik on 11/23/16.
//  Copyright © 2016 Maxim Vladysik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var minutes: Int = 0
    var seconds: Int = 0
    var milliseconds: Int = 0
    var stopwatchString: String = ""
    
    @IBOutlet weak var stopwatchLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.isHidden = false
        stopButton.isHidden = true
        
        startButton.layer.cornerRadius = startButton.frame.size.height / 2
        stopButton.layer.cornerRadius = startButton.frame.size.height / 2
        resetButton.layer.cornerRadius = resetButton.frame.size.height / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timerUpdate() {
    
        milliseconds += 1
        
        if milliseconds == 100 {
        
            seconds += 1
            milliseconds = 0
        }
        
        if seconds == 60 {
        
            minutes += 1
            seconds = 0
        }
        
        let millisecondsString = milliseconds > 9 ? "\(milliseconds)" : "0\(milliseconds)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        stopwatchString = "\(minutesString):\(secondsString).\(millisecondsString)"
        stopwatchLabel.text = stopwatchString
    }

// MARK: - Actions
    
    @IBAction func startButtonAction(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(ViewController.timerUpdate),
                                     userInfo: NSDate(),
                                     repeats: true)
        
        startButton.isHidden = true
        stopButton.isHidden = false
    }

    @IBAction func stopButtonAction(_ sender: Any) {
        
        timer.invalidate()
        
        startButton.isHidden = false
        stopButton.isHidden = true
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        
        milliseconds = 0
        seconds = 0
        minutes = 0
        
        stopwatchString = "00:00.00"
        stopwatchLabel.text = stopwatchString
    }
}

