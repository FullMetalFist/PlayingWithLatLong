//
//  StationData.swift
//  PlayingWithLatLong
//
//  Created by Michael Vilabrera on 12/28/16.
//  Copyright © 2016 Michael Vilabrera. All rights reserved.
//

import Foundation

enum ExitType {
    case Stair
    case Easement
    case Escalator
    case Elevator
    case Door
}

enum Corner {
    case NE
    case NW
    case SE
    case SW
}

struct StationData {
    var stationName: String?
    var latitude: Double?
    var longitude: Double?
    var northSouthStreet: String?
    var eastWestStreet: String?
    var exitType: ExitType?
    var corner: Corner?
    var ada: Bool?
    
    init(stationName: String, latitude: Double, longitude: Double, northSouthStreet: String, eastWestStreet: String, exitType: ExitType, corner: Corner, ada: Bool) {
        self.stationName = stationName
        self.latitude = latitude
        self.longitude = longitude
        self.northSouthStreet = northSouthStreet
        self.eastWestStreet = eastWestStreet
        self.exitType = exitType
        self.corner = corner
        self.ada = ada
    }
}
