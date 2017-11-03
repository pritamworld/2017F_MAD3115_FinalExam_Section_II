//
//  Location.swift
//  2017F_MAD3115_FinalExam_Section_II
//
//  Created by moxDroid on 2017-11-02.
//  Copyright © 2017 moxDroid. All rights reserved.
//  Roll No.    :
//  Name        :

import Foundation
class Location
{
    var locationID: Int
    var locationName: String
    var latitude: Double
    var longitude: Double
    
    init()
    {
        self.locationID = 0
        self.locationName = ""
        self.latitude = 0.0
        self.longitude = 0.0
    }
    
    init(locationID: Int, locationName: String, latitude: Double, longitude: Double)
    {
        self.locationID = locationID
        self.locationName = locationName
        self.latitude = latitude
        self.longitude = longitude
    }
    
    static func getLocationList() -> [Location]
    {
        var locationArray = [Location]()
        locationArray.append(Location(locationID: 1,locationName: "My Home",latitude: 43.774427,longitude: -79.231582))
        locationArray.append(Location(locationID: 2,locationName: "My Job",latitude: 43.259971,longitude: -79.880114))
        locationArray.append(Location(locationID: 3,locationName: "CN Tower",latitude: 43.642566,longitude: -79.387057))
        locationArray.append(Location(locationID: 4,locationName: " Niagra Fall, Canada",latitude: 43.077275,longitude: -79.075320))
        locationArray.append(Location(locationID: 5,locationName: " Lambton College In Toronto",latitude: 43.6532,longitude: -79.3832))
        locationArray.append(Location(locationID: 5,locationName: " Statue of Liberty",latitude: 40.690498,longitude: -74.046500))
        locationArray.append(Location(locationID: 5,locationName: " Eiffel Tower",latitude: 48.858376,longitude: 2.294469))
        locationArray.append(Location(locationID: 5,locationName: " Mumbai, India",latitude: 18.921984,longitude: 72.834654))
        locationArray.append(Location(locationID: 5,locationName: " Mt. Everest",latitude: 27.987850,longitude: 86.925026))
        locationArray.append(Location(locationID: 5,locationName: " Taj Mahal",latitude: 27.175015,longitude: 78.042155))
        
        
        return locationArray
    }
}
