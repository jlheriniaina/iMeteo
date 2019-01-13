//
//  City.swift
//  iMeteo
//
//  Created by lucas on 05/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import Foundation


public class City {
    public let id: Int
    public let name: String
    public let coord: Coord
    public let country: String
    public let population: Int
    
    public init(id: Int, name: String, coord: Coord, country: String, population: Int) {
        self.id = id
        self.name = name
        self.coord = coord
        self.country = country
        self.population = population
    }
}

