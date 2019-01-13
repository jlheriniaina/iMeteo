//
//  JourCell.swift
//  iMeteo
//
//  Created by lucas on 06/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit

class JourCell: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var infoLbl: UILabel!
    private var journalier: Journalier!
    
    func setupView(journalier : Journalier)  {
        self.journalier = journalier
        LocalService.loadImage(self.journalier.icone, imageView: icon)
        let attributed = NSMutableAttributedString(string: journalier.jour + "\n", attributes: [.font : UIFont.boldSystemFont(ofSize: 22), .foregroundColor : UIColor.darkGray])
        let descString = NSAttributedString(string: journalier.desc + "\n", attributes: [ .font : UIFont.boldSystemFont(ofSize: 20), .foregroundColor : UIColor.black])
        let temperature = NSAttributedString(string: "Min "+self.journalier.min.convertDoubleToString()+" - Max "+self.journalier.max.convertDoubleToString(), attributes: [.font : UIFont.boldSystemFont(ofSize: 19), .foregroundColor : UIColor.black])
        attributed.append(descString)
        attributed.append(temperature)
        infoLbl.attributedText = attributed

    }
}
