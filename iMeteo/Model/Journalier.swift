//
//  Journalier.swift
//  iMeteo
//
//  Created by lucas on 05/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit

class Journalier {
    private var _jour: String
    private var _icone: String
    private var _max: Double
    private var _min: Double
    private var _desc: String
    
    var jour : String {
        return _jour
    }
    var icone: String {
        return _icone
    }
    var max: Double {
        return _max
    }
    var min : Double {
        return _min
    }
    var desc: String {
        return _desc
    }
    
    init(jour: String, icone: String, max: Double, min: Double, desc: String) {
        self._jour = jour
        self._icone = icone
        self._max = max
        self._min = min
        self._desc = desc
    }
    
    
    
    
}
