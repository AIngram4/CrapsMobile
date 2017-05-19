//    //
//    //  Gameplay.swift
//    //  CrapsMobile
//    //
//    //  Created by Andrew Ingram on 2017-05-18.
//    //  Copyright © 2017 Sabring. All rights reserved.
//    //
//
//    import Darwin
//    class Gameplay {
//        
//        private var roll = Int()
//        
//        private enum GameState {
//            case stillPlaying
//            case lost
//            case win
//        }
//
//        func rollDie() -> (Int, Int, Int) {
//            let die1 = Int(1 + arc4random_uniform(6))
//            let die2 = Int(1 + arc4random_uniform(6))
//            return (die1, die2, die1 + die2)
//            
//        }
//        
//        var roll = rollDie()
//
//        func displayRoll(roll:(Int, Int, Int)){
//            print("You rolled a \(roll.0) + \(roll.1) = \(roll.2)")
//
//        }
//
//        private var myPoint = 0
//        private var status = GameState.stillPlaying
//
//        displayRoll(roll: roll)
//
//        switch roll.2 {
//        case 7, 11:
//            status = GameState.win
//        case 2, 3, 12:
//            status = GameState.lost
//        default:
//            status = GameState.stillPlaying
//            myPoint = roll.2
//            print("Point is \(myPoint)")
//        }
//
//        while status == GameState.stillPlaying{
//            roll = rollDie()
//            displayRoll(roll: roll)
//            
//            if roll.2 == myPoint {
//                status = GameState.win
//            }else if roll.2 == 7 {
//                status = GameState.lost
//                
//            }
//        }
//
//        if status == GameState.win {
//            print("You win!")
//        }else if status == GameState.lost {
//            print("You lose!")
//        }
//    }
