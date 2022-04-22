//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Yusuf Aksu on 21.04.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!

    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: String = ""
    var numberOfPeople: Int = 0
    var tip: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingsLabel.text = "Split between \(numberOfPeople) people with \(tip)% tip"
        // Do any additional setup after loading the view.
    }
   
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
