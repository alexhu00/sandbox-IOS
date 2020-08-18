//
//  StorageAccessViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-08-10.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class StorageAccessViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        dismiss(animated: true, completion: nil) // instance method of UIViewController
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
       // The image selected is passed through the function as a dictionary with the original image and the edited image. We are simply taking that and setting the original image as the selectedImage while downcasting to ensure it is a UIImage
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Actions
    
    @IBAction func setImage(_ sender: UIButton) {
        print("Tap button")
             //nameTextField.resignFirstResponder() //ensures that if user taps image while typing something, that it leaves the typing, dismisses keyboard
             let imagePickerController = UIImagePickerController() // a view controller that lets user pick photos from their camera roll
             imagePickerController.sourceType = .photoLibrary // Only allow photos to be picked, not taken. Also NOTE: The type of imagePickerController.sourceType is a UIImagePickerControllerSourceType which is enumeration so we can write .photoLibrary instead of UIImagePickerControllerSourceType.photoLibrary
             imagePickerController.delegate = self
                 // Setting delegate as self which is the photo image view (i think)
             present(imagePickerController, animated: true, completion: nil)
    }
}
