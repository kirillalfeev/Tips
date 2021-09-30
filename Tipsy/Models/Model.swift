//
//  Model.swift
//  Tipsy
//
//  Created by Kirill Alfeev on 12.03.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

class Model {
    
    enum Tips: Double {
        case zero = 0.0
        case tenPercent = 0.1
        case twentyPercent = 0.2
        
        func formatedTip() -> Int {
            return Int(self.rawValue * 100)
        }
    }
    
    private(set) var tip: Tips = .tenPercent
    var splitNumberValue = 2
    private(set) var result = 0.0
    
    func chageTip(_ tip: Tips) {
        self.tip = tip
    }
    
    func resultForOnePerson(by bill: Double) -> Double {
        let result = (bill * (1 + tip.rawValue) / Double(splitNumberValue))
        let rounded = round(result * 10)/10
        self.result = rounded
        return rounded
    }
}
