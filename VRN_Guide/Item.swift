//
//  Item.swift
//  VRN_Guide
//
//  Created by Надежда on 29.10.16.
//  Copyright © 2016 PTeam. All rights reserved.
//
//  A custom class for items in table view
import Foundation

class Item {
    //MARK - class fields
    var _image: UIImage
    var _name: String
    var _context: String
    var _description: String
    
    //MARK - properties
    var image: UIImage{
        get{return _image}
        set{_image=newValue}
    }
    var name: String{
        get{return _name}
        set{_name=newValue}
    }
    var context: String{
        get{return _context}
        set{_context=newValue}
    }
    var descriprion: String{
        get{return _description}
        set{_description=newValue}
    }
    
    
    init(name: String, context: String, image:UIImage){
        _image=image
        _name=name
        _context=context
        _description=""
    }
    
    
}
