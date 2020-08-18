//
//  FindStoreViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-31.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit
import MapKit

class store: NSObject, MKAnnotation {
  let title: String?
  let descriptions: String?
  let coordinate: CLLocationCoordinate2D

  init(
    title: String?,
    descriptions: String?,
    coordinate: CLLocationCoordinate2D
  ) {
    self.title = title
    self.descriptions = descriptions
    self.coordinate = coordinate

    super.init()
  }

  var subtitle: String? {
    return descriptions
  }
}

class FindStoreViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var findStoreButton: UIButton!
    
    var coordinates: CLLocationCoordinate2D?
    
    var locationManager = CLLocationManager()
    
    let store1 = store(
      title: "Mesmer HQ",
      descriptions: "777 High Street Palo Alto, CA",
      coordinate: CLLocationCoordinate2D(latitude: 37.442250, longitude: -122.160250))
    
    let store2 = store(
      title: "Mesmer HQ2",
      descriptions: "San Francisco",
      coordinate: CLLocationCoordinate2D(latitude: 37.778080, longitude: -122.390869))
    
    let store3 = store(title: "Mesmer Brentwood", descriptions: "Brentwood, CA", coordinate: CLLocationCoordinate2D(latitude: 37.931868, longitude: -121.6957863))
    
    //let store3 = store(title: "Mesmer Toronto", descriptions: "Oh Canada!", coordinate: CLLocationCoordinate2D(latitude: 43.653225, longitude: -79.383186))
    
    let store4 = store(title: "Mesmer SJ", descriptions: "San Jose, CA", coordinate: CLLocationCoordinate2D(latitude: 37.334789, longitude: -121.888138))
    
    //let store4 = store(title: "Mesmer New York", descriptions: "I <3 NYC!", coordinate: CLLocationCoordinate2D(latitude: 40.712776, longitude: -74.005974))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.addAnnotation(store1)
        map.addAnnotation(store2)
        map.addAnnotation(store3)
        map.addAnnotation(store4)
       
        let regionRadius: CLLocationDistance = 100000.0
        let region = MKCoordinateRegion(center: findCenterCoordinate(), latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        map.setRegion(region, animated: true)
        map.delegate = self
    }

    
    @IBAction func findStore(_ sender: UIButton) {
        checkLocationServices()
        findClosestStore()
        /*
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways  {
            
        }
 */
        //regionHasBeenCentered = regionHasBeenCentered && false
    }
    
    func findCenterCoordinate() -> CLLocationCoordinate2D{
        let storeList = [store1, store2, store3, store4]
        //var center: CLLocationCoordinate2D?
        var lat: Double = 0.0
        var long: Double = 0.0
        for store in storeList{
            lat += store.coordinate.latitude
            long += store.coordinate.longitude
        }
        let avgLat = lat/Double(storeList.count)
        let avgLong = long/Double(storeList.count)
        let center = CLLocationCoordinate2D(latitude: avgLat, longitude: avgLong)
        return center
    }
    
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
            map.showsUserLocation = true
            locationManager.startUpdatingLocation()
            //findClosestStore()
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        coordinates = locations[0].coordinate
    }
    
    func findClosestStore(){
        let userLat = coordinates?.latitude
        let userLong = coordinates?.longitude

        if userLat == nil{
            let alert = UIAlertController(title: ("Please allow Mesmer to access your location if you have not already"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            print("run")
            self.present(alert, animated: true, completion: nil)
            return
            
        }

        var latDiff = userLat! - store1.coordinate.latitude
        var longDiff = userLong! - store1.coordinate.longitude
        var diff = (latDiff*latDiff + longDiff*longDiff).squareRoot()
        var closestStore = store1
        
        let storeList = [store2, store3, store4]
        for store in storeList{
            latDiff = userLat! - store.coordinate.latitude
            longDiff = userLong! - store1.coordinate.longitude
            let distanceDiff = (latDiff*latDiff + longDiff*longDiff).squareRoot()
            
            if distanceDiff < diff{
                diff = distanceDiff
                closestStore = store
            }
        }
        
        let regionRadius: CLLocationDistance = 1000.0
        let region = MKCoordinateRegion(center: closestStore.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        map.setRegion(region, animated: true)
        
        
        //switch distance
        
    }
    
}
