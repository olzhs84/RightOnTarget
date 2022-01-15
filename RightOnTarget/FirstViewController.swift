//
//  FirstViewController.swift
//  RightOnTarget
//
//  Created by olzhs on 14.01.2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    lazy var viewControllerColor: ColorViewController = getViewController(with: "viewControllerColor") as! ColorViewController
    lazy var viewControllerNumbers: ViewController = getViewController(with: "viewControllerNumbers") as! ViewController

    private func getViewController(with name: String) -> Any {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: name)
        if name == "viewControllerColor" {
            return viewController as! ColorViewController
        } else {
            return viewController as! ViewController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func chooseColorGame(_ sender: UIButton) {
        self.present(viewControllerColor, animated: true, completion: nil)
    }
    
    @IBAction func chooseNumbersGame(_ sender: UIButton) {
        self.present(viewControllerNumbers, animated: true, completion: nil)
    }
    
    
    
    
    
    
}
