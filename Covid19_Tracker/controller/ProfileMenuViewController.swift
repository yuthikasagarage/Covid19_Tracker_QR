//
//  ProfileMenuViewController.swift
//  Covid19_Tracker
//
//  Created by Hasara Yaddehige on 5/9/20.
//  Copyright © 2020 Harshana Rathnamalala. All rights reserved.
//

import UIKit
import Firebase
class ProfileMenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        // Do any additional setup after loading the view.
    }
    

    @IBAction func logout(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "loginVC") as? LoginViewController
        
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
        
        
    }
    
    
    
    
    

}
