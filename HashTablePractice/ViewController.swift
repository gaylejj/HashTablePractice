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
        
        var hashTable = HashTable(size: 300)
        var redBox = UIView()
        var VC = UIViewController()
        hashTable.setObject(redBox, key: "redBox")
        hashTable.setObject(VC, key: "ViewController")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

