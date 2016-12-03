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
    
    @IBOutlet weak var ItemLocation: MKMapView!
    @IBOutlet weak var ItemDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
