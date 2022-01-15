//
//  ColorViewController.swift
//  RightOnTarget
//
//  Created by olzhs on 14.01.2022.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet var codeColorLabel: UILabel!
    
    var game: Game!
    var roundGame: GameRound!
    var randomNumber: Int?
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func chooseOption(_ sender: UIButton) {
        
        codeColorLabel.backgroundColor = view.backgroundColor
        
        if sender.tag == randomNumber! {
            codeColorLabel.backgroundColor = sender.backgroundColor
            roundGame.calculateScore(with: 1)
        }
        
        if game.isGameEnded {
            game.restartGame()
            showAlertWith(score: roundGame.score)
            roundGame.score = 0
        } else {
            game.startNewRound()
        }
        setVisual()
        
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundGame = GameRound(gameNumbers: false)
        game = Game(startValue: 1, endValue: 5)
        setVisual()
    }
    

    func setVisual() {
        randomNumber = GameRound(gameNumbers: false).currentSecretValue
        
        for elem in view.subviews {
            if let stackelem = elem as? UIStackView {
                stackelem.subviews[randomNumber!].backgroundColor = Generator.getRandomColor()
                codeColorLabel.text = stackelem.subviews[randomNumber!].backgroundColor?.hexString
                
                for buttonElement in stackelem.subviews.indices {
                    if buttonElement == randomNumber {
                        continue
                    }
                    stackelem.subviews[buttonElement].backgroundColor = Generator.getRandomColor()
                }
            }
        }
    }
    
    func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(score) очков", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
    }
    
    
}
