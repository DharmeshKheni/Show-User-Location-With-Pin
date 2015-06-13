//
//  MapViewController.swift
//  Location
//
//  Created by Anil on 13/06/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let regionRadius: CLLocationDistance = 500
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var latDelta : CLLocationDegrees
        var longDelta : CLLocationDegrees
        
        longDelta = 0.01
        latDelta = 0.01
        
        var theSpan : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let userLoc = NSUserDefaults.standardUserDefaults().objectForKey("Location") as! [String : NSNumber]
        
        let userLat = userLoc["lat"]
        let userLng = userLoc["lng"]
        
        var latitute:CLLocationDegrees =  userLat as! CLLocationDegrees
        var longitute:CLLocationDegrees =  userLng as! CLLocationDegrees
        
        var place1 : Places = Places(latit: latitute, long: longitute, mytitle: "MyHome", mysubTitle: "Home Sweet Home")
        var theRegion : MKCoordinateRegion = MKCoordinateRegionMake(place1.placeLoc!, theSpan)
        
        self.mapView.setRegion(theRegion, animated: true)
        self.mapView.addAnnotation(place1.theAnnotation)
        
    }
}
