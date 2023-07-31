
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    var getBMIValue: String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    var getAdvice: String {
        return bmi?.advice ?? "Error"
    }
    
    var getColor: UIColor {
        return bmi?.color ?? UIColor.black
    }
    
    func heightChanged(_ value: Float) -> String {
        return String(format: "%.2f", value)
    }
    
    func weightChanged(_ value: Float) -> String {
        return String(format: "%.0f", value)
    }
    
    mutating func makeBmiValue(height: Float, weight: Float) -> Void {
        let bmiValue = weight / pow(height, 2)
        
        switch bmiValue {
        case ..<18.5 :
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.blue)
        case 18.5...24.9 :
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.green)
        case 25... :
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor.yellow)
        default:
            break
        }
    }
    
}
