//
//  ViewController.swift
//  Covid19_Tracker
//
//  Created by Harshana Rathnamalala on 5/5/20.
//  Copyright © 2020 Harshana Rathnamalala. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var usename: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        
       // self.navigationItem.rightBarButtonItem = calculateButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
        func ValidateFields() -> String? {
        
        if  usename.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
            
            {
            return "Please fill all the fields"
            
        }
        
        let cleaned = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if validPassword(cleaned) == false {
            
            return "Please use a stronger password of 8 characters, which contains special character and a number"
        }
        
        return nil
    }

  
    @IBAction func sign_tapped(_ sender: Any) {
        
    }
    
    
    
    
    
    @IBAction func Login_tapped(_ sender: Any) {
        
        
        if ValidateFields() != nil {
            usename.text = "please enter a valid username"
            password.text = "please enter a valid password "
        }else{
            
            let password1 = password.text
            let username = usename.text
            
            Auth.auth().signIn(withEmail: (username)!, password: (password1)!) { (AuthDataResult, Error) in
                
                if Error != nil{
                    self.usename.text = "invalid username or"
                    self.password.text = "invalid password "
                
                }else{
                    
                    let mainViewController1 = "mainvc"

                    let homeView = self.storyboard?.instantiateViewController(withIdentifier: mainViewController1) as?
                     mainViewController
                     
                     
                    let nav = UINavigationController(rootViewController: homeView!)
                     
                     nav.navigationBar.barTintColor = UIColor.init(displayP3Red: 120.0/255.0, green:117.0/255.0 , blue: 173.0/255.0, alpha: 1.0)
                     
                    self.view.window?.rootViewController = nav
                    self.view.window?.makeKeyAndVisible()
                }
            }
            }
        }
    }
    


