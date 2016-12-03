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
import JPSThumbnailAnnotation

class MapViewController: UIViewController, CCHMapClusterControllerDelegate, MKMapViewDelegate {

  
    @IBOutlet weak var MyMap: MKMapView!

    var p: CCHMapClusterController = CCHMapClusterController.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        //51.675611, 39.211179
        self.p = CCHMapClusterController.init(mapView: self.MyMap)
        self.p.delegate = self
        self.MyMap.delegate = self
        
        
        let startLocation = CLLocationCoordinate2D(latitude: 51.675611, longitude: 39.211179)
        let sl = CLLocationCoordinate2D (latitude:51.674773, longitude: 39.209151)
        let span = MKCoordinateSpanMake(0.3, 0.3)
        let region = MKCoordinateRegion(center: sl, span: span)
        
        MyMap.setRegion(region, animated: true)
        
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = sl
        dropPin.title = "New York City"
        //MyMap.addAnnotation(dropPin)
        
        let dropPin2 = MKPointAnnotation()
        dropPin2.coordinate = startLocation
        dropPin2.title = "New York City2"
        //MyMap.addAnnotation(dropPin2)
       
        let fr = JPSThumbnail()
        fr.coordinate =  CLLocationCoordinate2D (latitude:51.674773, longitude: 39.209151)
        fr.image = UIImage(named: "cat2")
        fr.title = "gjhgh"
        fr.subtitle = "yhdydy"
        
        
        //MyMap.addAnnotation(JPSThumbnailAnnotation(thumbnail: fr))
        
    
        
        //MyMap.addAnnotation(JPSThumbnailAnnotation(thumbnail: fr))
        p.addAnnotations([JPSThumbnailAnnotation(thumbnail: fr)], withCompletionHandler: nil)
        
       
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
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let a = view as? JPSThumbnailAnnotationView{
            return a.didDeselectAnnotationView(inMap: mapView)
        }
        
        
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        if let a = view as? JPSThumbnailAnnotationView{
            return a.didDeselectAnnotationView(inMap: mapView)
        }
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let a = annotation as? JPSThumbnailAnnotationProtocol {
            return a.annotationView(inMap: mapView)
        }
        
        return nil
        
        
    }
    
    func mapClusterController(_ mapClusterController: CCHMapClusterController!, titleFor mapClusterAnnotation: CCHMapClusterAnnotation!) -> String! {
        if mapClusterAnnotation.annotations.count > 1{
            let x : Int = mapClusterController.annotations.count
            return String(x)
            
        }
        let sl = CLLocationCoordinate2D (latitude:51.674773, longitude: 39.209151)
        if mapClusterAnnotation.coordinate.latitude == sl.latitude {
            return String(mapClusterAnnotation.coordinate.latitude)
        }
        else{
            return "2 метка"
        }
        
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
