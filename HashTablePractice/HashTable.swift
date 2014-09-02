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
    var hashArray = [HashBucket?]()
    var maxSize = 0.0
    
    init(size: Int) {
        self.size = size
        
        self.hashArray = [HashBucket?](count: size, repeatedValue: nil)
    }
    
    //Gets hash value for key String
    func hash(key: String) -> Int {
        var total = 0
        
        //If same length/characters then will result in collision
        for character in key.unicodeScalars {
            var asc = Int(character.value)
            total += asc
        }
        
        println(total % self.size)
        return total % self.size
    }
    
    //Stores object in memory at hash index
    func setObject(objectToStore: AnyObject, key: String) {
        var bucket = HashBucket(key: key, value: objectToStore)
        
        //Get Hash index for key string
        var index = self.hash(key)
        
        //Value = object to store
//        bucket.value = objectToStore
//        bucket.key = key
        
        //Remove object there currently
        self.removeObjectForKey(key)
        
        //Set bucket's nextBucket to space in array at index
        bucket.nextBucket = self.hashArray[index]
        //Set space in array at index to the bucket with value and key
        self.hashArray[index] = bucket
        
        //Increase count
        self.count++
        
        self.maxSize = Double(self.hashArray.count) * 0.75
        if Double(self.count) > maxSize {
            self.resizeTable(self.hashArray.count)
        }
    }
    
    func removeObjectForKey(key: String) {
        //Get hash index for key string
        var index = self.hash(key)
        var previousBucket : HashBucket?
        //Bucket equal to space in memory at index for key string
        var bucket : HashBucket? = self.hashArray[index]
        
        //As long as there is a bucket
        while (bucket != nil) {
            //If bucket's key matches input
            if bucket!.key == key {
                
                if previousBucket == nil {
                    //Found key looking for
                    //Make sure don't lose linked list
                    var nextBucket = bucket?.nextBucket
                    self.hashArray[index] ?? bucket?.nextBucket
                } else {
                    //
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
        //Get hash index for key string
        var index = self.hash(key)
        
        //Set bucket equal to space in memory
        var bucket : HashBucket? = self.hashArray[index]
        
        //If there is a bucket
        while (bucket != nil) {
            if bucket!.key == key {
                //Found object looking for
                return bucket!.value!
            } else {
                //Search through list for correct bucket
                bucket = bucket?.nextBucket
            }
        }
        return nil
    }
    
    func resizeTable(bucketLength: Int) {
        self.count = 0
        var size = self.hashArray.count * 2
        var tempArray = self.hashArray

        self.hashArray = [HashBucket?](count: size, repeatedValue: nil)
        
        //double size by creating new initiated table
        for i in tempArray {
            if let bucket = i {
                var object = bucket
                while (true) {
                    self.setObject(object.value!, key: object.key)
                    if let next = object.nextBucket {
                        object = next
                    } else {
                        break
                    }
                }
            }
        }
        
    }
    /*
    private void resize() {
    int tableSize = 2 * table.length;
    maxSize = (int) (tableSize * threshold);
    HashEntry[] oldTable = table;
    table = new HashEntry[tableSize];
    size = 0;
    for (int i = 0; i < oldTable.length; i++)
    if (oldTable[i] != null
    && oldTable[i] != DeletedEntry.getUniqueDeletedEntry())
    put(oldTable[i].getKey(), oldTable[i].getValue());
    }
    */
    
    
}