//
//  LocationService.swift
//  TouchbarWeather
//
//  Created by John Lago on 4/7/18.
//  Copyright © 2018 John Lago. All rights reserved.
//

import Foundation
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate{

    var locationManager: CLLocationManager = CLLocationManager();
    var location: CLLocation?

    init(delegate: CLLocationManagerDelegate) {
        super.init()
        locationManager.delegate = delegate
        getCurrentLocation()
    }

    func getCurrentLocation() {

        if !CLLocationManager.locationServicesEnabled() {
            // Location services are not available.
            print("Location services not available")
            return
        }

        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.startUpdatingLocation();
    }
}
