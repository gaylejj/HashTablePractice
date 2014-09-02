//
//  HashTable.swift
//  HashTablePractice
//
//  Created by Jeff Gayle on 9/2/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import Foundation

class HashTable {
    
    var count = 0
    var size : Int
    var hashArray = [HashBucket]()
    
    init(size: Int) {
        self.size = size
        
        for i in 0..<size {
            var bucket = HashBucket()
            self.hashArray.append(bucket)
        }
    }
    
    func hash(key: String) -> Int {
        var total = 0
        
        for character in key.unicodeScalars {
            var asc = Int(character.value)
            total += asc
        }
        
        println(total % self.size)
        return total % self.size
    }
    
    func setObject(objectToStore: AnyObject, key: String) {
        var bucket = HashBucket()
        var index = self.hash(key)
        
        bucket.value = objectToStore
        bucket.key = key
        
        //self.removeObjectForKey(key)
        
        bucket.nextBucket = self.hashArray[index]
        self.hashArray[index] = bucket
        
        self.count++
    }
    
    func removeObjectForKey(key: String) {
        var index = self.hash(key)
        var previousBucket : HashBucket?
        var bucket : HashBucket? = self.hashArray[index]
        
        while (bucket != nil) {
            if bucket!.key == key {
                
                if previousBucket == nil {
                    //Found key looking for
                    //Make sure don't lose linked list
                    var nextBucket = bucket?.nextBucket
                    self.hashArray[index] ?? bucket?.nextBucket
                } else {
                    previousBucket!.nextBucket = bucket?.nextBucket
                }
                self.count--
                return
            }
            
            previousBucket = bucket
            
            if let nextBucket = bucket?.nextBucket {
                bucket = nextBucket
            } else {
                bucket = nil
            }
            
        }
    }
    
    func objectForKey(key: String) -> AnyObject? {
        var index = self.hash(key)
        var bucket : HashBucket? = self.hashArray[index]
        
        while (bucket != nil) {
            if bucket!.key == key {
                //Found object looking for
                return bucket!.value!
            } else {
                bucket = bucket?.nextBucket
            }
            
        }
        return nil
    }
    
    
    
    
    
}