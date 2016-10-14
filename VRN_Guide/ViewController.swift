//
//  ViewController.swift
//  VRN_Guide
//
//  Created by Надежда on 08.10.16.
//  Copyright © 2016 PTeam. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var MyMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currLocation=CLLocation(latitude: 43.7229843, longitude: 10.3966227)
        centerMapOnLocation(location: currLocation)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        MyMap.setRegion(coordinateRegion, animated: true)
    }

  
    
    
    
    


}

