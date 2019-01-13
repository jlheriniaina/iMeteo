//
//  Utils.swift
//  iMeteo
//
//  Created by lucas on 05/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import Foundation

extension Double {
    func convertDoubleToString() -> String {
        let int = Int(self)
        return String(int)+" °C"
        
    }
}
