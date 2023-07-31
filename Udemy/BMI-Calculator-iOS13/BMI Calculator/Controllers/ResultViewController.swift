//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by yun on 2023/07/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var advanceLabel: UILabel!
    var bmiValue: String?
    var advanceValue: String?
    var colorValue: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        advanceLabel.text = advanceValue
        view.backgroundColor = colorValue
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    } 
}
