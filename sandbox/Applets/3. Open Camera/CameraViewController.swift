//
//  CameraViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-06-30.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

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
    
    func cameraOpens(){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("is available")
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imagePicked.contentMode = .scaleAspectFit
            imagePicked.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
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


/*
    switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized: // The user has previously granted access to the camera.
            self.setupCaptureSession()
        
        case .notDetermined: // The user has not yet been asked for camera access.
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    self.setupCaptureSession()
                }
            }
        
        case .denied: // The user has previously denied access.
            return

        case .restricted: // The user can't grant access due to restrictions.
            return
    }
    
    
   private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
       let image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as! UIImage
       imagePicked.image = image
       dismiss(animated:true, completion: nil)
   }

*/
