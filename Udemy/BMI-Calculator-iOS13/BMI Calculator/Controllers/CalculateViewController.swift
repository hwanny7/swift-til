//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLablel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBAction func highSliderChanged(_ sender: UISlider) {
        let nextValue = calculatorBrain.heightChanged(sender.value)
        heightLablel.text = nextValue + "m"
    }
    
    @IBAction func weighSliderChanged(_ sender: UISlider) {
        let nextValue = calculatorBrain.weightChanged(sender.value)
        weightLabel.text = nextValue + "Kg"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.makeBmiValue(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue
            destinationVC.advanceValue = calculatorBrain.getAdvice
            destinationVC.colorValue = calculatorBrain.getColor
        }
    }
    
    
}

