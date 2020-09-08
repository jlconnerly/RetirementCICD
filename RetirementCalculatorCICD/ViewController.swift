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
    @IBOutlet weak var valueLabel: UILabel!
    
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

    @IBAction func calcRetButtonTapped(_ sender: UIButton) {
        guard let currentAge = ageTextField.text,
            let ageInt = Int(currentAge) else { return }
        guard let plannedAge = plannedRetAgeTextField.text,
            let plannedAgeInt = Int(plannedAge) else { return }
        let currentAgeString = String(ageInt)
        let plannedAgeString = String(plannedAgeInt)
        let properties = ["currentAge": currentAgeString,
                          "plannedAge": plannedAgeString]
        MSAnalytics.trackEvent("calculate_retirement_amount",withProperties: properties)
    }
    
}

