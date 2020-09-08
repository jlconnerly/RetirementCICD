//
//  ViewController.swift
//  RetirementCalculatorCICD
//
//  Created by Jake Connerly on 9/7/20.
//  Copyright © 2020 jake connerly. All rights reserved.
//

import UIKit
import AppCenterCrashes
import AppCenterAnalytics

class ViewController: UIViewController {

    @IBOutlet weak var monthlyInvTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var plannedRetAgeTextField: UITextField!
    @IBOutlet weak var interestRateTextField: UITextField!
    @IBOutlet weak var currentSavingsTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if MSCrashes.hasCrashedInLastSession() {
            let alert = UIAlertController(title: "Oops", message: "Sorry about that, an error has occured.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "It's OK... I guess...", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        MSAnalytics.trackEvent("navigated_to_calculator")
    }
    
    func calulateRetirementAmount(currentAge: Int, retirementAge: Int, monthlyInvestment: Float, currentSavings: Float, interestRate: Float) -> Double {
        let monthsUnitRetirement = (retirementAge - currentAge) * 12
        var retirementAmount = Double(currentSavings) * pow(Double(1+interestRate/100), Double(monthsUnitRetirement))
        return retirementAmount
    }

    @IBAction func calcRetButtonTapped(_ sender: UIButton) {
        //current age
        guard let currentAge = ageTextField.text,
            let ageInt = Int(currentAge) else { return }
        let currentAgeString = String(ageInt)
        //planned age
        guard let plannedAge = plannedRetAgeTextField.text,
            let plannedAgeInt = Int(plannedAge) else { return }
        let plannedAgeString = String(plannedAgeInt)
        // monthly investment
        guard let monthlyInvestment = Float(monthlyInvTextField.text!) else { return }
        // current savings
        guard let currentSavings = Float(currentSavingsTextField.text!) else { return }
        // interest rate
        guard let interestRate = Float(interestRateTextField.text!) else { return }
        
        let retirementAmount = calulateRetirementAmount(currentAge: ageInt, retirementAge: plannedAgeInt, monthlyInvestment: monthlyInvestment, currentSavings: currentSavings, interestRate: interestRate)
        let properties = ["currentAge": currentAgeString,
                          "plannedAge": plannedAgeString]
        MSAnalytics.trackEvent("calculate_retirement_amount",withProperties: properties)
        resultLabel.text = "If you save $\(monthlyInvestment) every month for \(plannedAgeInt - ageInt) years, and invest that money plus your current investment of \(currentSavings) at a \(interestRate)% annual interest rate, you will have $\(retirementAmount) by the time you are \(plannedAgeString)."
        
    }
    
}

