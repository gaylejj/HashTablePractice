//
//  HashBucket.swift
//  HashTablePractice
//
//  Created by Jeff Gayle on 9/2/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import Foundation

class HashBucket {
    
    var key : String
    var nextBucket : HashBucket?
    var value : AnyObject?
    
    init(key: String, value: AnyObject?) {
        self.key = key
        self.value = value
    }
    
}