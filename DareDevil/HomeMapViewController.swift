//
//  HomeMapViewController.swift
//  DareDevil
//
//  Created by Bruce on 9/15/16.
//  Copyright © 2016 Bruce. All rights reserved.
//

import UIKit
import CoreData
import MapKit


class HomeMapViewController: UIViewController, DareDetailsDelegete, CLLocationManagerDelegate, CancelButtonDelegete {
    
    @IBOutlet var dareMap: MKMapView!
    
    let locationManager = CLLocationManager()
    let initialLocation = CLLocation(latitude: 37.375058, longitude: -121.909964)
    let regionRadius: CLLocationDistance = 1000
    var currentLocation: CLLocationCoordinate2D?
    var dares = [Dare]()
    var pins: [Pin] = []
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        
        dareMap.delegate = self
        centerMapOnLocation(initialLocation)
        fetchAllDares()
        loadPinsFromDares()
        print(dares)
        // Request to use location services while app is active
       self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func dareDetailsDelegete(controller: DareDetailsViewController, didFinishAddingDare dare: Dare){
        
        
        dismissViewControllerAnimated(true, completion: nil)
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Success")
                fetchAllDares()
                loadPinsFromDares()
                printDaresInfo()

                
            } catch {
                print("\(error)")
            }
        }
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddNewDare" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! DareDetailsViewController
            let newDare = NSEntityDescription.insertNewObjectForEntityForName("Dare", inManagedObjectContext: managedObjectContext) as! Dare
            controller.cancelButtonDelegate = self
            controller.delegate = self
            controller.newDare = newDare
        }
    }
    
    
    
    func fetchAllDares() {
        let userRequest = NSFetchRequest(entityName: "Dare")
        
        do {
            // get the results by executing the fetch request we made earlier
            let results = try managedObjectContext.executeFetchRequest(userRequest)
            // downcast the results as an array of Mission objects
            dares = results as! [Dare]
        } catch {
            // print the error if it is caught (Swift automatically saves the error in "error")
            print("Somethinghere\(error)")
        }
        
    }
    
    func printDaresInfo(){
        for dare in dares {
            print(dare)
        }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        dareMap.setRegion(coordinateRegion, animated: true)
    }
    
    func loadPinsFromDares(){
        
        //load pins array from dares objts
        for dare in dares{
            
            pins.append(Pin(title: dare.dareDetails!,
                locationName: "",
                image: UIImage(data: dare.picture!)!,
                coordinate: CLLocationCoordinate2D(latitude: currentLocation!.latitude, longitude: currentLocation!.longitude)))
            
        }
        
        //place markers on map
        
        for pin in pins{
            dareMap.addAnnotation(pin)
        }
        
        
    }
    
    func cancelButtonPressedFrom(controller: UIViewController){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        currentLocation = locValue
        print("locations = \(currentLocation!.latitude) \(currentLocation!.longitude)")
    }
    
    
    
}


