//
//  ViewController.swift
//  Location
//
//  Created by Anil on 06/04/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
        self.locationManager.startMonitoringSignificantLocationChanges()
        
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.Denied{
            println("location not authorized")
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    
        self.locationManager.stopUpdatingLocation()
        var locationArray = locations as NSArray
        var locationObj = locationArray.lastObject as! CLLocation
        var coord = locationObj.coordinate
        
        let lat : NSNumber = NSNumber(double: coord.latitude)
        let lng : NSNumber = NSNumber(double: coord.longitude)
        let locationDict = ["lat": lat, "lng": lng]
        NSUserDefaults.standardUserDefaults().setObject(locationDict, forKey: "Location")
        
    }
    
    @IBAction func goToMap(sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("map") as! MapViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        
        println("Error" + error.localizedDescription)
    }
}

