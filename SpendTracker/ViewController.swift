//
//  ViewController.swift
//  SpendTracker
//
//  Created by Kim Pham on 8/8/16.
//  Copyright © 2016 BooBoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Properties
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var itemNameField: UITextField!
    
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    @IBOutlet weak var itemPriceField: UITextField!
    
    @IBOutlet weak var itemStatSwitch: UISwitch!
    
    @IBOutlet weak var itemStatLabel: UILabel!
    
    @IBOutlet weak var yesNoLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
  
    
    var spend: Spend?
    
    //MARK: Navigation
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    // This method lets you configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender{
            let name = itemNameField.text ?? ""
            let photo = photoImageView.image
            let price = Double(itemPriceField.text!) ?? 0.0
            let needed = itemStatSwitch.on
            
            spend = Spend(item: name, price: price, image: photo, needed: needed)
            
        }
    }
    
    
    //set the view controller to be anything's delegate here
    override func viewDidLoad() {
        super.viewDidLoad()

        //assign view controller to be text field delegate since view controller
        // has the reference to the textfield
        itemNameField.delegate = self
    
        itemPriceField.delegate = self
    
        if let spend = spend{
            
            navigationItem.title = spend.item
            itemNameField.text = spend.item
            itemPriceField.text = String(spend.price)
            photoImageView.image = spend.image
            if spend.needed {
                itemStatSwitch.on = true
            }
            
        }
        checkValidMealName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UITextField Delegate:  textFieldShouldReturn
    //                             textFieldDidEndEditing
    
    //this function ask whether the textfield will react to the return button
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        //let the text field resign its first responder when return key is tapped
        textField.resignFirstResponder()
        
        return true
    }
    
    
    //this function gets called after text field resign first responder status
    func textFieldDidEndEditing(textField: UITextField) {
        
        //display edited text when text field did finish editing
        if textField == itemNameField {
            checkValidMealName()
            navigationItem.title = textField.text
            itemPriceField.enabled = true
            itemStatSwitch.enabled = true
        }
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.enabled = false
        checkValidMealName()
    }
    
    func checkValidMealName() {
        // Disable the Save button if the text field is empty.
        let text = itemNameField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    
    
    //MARK:UIImagePickerControllerDelegate     imagePickerControllerDidCancel
    //                                         imagePickerController
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        //dismiss the picker
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    //MARK: Action

    //item stat switch (needed/ not needed)
    @IBAction func itemStatSwitchTapped(sender: UISwitch) {
        if sender.on {
            yesNoLabel.text = "Yes"
        }
        else{
            yesNoLabel.text = "No"
        }
        
    }

    //image picker
    @IBAction func selectImageFromLibrary(sender: UITapGestureRecognizer) {
        itemNameField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

