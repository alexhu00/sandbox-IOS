//
//  LocationViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-08.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Analytics

class LocationViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var coordinates: UILabel!
    
    var regioninMeters: Double = 10000
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func centerViewOnUserLocation(){
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regioninMeters, longitudinalMeters: regioninMeters)
            map.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
            map.showsUserLocation = true
            locationManager.startUpdatingLocation()
        }
        else{
            //locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            //centerViewOnUserLocation()
            break
        case .denied:
            locationManager.requestWhenInUseAuthorization()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
    
    var regionHasBeenCentered = true
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if !regionHasBeenCentered{
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
            self.map.setRegion(region, animated: true)
            regionHasBeenCentered = true
        }
        coordinates.text = "\(Double(round(100*locations[0].coordinate.latitude))/100), \(Double(round(100*locations[0].coordinate.longitude))/100)"
    }
    
    @IBAction func showLocation(_ sender: UIButton) {
        Analytics.shared().track("5: Show Location Button Pressed")
        checkLocationServices()
        regionHasBeenCentered = regionHasBeenCentered && false
    }
    
}
