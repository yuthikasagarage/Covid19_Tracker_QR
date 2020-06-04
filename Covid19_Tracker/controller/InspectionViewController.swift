//
//  InspectionViewController.swift
//  Covid19_Tracker
//
//  Created by Harshana Rathnamalala on 6/3/20.
//  Copyright © 2020 Harshana Rathnamalala. All rights reserved.
//


import UIKit
import CoreLocation
import RealmSwift
 


class InspectionViewController: UIViewController , CLLocationManagerDelegate, recieve1{
    
    @IBOutlet weak var qridinspection: UITextField!
    @IBOutlet weak var ilocation: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nicTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var remarksTextField: UITextField!
    let realm = try! Realm()
    var selectedPatient: Patient?
    let locationManager = CLLocationManager()
    var qrId: String?
    var location: String?
    func passDataBack1(data: String) {
        qrId = data
    }
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        loadDataOfPatient()
        if let count  = selectedPatient?.remarks.count {
            print(count)
        }
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
            
          location = "latitude = \(locValue.latitude), longitude = \(locValue.longitude)"
      }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_check"{
            let secondview = segue.destination as! CameraViewController
            secondview.delegate1 = self
        }
        
    }
    // need to unwrapping
    @IBAction func submitInspectionButton(_ sender: UIButton) {
        if (qrId == qridinspection.text && location == ilocation.text) {
            if let patient = self.selectedPatient {
                do {
                    try self.realm.write {
                        let remark = Remark()
                        remark.remark = remarksTextField!.text!
                        remark.dateCreated = Date()
                        patient.remarks.append(remark)
                        navigationController?.popViewController(animated: true)
                    }
                } catch {
                    print("error: \(error)")
                }
            }
        } else {
            let alert = UIAlertController(title: "Alert!", message: "Incorrect QR and/or location. Please check the location and scan the QR code which sticked on the door", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func loadDataOfPatient() {
        nameTextField.text = selectedPatient!.name
        addressTextField.text = selectedPatient!.address
        nicTextField.text = selectedPatient!.nic
        qridinspection.text = selectedPatient!.qrId
        ilocation.text = "latitude = \(selectedPatient!.latitude), longitude = \(selectedPatient!.longitide)"
    }
    
    //MARK: - Realm functions
    func saveData(patient: Patient) {
        do {
            try realm.write{
                realm.add(patient)
                print("user added")
            }
        } catch {
            print("Erro: \(error)")
        }
    }
    
}
    
        
  


