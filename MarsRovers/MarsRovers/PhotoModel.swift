//
//  PhotoModel.swift
//  MarsRovers
//
//  Created by Jan Vrzal on 18.02.17.
//  Copyright © 2017 Jan Vrzal. All rights reserved.
//

import Foundation

class PhotoModel {
    
    static let shared: PhotoModel = PhotoModel()
    
    var data: [Photo] = []

    func getData() {
        RoverPhotoService.createRequest { (data, error) in  
            guard let data = data else {
                return
            }
            let result = JSONParser.parsePhoto(data: data)
            self.data = result
        }
    }
}
