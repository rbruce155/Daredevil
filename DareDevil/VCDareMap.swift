//
//  VCDareMap.swift
//  DareDevil
//
//  Created by Brandon McMahan on 9/16/16.
//  Copyright © 2016 Bruce. All rights reserved.
//

import Foundation
import UIKit
import MapKit


extension HomeMapViewController: MKMapViewDelegate {
    
    // 1
    func dareMap(dareMap: MKMapView!, viewForAnnotation annotation: MKAnnotation?) -> MKAnnotationView! {

        if let annotation = annotation as? Pin {
            let image: UIImage?
            let identifier = "pin"
            var view: MKAnnotationView
            if let dequeuedView = dareMap.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKAnnotationView! { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButtonType.DetailDisclosure as! UIView
            }
            return view
        }
        return nil
    }
}