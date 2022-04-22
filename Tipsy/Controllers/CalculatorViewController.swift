//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var amount = 0.0
    var result = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
            
        sender.isSelected = true
       
        let buttonTitle = sender.currentTitle
        
        let buttonTitleWithoutPercent = buttonTitle?.dropLast()
        
        let buttonTitleAsANumber = Double(buttonTitleWithoutPercent!)
        
        tip = buttonTitleAsANumber! / 100
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        amount = Double(billTextField.text!)!
        
        let totalPricePerPerson = (amount + (amount * tip)) / Double(numberOfPeople)
        
        result = String(format: "%.2f", totalPricePerPerson)
        self.performSegue(withIdentifier: "goToResult" , sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = result
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.tip = Int(tip * 100)
        }
    }
}

