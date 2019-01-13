//
//  Prevision.swift
//  iMeteo
//
//  Created by lucas on 05/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import Foundation
import UIKit

class Prevision {
    private var temperature : Double
    private var date: String
    private var icone: String
    private var desc: String
    private var jour: String
    
    func getTemperature() -> Double {
        return temperature
    }
    func getDate() -> String{
        return date
    }
    func getIcone() -> String{
        return icone
    }
    func getDesc() -> String{
        return desc
    }
    func getJour() -> String{
        return jour
    }
    init(temp: Double, date: String,icon: String, desc: String){
        self.temperature = temp
        self.date = date
        self.icone = icon
        self.desc = desc
        self.jour = DateHelpers.doWeekDay(date) ?? ""
    }
    
    
}
