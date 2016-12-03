//
//  RealmItem.swift
//  VRN_Guide
//
//  Created by Надежда on 03.12.16.
//  Copyright © 2016 PTeam. All rights reserved.
//

import Foundation
import RealmSwift

class SingleItem: Object{
    dynamic var item_id=0
    dynamic var item_latitude=0
    dynamic var item_longitude=0
    dynamic var image=""
    dynamic var name=""
    dynamic var context=""
    dynamic var item_description=""
    dynamic var table: Items?
    
}

class Items: Object{
    let items = List<SingleItem>()
}

