//
//  JSONParser.swift
//  MarsRovers
//
//  Created by Jan Vrzal on 18.02.17.
//  Copyright © 2017 Jan Vrzal. All rights reserved.
//

import SwiftyJSON

class JSONParser {
    
    static func parsePhoto(data: Data) -> [Photo] {
    
        var result = [Photo]()
        
        let json = JSON(data: data)
    
        for photo in json {
            
            for i in photo.1 {
                
                guard   let id = i.1["id"].int,
                        let sol = i.1["sol"].int,
                            let cameraId = i.1["camera"]["id"].int,
                            let cameraName = i.1["camera"]["name"].string,
                            let cameraRoverId = i.1["camera"]["rover_id"].int,
                            let cameraFullName = i.1["camera"]["full_name"].string,
                        let imgURL = i.1["img_src"].string,
                        let earthDate = i.1["earth_date"].string,
                            let roverId = i.1["rover"]["id"].int,
                            let roverName = i.1["rover"]["name"].string,
                            let roverLandingDate = i.1["rover"]["landing_date"].string,
                            let roverLaunchDate = i.1["rover"]["launch_date"].string,
                            let roverStatus = i.1["rover"]["status"].string,
                            let roverMaxSol = i.1["rover"]["max_sol"].int,
                            let roverMaxData = i.1["rover"]["max_date"].string,
                            let roverTotalPhotos = i.1["rover"]["total_photos"].int
                    else {
                    print("Cant parse JSON")
                    break
                }
                
                let photo = Photo(id: id, sol: sol, camera: Camera(id: cameraId,name: cameraName, roverId: cameraRoverId, fullName: cameraFullName), imgURL: imgURL, earthDate: earthDate, rover: Rover(id: roverId, name: roverName, landingDate: roverLandingDate, launchDate: roverLaunchDate, status: roverStatus, maxSol: roverMaxSol, maxDate: roverMaxData, totalPhotos: roverTotalPhotos ))
                result.append(photo)
            }
        }
        print("JSON parsing success")
        return result
    }
}
