//
//  CameraViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-30.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import Analytics

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var imagePicked: UIImageView!
   
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: Functions
    
    @IBAction func openCamera(_ sender: UIButton) {
        createAlert()
    }
    
    // Function to Open Camera
    func cameraOpens(){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("is available")
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            Analytics.shared().track("3: Camera Opened")
        }
    }
    
    // Function to Allow Picture Taken from Camera to be Chosen
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imagePicked.contentMode = .scaleAspectFit
            imagePicked.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    // Alert Confirming if User Wants to Open Camera
    func createAlert() {
        let alert = UIAlertController(title: "Camera Access", message: "Mesmer would like to access your camera", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title:"Don't Allow", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated:true, completion:nil)
        }))
        
        alert.addAction(UIAlertAction(title:"Allow", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated:true, completion:nil)
            self.cameraOpens()
        }))

        self.present(alert, animated:true, completion:nil)
        
    }
}
