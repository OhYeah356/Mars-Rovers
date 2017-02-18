//
//  RoverPhotoService.swift
//  MarsRovers
//
//  Created by Jan Vrzal on 18.02.17.
//  Copyright © 2017 Jan Vrzal. All rights reserved.
//

import Alamofire


class RoverPhotoService {
    
    static func createRequest(completion: @escaping (_ result: Data?, _ error: Error?) -> ()) {
        
        Alamofire.request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2015-6-3&api_key=DEMO_KEY").response { response in
            
            if response.error != nil {
                completion(nil, response.error)
                print(response.error?.localizedDescription ?? "Request Error")
            }
            else {
                completion(response.data, nil)
                print("Request success with code: \(response.response?.statusCode)")
            }
        }
    }
}
