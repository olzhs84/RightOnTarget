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
    var round: Int = 1
    // сумма очков за раунд
    var points: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
//        self.number = Int.random(in: 1...50)
//        self.label.text = String(self.number)
        getNumber()
        
    }

    @IBAction func checkNumber() {
        
        self.chosenValue.text = String(self.slider.value.rounded())
        
            
            let numSlider = Int(self.slider.value.rounded())
            
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number
            } else if numSlider < self.number {
                self.points += 50 - self.number + numSlider
            } else {
                self.points += 50
            }
            
            if self.round == 5 {
                let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.round = 1
                self.points = 0
                chosenValue.text = nil
            } else {
                self.round += 1
            }
            
            getNumber()
//            self.label.text = String(self.number)
            
        
        
        
        
    }
    
    func getNumber() {
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
    }
    
}

