//
//  URL.swift
//  MarsRovers
//
//  Created by Jan Vrzal on 18.02.17.
//  Copyright © 2017 Jan Vrzal. All rights reserved.
//

import Foundation

struct URLStorage {
    
    private static let apiKey = "zjDY05J7ZehvJflfN1cUMSfgNlwdHSyJlPdGC3y6"
    
    static func getPhotoURL(date: String) -> NSURL? {
        
        guard let url = NSURL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=\(2015-6-3)&api_key=\(URLStorage.apiKey)")
            else {
                print("No url")
                return nil
        }
        return  url
    }
}
