//
//  List.swift
//  iMeteo
//
//  Created by lucas on 05/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import Foundation


public class List {
    public let dt: Int
    public let main: MainClass
    public let weather: [Weather]
    public let clouds: Clouds
    public let wind: Wind
    public let rain: Rain
    public let sys: Sys
    public let dtTxt: String
    
    public init(dt: Int, main: MainClass, weather: [Weather], clouds: Clouds, wind: Wind, rain: Rain, sys: Sys, dtTxt: String) {
        self.dt = dt
        self.main = main
        self.weather = weather
        self.clouds = clouds
        self.wind = wind
        self.rain = rain
        self.sys = sys
        self.dtTxt = dtTxt
    }
}

