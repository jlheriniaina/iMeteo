//
//  MainClass.swift
//  iMeteo
//
//  Created by lucas on 05/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import Foundation
public class MainClass {
    public let temp: Double
    public let tempMin: Double
    public let tempMax: Double
    public let pressure: Double
    public let seaLevel: Double
    public let grndLevel: Double
    public let humidity: Int
    public let tempKf: Double
    
    public init(temp: Double, tempMin: Double, tempMax: Double, pressure: Double, seaLevel: Double, grndLevel: Double, humidity: Int, tempKf: Double) {
        self.temp = temp
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.seaLevel = seaLevel
        self.grndLevel = grndLevel
        self.humidity = humidity
        self.tempKf = tempKf
    }
}

