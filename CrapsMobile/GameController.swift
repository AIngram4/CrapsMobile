//
//  GameController.swift
//  CrapsMobile
//
//  Created by Andrew Ingram on 2017-05-18.
//  Copyright © 2017 Sabring. All rights reserved.
//

import Foundation
import Darwin
import AVFoundation
import UIKit

class GameController: NSObject {
    
    
    enum GameState {
        case stillPlaying, lost, win
    }
    
    var status = GameState.stillPlaying
    var myPoint = 0
    var vc: ViewController!
    var isFirstRoll = true
    var roll = (0,0,0)
    var rollDiceSound : AVAudioPlayer!
    
    init(vc: ViewController) {
        self.vc = vc
    }
    
    func preparePlaySound() {
        let path = Bundle.main.path(forResource: "dice", ofType: "mp3")
        let soundUrl = URL(fileURLWithPath: path!)
        
        do {
            try rollDiceSound = AVAudioPlayer(contentsOf: soundUrl)
            rollDiceSound.prepareToPlay()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }

    }
    
    func playSound() {
        preparePlaySound()
        if rollDiceSound.isPlaying {
            rollDiceSound.stop()
            
        }
        rollDiceSound.play()
    }
    
    func chooseImage() {
        
        switch roll.0 {
        case 1:
            vc.firstDieImage.image = UIImage(named:"one")
            
        case 2:
            vc.firstDieImage.image = UIImage(named:"two")
            
        case 3:
            vc.firstDieImage.image = UIImage(named:"three")
            
        case 4:
            vc.firstDieImage.image = UIImage(named:"four")
            
        case 5:
            vc.firstDieImage.image = UIImage(named:"five")
            
        case 6:
            vc.firstDieImage.image = UIImage(named:"six")
            
        default:
            vc.firstDieImage.image = nil
            
            
        }
        
        switch roll.1 {
        case 1:
            vc.secondDieImage.image = UIImage(named:"one")
            
        case 2:
            vc.secondDieImage.image = UIImage(named:"two")
            
        case 3:
            vc.secondDieImage.image = UIImage(named:"three")
            
        case 4:
            vc.secondDieImage.image = UIImage(named:"four")
            
        case 5:
            vc.secondDieImage.image = UIImage(named:"five")
            
        case 6:
            vc.secondDieImage.image = UIImage(named:"six")
            
        default:
            vc.secondDieImage.image = nil
            
            
        }
    }
    
    func rollDie() -> (Int, Int, Int) {
        let die1 = Int(1 + arc4random_uniform(6))
        let die2 = Int(1 + arc4random_uniform(6))
        playSound()
        return(die1, die2, die1+die2)
    }
    
    func processRoll(roll:(Int, Int, Int)) {
        switch roll.2 {
        case 7, 11:
            status = GameState.win
        case 2, 3, 12:
            status = GameState.lost
        default:
            status = GameState.stillPlaying
            myPoint = roll.2
        }

        
    }
    
    func restartGame() {
        myPoint = 0
        vc.pointLabel.text = ""
        vc.firstLabel.text = "Press Roll to Start"
        vc.rollButton.setTitle("Roll", for: .normal)
        status = GameState.stillPlaying
        isFirstRoll = true
        vc.firstDieImage.image = nil
        vc.secondDieImage.image = nil
        roll = (0,0,0)
    }
    
    
    func checkGameStatus() {
        if status == GameState.win {
            vc.firstLabel.text = "You rolled a \(roll.0) + \(roll.1) = \(roll.2) , you win!"
            vc.rollButton.setTitle("Play Again", for: .normal)
        } else if status == GameState.lost {
            vc.firstLabel.text = "You rolled a \(roll.0) + \(roll.1) = \(roll.2) , you lose."
            vc.rollButton.setTitle("Play Again", for: .normal)
        }else if status == GameState.stillPlaying && isFirstRoll{
            vc.firstLabel.text = "You rolled a \(roll.0) + \(roll.1) = \(roll.2) , roll again!"
            vc.pointLabel.text = "\(myPoint)"
            isFirstRoll = false
        } else {
            vc.firstLabel.text = "You rolled a \(roll.0) + \(roll.1) = \(roll.2) , roll again!"
            
        }
    }
    
    func gamePlay() {
        
        if status == GameState.win || status == GameState.lost {
            restartGame()
        } else {
        
            if isFirstRoll {
                roll = rollDie()
                processRoll(roll: roll)
            } else {
                roll = rollDie()
                if roll.2 == myPoint {
                   status = GameState.win
                } else if roll.2 == 7 {
                    status = GameState.lost
                }
                
            }
            
            checkGameStatus()
        
        }
    }
}













