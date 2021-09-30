//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Kirill Alfeev on 12.03.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    struct Constants {
        static let split = "Split between "
        static let peopleWith = " people, with "
    }
    
    var model: ResultsModel?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = model?.total.description
        let peopleCountDescription = model?.peopleCount.description ?? ""
        let tip = model?.tip.description ?? ""
        settingsLabel.text = Constants.split + peopleCountDescription + Constants.peopleWith + tip
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)

    }
}
