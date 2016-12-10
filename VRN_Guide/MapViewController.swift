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
import RealmSwift

class MapViewController: UIViewController, CCHMapClusterControllerDelegate, MKMapViewDelegate {

  
    @IBOutlet weak var MyMap: MKMapView!
    var item_realm = try! Realm()
    var array_of_artwork = [MKPointAnnotation]()
    
    var p: CCHMapClusterController = CCHMapClusterController.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        //51.675611, 39.211179
        self.p = CCHMapClusterController.init(mapView: self.MyMap)
        self.p.delegate = self
        self.MyMap.delegate = self
        loadRealm()
        
        /*let startLocation = CLLocationCoordinate2D(latitude: 51.675611, longitude: 39.211179)
        let sl = CLLocationCoordinate2D (latitude:51.674773, longitude: 39.209151)*/
        StartLocation()
        
        let arr = item_realm.objects(SingleItem.self)
        for index in arr{
            let artan = MKPointAnnotation()
            let cord = CLLocationCoordinate2D(latitude: index.item_latitude, longitude: index.item_longitude)
            artan.coordinate = cord
            artan.title = index.name
            artan.subtitle = index.context
            array_of_artwork.append(artan)
        }
        
        
        p.addAnnotations(array_of_artwork, withCompletionHandler: nil)
        
        /*let dropPin = MKPointAnnotation()
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
        p.addAnnotations([JPSThumbnailAnnotation(thumbnail: fr)], withCompletionHandler: nil) */
        
       
    }
    
    //отцентровка
    func StartLocation(){
        let sl = CLLocationCoordinate2D (latitude:51.674773, longitude: 39.209151)
        let span = MKCoordinateSpanMake(0.3, 0.3)
        let region = MKCoordinateRegion(center: sl, span: span)
        
        MyMap.setRegion(region, animated: true)
    }
    
    func LoadPoint(start: CLLocation){
        let Radius:CLLocationDistance = 2000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(start.coordinate, Radius, Radius)
        MyMap.setRegion(coordinateRegion, animated: true)
    }
    
    //pfuheprf htfkvf
    func loadRealm()
    {
        let item_1=SingleItem()
        item_1.image="cat1"
        item_1.item_id=0
        item_1.name="cat 1"
        item_1.context="cute cat"
        item_1.item_description="there will be a description Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        item_1.item_latitude=51.674773
        item_1.item_longitude=39.209151
        
        let item_2=SingleItem()
        item_2.image="cat2"
        item_2.item_id=0
        item_2.name="cat 2"
        item_2.context="cute cat"
        item_2.item_description="there will be a description Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        item_2.item_latitude=51.675611
        item_2.item_longitude=39.211179
        
        try! item_realm.write {
            item_realm.deleteAll()
            item_realm.add(item_1)
            item_realm.add(item_2)
        }
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
        return ""
        }
        
        return ""
//        if (mapClusterAnnotation.index == 0)
//        array_of_artwork
//            return String()
//        }
//        else{
//            return "2 метка"
//        }
//        item_realm.objects(SingleItem.self)[idx]
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
