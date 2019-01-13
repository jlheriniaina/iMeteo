//
//  Wind.swift
//  iMeteo
//
//  Created by lucas on 05/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import Foundation

public class Wind {
    public let speed: Double
    public let deg: Double
    
    public init(speed: Double, deg: Double) {
        self.speed = speed
        self.deg = deg
    }
}

