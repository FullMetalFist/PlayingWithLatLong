//
//  ViewController.swift
//  PlayingWithLatLong
//
//  Created by Michael Vilabrera on 12/28/16.
//  Copyright © 2016 Michael Vilabrera. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var altitude: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    @IBOutlet weak var exitPicker: UIPickerView!
    
    var locationManager: CLLocationManager?
    let exitType = ["Stair", "Easement", "Elevator", "Escalator", "Door"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationGetter()
        exitPicker.delegate = self
        exitPicker.dataSource = self
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
    
    // MARK: CoreLocationDelegate Methods
    
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
    // MARK: PickerViewDataSource Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    // MARK: PickerViewDelegate Methods
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return exitType[row]
    }
    
    
}
