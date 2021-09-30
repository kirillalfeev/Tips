//
//  ViewController.swift
//  Tipsy
//
//  Created by Kirill Alfeev on 12.03.2021.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

let viewController1 = CalculatorViewController()

class CalculatorViewController: UIViewController {
    
    struct Constants {
        static let minimumValue = 1.0
        static let maximumValue = 20.0
    }
    
    @IBOutlet private var billTextField: UITextField?
    @IBOutlet private var zeroPctButton: UIButton?
    @IBOutlet private var tenPctButton: UIButton?
    @IBOutlet private var twentyPctButton: UIButton?
    @IBOutlet private var splitNumberLabel: UILabel?
    @IBOutlet private var stepper: UIStepper?
    
    private var model = Model()
    
    @IBAction func tipChanged(_ senderFunc: UIButton) {
        billTextField?.endEditing(true)
        var tip: Model.Tips = .zero
        var zeroPctButtonIsSelected = false
        if senderFunc == zeroPctButton {
            zeroPctButtonIsSelected = true
            tenPctButton?.isSelected = false
            twentyPctButton?.isSelected = false
        } else if senderFunc == tenPctButton {
            tenPctButton?.isSelected = true
            twentyPctButton?.isSelected = false
            tip = .tenPercent
        } else {
            tenPctButton?.isSelected = false
            twentyPctButton?.isSelected = true
            tip = .twentyPercent
        }
        zeroPctButton?.isSelected = zeroPctButtonIsSelected
        model.chageTip(tip)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.minimumValue = Constants.minimumValue
        sender.maximumValue = Constants.maximumValue
        let splitNumber = Int(sender.value)
        splitNumberLabel?.text = splitNumber.description
        model.splitNumberValue = splitNumber
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let billText = billTextField?.text, !billText.isEmpty {
            let bill = Double(billText) ?? 0
            let resultForOnePerson = model.resultForOnePerson(by: bill).description
            print(resultForOnePerson)
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? ResultsViewController
        destinationVC?.model = ResultsModel(peopleCount: model.splitNumberValue,
                                            tip: model.tip.formatedTip(),
                                            total: model.result)
    }
}
