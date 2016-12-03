//
//  SingleItemViewController.swift
//  VRN_Guide
//
//  Created by Надежда on 03.12.16.
//  Copyright © 2016 PTeam. All rights reserved.
//

import UIKit

class SingleItemViewController: UIViewController {

    @IBOutlet weak var ItemPhoto: UIImageView!


    @IBOutlet weak var ItemName: UILabel!
    @IBOutlet weak var ItemDescription: UITextView!
    @IBOutlet weak var ItemLocation: MKMapView!
    
    var item=SingleItem()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ItemDescription.setContentOffset(CGPoint.zero, animated: false)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        ItemPhoto.image=UIImage(named: item.image)
        ItemName.text=item.name
        ItemDescription.text=item.item_description 
        let sl = CLLocationCoordinate2D (latitude: item.item_latitude, longitude: item.item_longitude)
        let span = MKCoordinateSpanMake(0.004, 0.004)
        let region = MKCoordinateRegion(center: sl, span: span)
        
        ItemLocation.setRegion(region, animated: true)
        
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = sl
        dropPin.title = item.name
        ItemLocation.addAnnotation(dropPin)

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
