//
//  PrevisionCVCell.swift
//  iMeteo
//
//  Created by lucas on 05/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit

class PrevisionCVCell: UICollectionViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    private var prevision: Prevision!
    
    func initView(prevision: Prevision) {
        self.prevision = prevision
        self.tempLbl.text = prevision.getTemperature().convertDoubleToString()
        self.descLbl.text = self.prevision.getJour()+" à "+(DateHelpers.hour(self.prevision.getDate()) ?? "") + "\n"+prevision.getDesc()
        LocalService.loadImage(self.prevision.getIcone(), imageView: icon)
        
    }
    
}
