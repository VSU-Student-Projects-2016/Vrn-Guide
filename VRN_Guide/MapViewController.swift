//
//  MapViewController.swift
//  VRN_Guide
//
//  Created by xcode on 15.10.16.
//  Copyright © 2016 PTeam. All rights reserved.
//


import UIKit
import MapKit
import CCHMapClusterController

class MapViewController: UIViewController {

  
    @IBOutlet weak var MyMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //51.675611, 39.211179
        
        let startLocation = CLLocationCoordinate2D(latitude: 51.675611, longitude: 39.211179)
        let sl = CLLocationCoordinate2D (latitude:51.674773, longitude: 39.209151)
        let span = MKCoordinateSpanMake(0.5, 0.5)
        let region = MKCoordinateRegion(center: sl, span: span)
        
        MyMap.setRegion(region, animated: true)
        
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = sl
        dropPin.title = "New York City"
        MyMap.addAnnotation(dropPin)
        
        let dropPin2 = MKPointAnnotation()
        dropPin2.coordinate = startLocation
        dropPin2.title = "New York City2"
        MyMap.addAnnotation(dropPin2)

        //self.mapClusterController = [[CCHMapClusterController alloc] initWithMapView:self.mapView];
        //[self.mapClusterController addAnnotations:annotations withCompletionHandler:NULL];
       

        
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
