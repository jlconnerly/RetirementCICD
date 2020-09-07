//
//  ViewController.swift
//  RetirementCalculatorCICD
//
//  Created by Jake Connerly on 9/7/20.
//  Copyright © 2020 jake connerly. All rights reserved.
//

import UIKit
import AppCenterCrashes

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
    }

    @IBAction func calcRetButtonTapped(_ sender: UIButton) {
        MSCrashes.generateTestCrash()
    }
    
}

