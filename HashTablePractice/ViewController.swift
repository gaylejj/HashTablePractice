//
//  ViewController.swift
//  HashTablePractice
//
//  Created by Jeff Gayle on 9/2/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var hashTable = HashTable(size: 5)
        var redBox = UIView()
        var VC = UIViewController()
        var string = "Jeff"
        var int = 35
        hashTable.setObject(redBox, key: "redBox")
        hashTable.setObject(VC, key: "ViewController")
        hashTable.setObject(string, key: "string")
        hashTable.setObject(int, key: "Integer")
        
        println(hashTable.count)
        println("hash array count \(hashTable.hashArray.count)")
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

