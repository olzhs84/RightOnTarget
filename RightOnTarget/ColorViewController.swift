//
//  ColorViewController.swift
//  RightOnTarget
//
//  Created by olzhs on 14.01.2022.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet var codeColorLabel: UILabel!
    
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func chooseOption(_ sender: UIButton) {
    
    
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        codeColorLabel.backgroundColor = Generator.getRandomColor()
//        let color = codeColorLabel.backgroundColor?.hexString
        setVisual()
    }
    

    func setVisual() {
        codeColorLabel.text = Generator.getRandomColor().hexString
        
    }
    
}
