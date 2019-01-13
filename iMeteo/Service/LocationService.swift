//
//  LocationService.swift
//  iMeteo
//
//  Created by lucas on 22/12/2018.
//  Copyright © 2018 lucas. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension HomeViewController : CLLocationManagerDelegate {

    func updateLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }
  
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard locations.count > 0 else { return }
        locationManager?.stopUpdatingLocation()
        let mLocation = locations[0]
        if !isload{
              loadPrevision(lat: mLocation.coordinate.latitude, long: mLocation.coordinate.longitude)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Une erreur est survenu ->"+error.localizedDescription)
    }
    
    
}
