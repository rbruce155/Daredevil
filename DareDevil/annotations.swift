//
//  annotations.swift
//  DareDevil
//
//  Created by Bruce on 9/16/16.
//  Copyright © 2016 Bruce. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class Pin: NSObject, MKAnnotation {
    let title: String?
    let image: UIImage?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, image: UIImage, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.image = image
        self.locationName = locationName
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
