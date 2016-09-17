//
//  DareDetailsViewController.swift
//  DareDevil
//
//  Created by Bruce on 9/15/16.
//  Copyright © 2016 Bruce. All rights reserved.
//

import UIKit

class DareDetailsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //addcancel delegete
    weak var delegate: DareDetailsDelegete?
    var cancelButtonDelegate: CancelButtonDelegete?
    var newDare: Dare?
    var dangerRatingVal: Int?
    
    @IBOutlet weak var dareDetailsLabel: UITextField!
    @IBOutlet var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var dareDetailsDangerRatingLabel: UIPickerView!
    let pickerData = ["Mild","Moderate","Evel Knievel"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dareDetailsDangerRatingLabel.dataSource = self
        dareDetailsDangerRatingLabel.delegate = self
        imagePicker.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancelBarButtonPressed(sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom(self)
    }
    
    
    @IBAction func doneBarButtonPressed(sender: UIBarButtonItem) {
        
        print(dareDetailsLabel.text)
        
        if let dareObj = newDare{
            dareObj.dareDetails = dareDetailsLabel.text
            dareObj.points = 1
            dareObj.dangerRating = dangerRatingVal
            
            delegate?.dareDetailsDelegete(self, didFinishAddingDare: dareObj)
            
        }
    }
    
    @IBAction func loadEvidenceButtonTapped(sender: UIButton) {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .ScaleAspectFit
            imageView.image = pickedImage
            newDare?.picture = UIImagePNGRepresentation(pickedImage)
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dangerRatingVal = row + 1
    }
    
}

