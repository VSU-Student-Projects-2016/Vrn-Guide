//
//  MapViewController.swift
//  VRN_Guide
//
//  Created by xcode on 15.10.16.
//  Copyright © 2016 PTeam. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

  
    @IBOutlet weak var MyMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let startLocation = CLLocation(latitude: 51.674773, longitude: 39.209151)
        LoadPoint(start: startLocation)
        

        
        // Do any additional setup after loading the view.
    }
    
    func LoadPoint(start: CLLocation){
        let Radius:CLLocationDistance = 2000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(start.coordinate, Radius, Radius)
        MyMap.setRegion(coordinateRegion, animated: true)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
