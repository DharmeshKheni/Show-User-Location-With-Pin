//
//  Places.swift
//  Location
//
//  Created by Anil on 13/06/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import Foundation
import MapKit

class Places{
    var latitute : CLLocationDegrees
    var longtitut : CLLocationDegrees
    var placeLoc : CLLocationCoordinate2D?
    var theAnnotation : MKPointAnnotation?
    
    init (latit : CLLocationDegrees, long :
        CLLocationDegrees, mytitle : String ,mysubTitle : String){
            self.latitute = latit
            self.longtitut = long
            setLocation()
            setAnnotations(mytitle, subtitle: mysubTitle)
    }
    
    
    func setLocation ( ) {
        
        placeLoc = CLLocationCoordinate2DMake(self.latitute, self.longtitut)
    }
    
    func  setAnnotations (title : String , subtitle : String ) {
        
        theAnnotation = MKPointAnnotation()
        theAnnotation?.coordinate = placeLoc!
        theAnnotation?.title = title
        theAnnotation?.subtitle = subtitle
        
        
    }}
