//
//  ViewController.swift
//  RightOnTarget
//
//  Created by olzhs on 06.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var chosenValue: UILabel!
    
    
    
    // загаданное число
    var number: Int = 0
    // раудн
//    var round: Int = 1
    // сумма очков за раунд
    var points: Int = 0
    // classes
    var game: Game!
    var roundGame: GameRound!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        game = Game(startValue: 1, endValue: 50)
        roundGame = GameRound()
        self.label.text = String(roundGame.currentSecretValue)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: Model
    
    @IBAction func checkNumber() {
            
        let numSlider = Int(self.slider.value.rounded())

        roundGame.calculateScore(with: numSlider)
    
        if game.isGameEnded {
            showAlertWith(score: roundGame.score)
            game.restartGame()
            roundGame = GameRound()
        } else {
            game.startNewRound()
        }

        updateLabelWithSecretNumber(newText: String(roundGame.currentSecretValue), choosenText: String(numSlider))
    }
    
    // MARK: refresh View
    
    func updateLabelWithSecretNumber(newText: String, choosenText: String) {
        label.text = newText
        chosenValue.text = choosenText
    }
    
    func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(score) очков", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        chosenValue.text = nil
    }

    
}

