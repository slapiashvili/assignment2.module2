//
//  ViewController.swift
//  assignment2.module2
//
//  Created by Salome Lapiashvili on 23.10.23.
//

import UIKit

class ViewController: UIViewController {
    
    
    //lifecycle: view controller's view is loaded into the memory, first-time setup:
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //our outlets are created, two labels and two text fields:
    
    @IBOutlet weak var lcdLabel: UILabel!
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    //creating a method for what we display when the switch is on and off. The display shows on the lcdLabel
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            lcdLabel.text = "GCF"
        } else {
            lcdLabel.text = "LCM"
        }
    }
    
    //creating a method for calculate button to get text, which is green by default and turns red if input is invalid. It also performs the necessary functions according to which display we have in lcdLabel.
    
    @IBAction func calculateButton(_ sender: Any) {
        guard let number1 = Int(text1.text ?? ""),
              let number2 = Int(text2.text ?? "") else {
            text1.textColor = .red
            text2.textColor = .red
            return
        }
        
        text1.textColor = .green
        text2.textColor = .green
        
        if lcdLabel.text == "GCF" {
            resultLabel.text = "\(gcf(a: number1, b: number2))"
        } else {
            resultLabel.text = "\(lcm(a: number1, b: number2))"
        }
    }
    
    
    //respective functions for calculating GCF and LCM:
    func gcf(a: Int, b: Int) -> Int {
        var firstEntered = a
        var secondEntered = b
        while secondEntered != 0 {
            let temp = secondEntered
            secondEntered = firstEntered % secondEntered
            firstEntered = temp
        }
        return firstEntered
    }
    
    func lcm(a: Int, b: Int) -> Int {
        return (a * b) / gcf(a: a, b: b)
    }
}
