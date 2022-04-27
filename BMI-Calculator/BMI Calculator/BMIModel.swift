import UIKit
struct BMIModel {
    var bmi: BMI?
    
    mutating func calculateBMI(_ weight: Float, _ height: Float){
        let bmiVal = Double(weight) / pow(Double(height), 2)
        setAdvice(bmiVal)
    }
    
    mutating func setAdvice(_ bmiValue: Double){
        if bmiValue < 18.5 {
            bmi = BMI(bmiValue: bmiValue, advice: "Need to increase food intake", colour: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        }else if bmiValue < 25.5 {
            bmi = BMI(bmiValue: bmiValue, advice: "Ship-shape fitness", colour: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
            return
        }else {
            bmi = BMI(bmiValue: bmiValue, advice: "Get on a diet", colour: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        }
    }
    
    func getBMI() -> Double {
        return bmi?.bmiValue ?? 0.0
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice found"
    }
    
    func getColor() -> UIColor {
        return bmi?.colour ?? UIColor.clear
    }
}
