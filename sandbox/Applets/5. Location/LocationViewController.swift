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
        checkLocationServices()
        regionHasBeenCentered = regionHasBeenCentered && false
    }
    
}

/*
 
 func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
     if mapView.region.span.latitudeDelta <= 40 && mapView.region.span.longitudeDelta <= 40 {
          let minimumSpan = MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
         let minimumRegion = MKCoordinateRegion(center: mapView.centerCoordinate, span: minimumSpan)
          mapView.setRegion(minimumRegion, animated: false)
     }
 }
 
 if CLLocationManager.locationServicesEnabled() == true{
     if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .notDetermined {
         locationManager.requestWhenInUseAuthorization()
     }
     locationManager.desiredAccuracy = 1.0
     locationManager.delegate = self
     locationManager.startUpdatingLocation()
 }
 else{
     print("turn on location")
 }
 
 
 // MARK: Delegate Funcs
 
 func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
     let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
     self.map.setRegion(region, animated: true)
 }
 
 func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
     print("unable to access location")
 }

 
 
 
 */
