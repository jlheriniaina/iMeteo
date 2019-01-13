//
//  PrevisionCell.swift
//  iMeteo
//
//  Created by lucas on 05/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import UIKit

class PrevisionCell: UITableViewCell,UICollectionViewDelegate,
                     UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!

    private var previsions = [Prevision]()
    
    func initView(previsions: [Prevision]) {
     layer.cornerRadius = 20
     self.previsions = previsions
     collectionView.dataSource = self
     collectionView.delegate = self
     collectionView.reloadData()
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return previsions.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let prevision = previsions[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "previsionCVCell", for: indexPath) as! PrevisionCVCell
        cell.initView(prevision: prevision)
        print(prevision.getTemperature())
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 150)
    }
}
