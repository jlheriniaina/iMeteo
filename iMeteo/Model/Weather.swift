//
//  Weather.swift
//  iMeteo
//
//  Created by lucas on 05/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import Foundation


public class Weather {
    public let id: Int
    public let main: MainEnum
    public let description: String
    public let icon: Icon
    
    public init(id: Int, main: MainEnum, description: String, icon: Icon) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}

