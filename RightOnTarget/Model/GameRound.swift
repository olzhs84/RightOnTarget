//
//  GameRound.swift
//  RightOnTarget
//
//  Created by olzhs on 14.01.2022.
//

import Foundation

class GameRound: GameRoundProtocol {
    
    var score: Int = 0
    var currentSecretValue: Int {
        return Generator.getRandomValue()
    }
    
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }        
    }
    
}

protocol GameRoundProtocol {
    
    var score: Int { get }
    var currentSecretValue: Int { get }
    
    func calculateScore(with value: Int)
}
