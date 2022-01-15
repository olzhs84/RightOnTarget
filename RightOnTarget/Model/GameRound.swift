//
//  GameRound.swift
//  RightOnTarget
//
//  Created by olzhs on 14.01.2022.
//

import Foundation

class GameRound: GameRoundProtocol {
    
    var gameNumbers: Bool
    var score: Int = 0
    var currentSecretValue: Int {
        if gameNumbers {
            return Generator.getRandomValue(min: 1, max: 50)
        } else {
            return Generator.getRandomValue(min: 0, max: 3)
        }
    }
    
    init(gameNumbers: Bool) {
        self.gameNumbers = gameNumbers
    }
    
    func calculateScore(with value: Int) {
        if gameNumbers {
            if value > currentSecretValue {
                score += 50 - value + currentSecretValue
            } else if value < currentSecretValue {
                score += 50 - currentSecretValue + value
            } else {
                score += 50
            }
        } else {
            score += value
        }
    }
}

protocol GameRoundProtocol {
    
    var score: Int { get }
    var currentSecretValue: Int { get }
    
    func calculateScore(with value: Int)
}
