//
//  ViewController.swift
//  PlayingWithLatLong
//
//  Created by Michael Vilabrera on 12/28/16.
//  Copyright © 2016 Michael Vilabrera. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var altitude: UILabel!
    @IBOutlet weak var speed: UILabel!
    var locationManager: CLLocationManager?
    var startLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationGetter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationGetter() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let errorAlert: UIAlertController = UIAlertController(title: "Error!", message: "There is a problem: \(error)", preferredStyle: .alert)
        
        errorAlert.show(self, sender: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else {
            return
        }
        
        latitude.text = String(format: "%.8f", currentLocation.coordinate.latitude)
        longitude.text = String(format: "%.8f", currentLocation.coordinate.longitude)
        altitude.text = String(format: "%.0f m", currentLocation.altitude)
        speed.text = String(format: "%.1f m/s", currentLocation.speed)
    }
    
    func isLocationAuthorized() -> Bool {
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if (authorizationStatus == CLAuthorizationStatus.authorizedAlways || authorizationStatus == CLAuthorizationStatus.authorizedWhenInUse) {
            return true
        }
        else {
            return false
        }
    }
}
