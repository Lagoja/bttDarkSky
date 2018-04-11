//
//  main.swift
//  TouchbarWeather
//
//  Created by John Lago on 4/6/18.
//  Copyright © 2018 John Lago. All rights reserved.
//

import Foundation
import CoreLocation

let rl = RunLoop.main
let ws = WeatherLookupService.init(runloop: rl)
let ls = LocationService(delegate: ws)
rl.run(mode: .defaultRunLoopMode, before: .init(timeIntervalSinceNow: 5))




