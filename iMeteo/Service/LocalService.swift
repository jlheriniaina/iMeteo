//
//  LocalService.swift
//  iMeteo
//
//  Created by lucas on 05/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import Foundation
import UIKit

class LocalService {
    
  static func loadImage(_ string: String, imageView : UIImageView) {
        let baseUrl = "http://openweathermap.org/img/w/"
        let ext = ".png"
        if let url = URL(string: baseUrl+string+ext) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                guard data != nil, let image = UIImage(data : data!) else { return }
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }).resume()
        }
    }
}
