//
//  ViewController.swift
//  HashTablePractice
//
//  Created by Jeff Gayle on 9/2/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
                            
    @IBOutlet weak var imageView: UIImageView?
    
    @IBOutlet weak var hashTextField: UITextField?
    
    var hashTable = HashTable(size: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var redBox = UIView()
        var VC = UIViewController()
        var string = "Jeff"
        var int = 35
        self.hashTable.setObject(redBox, key: "redBox")
        self.hashTable.setObject(VC, key: "ViewController")
        self.hashTable.setObject(string, key: "string")
        self.hashTable.setObject(int, key: "Integer")
        
        self.hashTextField?.text = nil
        
        println(hashTable.count)
        println("hash array count \(hashTable.hashArray.count)")
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func saveHashPressed(sender: AnyObject) {
        
        if self.imageView?.image != nil && self.hashTextField?.text != nil {
            let image = self.imageView!.image
            self.hashTable.setObject(image!, key: self.hashTextField!.text)
            self.imageView?.image = nil
            self.hashTextField?.text = nil
        } else {
            var alertController = UIAlertController(title: "Error!", message: "You must select an image before saving", preferredStyle: UIAlertControllerStyle.Alert)
            var photoAction = UIAlertAction(title: "Select Photo", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) -> Void in
                self.selectPhotoPressed(action)
            })
            var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            alertController.addAction(photoAction)
            alertController.addAction(cancelAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func selectPhotoPressed(sender: AnyObject) {
        
        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        self.navigationController!.presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        var original = info[UIImagePickerControllerOriginalImage] as UIImage
        self.imageView?.image = original
        self.dismissViewControllerAnimated(true, completion: nil)
    }


    @IBAction func retrievePhotoPressed(sender: AnyObject) {
        
        if self.hashTextField?.text != nil {
            var object: AnyObject? = self.hashTable.objectForKey(self.hashTextField!.text)
            if let image = object as? UIImage {
                self.imageView?.image = image
            }
        } else {
            var alertController = UIAlertController(title: "Error!", message: "You must define a hash key paired with an image to search for", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addTextFieldWithConfigurationHandler({ (textField: UITextField!) -> Void in
                textField.adjustsFontSizeToFitWidth = true
                textField.placeholder = "Enter Hash Key Here"
            })
            var okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) -> Void in
                self.retrievePhotoPressed(action)
            })
            alertController.addAction(okAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

