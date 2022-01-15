//
//  Game.swift
//  RightOnTarget
//
//  Created by olzhs on 13.01.2022.
//

import Foundation


class Game: GameProtocol {
    
//    var score: Int = 0
    private var minSecretValue: Int
    private var maxSecretValue: Int
//    var currentSecretValue: Int = 0
    
//    private var lastRound: Int
    private var currentRound: Int = 1
    
    
    
    var isGameEnded: Bool {
        if currentRound >= 5 {
            return true
        } else {
            return false
        }
    }
    
    init?(startValue: Int, endValue: Int) {
        
        guard startValue <= endValue else {
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
//        lastRound = rounds
//        currentSecretValue = self.getNewSecretValue()
        
    }
    
    func restartGame() {
        currentRound = 0
//        score = 0
        startNewRound()
    }
    
    func startNewRound() {
//        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    
//    private func getNewSecretValue() -> Int {
//        (minSecretValue...maxSecretValue).randomElement()!
//    }
    
//    func calculateScore(with value: Int) {
//        if value > currentSecretValue {
//            score += 50 - value + currentSecretValue
//        } else if value < currentSecretValue {
//            score += 50 - currentSecretValue + value
//        } else {
//            score += 50
//        }
//    }
    
}


protocol GameProtocol {
//    var score: Int { get }
//    var currentSecretValue:Int { get }
    var isGameEnded: Bool { get }
    
    func restartGame()
    
    func startNewRound()

//    func calculateScore(with value: Int)
    
    
}
