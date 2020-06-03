//
//  InspectionViewController.swift
//  Covid19_Tracker
//
//  Created by Harshana Rathnamalala on 6/3/20.
//  Copyright © 2020 Harshana Rathnamalala. All rights reserved.
//


import UIKit
import CoreLocation

 


class InspectionViewController: UIViewController , CLLocationManagerDelegate, recieve1{
    func passDataBack1(data: String) {
        qridinspection.text = data
    }
    
    var receivedData = ""
   
    @IBOutlet weak var qridinspection: UITextField!
    
    @IBOutlet weak var ilocation: UITextField!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @IBAction func location_tapped1(_ sender: Any) {
        getCurrentLocation()
    }
    
    func getCurrentLocation() {
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
          
             guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {
              
              return
              
          }
            
          ilocation.text = "latitude = \(locValue.latitude), longitude = \(locValue.longitude)"
      }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_check"{
            let secondview = segue.destination as! CameraViewController
            secondview.delegate1 = self
        }
        
    }
}
    
        
  


