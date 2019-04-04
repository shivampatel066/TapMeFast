//
//  ViewController.swift
//  TapMeFast
//
//  Created by Shivam on 30/03/19.
//  Copyright © 2019 Shivam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var startGameButton: UIButton!
    
    var timer = Timer()
    var timerInt = 10
    var scoreInt = 0
    var gameInt = 0
    var tempScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timerInt = 10
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func startGame(_ sender: Any) {
        
        if timerInt == 10 {
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.5
            
        }
        if gameInt == 1 {
            scoreInt += 1
            scoreLabel.text = String(scoreInt)
            
        } else {
            timerInt = 10
            scoreInt = 0
            timeLabel.text = String("Time : \(timerInt)")
            scoreLabel.text = String(scoreInt)
            timeLabel.font = timeLabel.font.withSize(75)
            startGameButton.setTitle("Start", for: UIControl.State.normal)
        }
        
        
        
    }
    
    @objc func updateTimer()
    {
        timerInt -= 1
        timeLabel.text = String("Time : \(timerInt)")
        
        startGameButton.setTitle("Tap", for: UIControl.State.normal)
        
        gameInt = 1
        
        startGameButton.isEnabled = true
        startGameButton.alpha = 1
        
        if timerInt == 0 {
            timer.invalidate()
            tempScore = scoreInt
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.5
            
            startGameButton.setTitle("Restart", for: UIControl.State.normal)
            
            displayResult()
            
            Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(restart), userInfo: nil, repeats: false)
            
        }
        
    }
    
    @objc func restart() {
        gameInt = 0
        
        startGameButton.isEnabled = true
        startGameButton.alpha = 1
       
        
    }
    @objc func displayResult() {
        timeLabel.font = timeLabel.font.withSize(35)
        if tempScore > 50 {
            timeLabel.text = "Your Grade is A"
        } else if tempScore > 30 && tempScore < 51 {
            timeLabel.text = "Your Grade is B"
        } else if tempScore > 10 && tempScore < 31 {
            timeLabel.text = "Your Grade is C"
        } else {
            timeLabel.text = "You Failed! Try Again !!"
        }
        
    }
    
    

}

