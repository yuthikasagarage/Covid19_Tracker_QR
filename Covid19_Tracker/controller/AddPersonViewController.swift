//
//  AddPersonViewController.swift
//  Covid19_Tracker
//
//  Created by Harshana Rathnamalala on 5/7/20.
//  Copyright © 2020 Harshana Rathnamalala. All rights reserved.
//

import UIKit
import CoreLocation

 


class AddPersonViewController: UIViewController , CLLocationManagerDelegate, recieve{
    func passDataBack(data: String) {
        print(data + "hooray")
        qrid.text = data
    }
    

   var qrcode = ""
    
    @IBOutlet weak var qrid: UITextField!
    
    
    let locationManager = CLLocationManager()
    @IBOutlet weak var lblocation: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    

    
    @IBAction func location_tapped(_ sender: Any) {
        
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
            
          lblocation.text = "latitude = \(locValue.latitude), longitude = \(locValue.longitude)"
      }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "qrsegue"{
            let secondview = segue.destination as! CameraViewController
            secondview.delegate = self
        }
        
    }
}
    
        
  

