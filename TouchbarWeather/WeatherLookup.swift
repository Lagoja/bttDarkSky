//
//  WeatherLookup.swift
//  TouchbarWeather
//
//  Created by John Lago on 4/7/18.
//  Copyright © 2018 John Lago. All rights reserved.
//

import Foundation
import CoreLocation


class WeatherLookupService: NSObject, CLLocationManagerDelegate{
    let rl: RunLoop

    init(runloop: RunLoop) {
        rl = runloop
        super.init()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        guard let secretKey = ProcessInfo.processInfo.environment["DARK_SKIES_API_SECRET"] else {
            print("Could not find Dark Skies key in environment")
            return
        }
        let baseURL = "https://api.darksky.net/forecast/" + secretKey
        if let l = locations.first{
            let url = baseURL + "/" + l.coordinate.latitude.description + "," + l.coordinate.longitude.description
            URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, err) -> Void in
                if err == nil{
                    if let rd = data {
                        let jsondict = try? JSONSerialization.jsonObject(with: rd, options: .allowFragments)
                        if let dictionary = jsondict as? [String:Any?] {
                            if let currently = dictionary["currently"] as? [String:Any?]{
                                if let temp = currently["apparentTemperature"] as? Double {
                                    let iTemp = Int(temp)
                                    print(String(iTemp) + "°F")
                                    CFRunLoopStop(self.rl.getCFRunLoop())
                                }
                            }
                        }
                    }
                }
            }.resume()
        }
    }
}
