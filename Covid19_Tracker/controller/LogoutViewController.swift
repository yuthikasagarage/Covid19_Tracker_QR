//
//  LogoutViewController.swift
//  Covid19_Tracker
//
//  Created by Hasara Yaddehige on 6/2/20.
//  Copyright © 2020 Harshana Rathnamalala. All rights reserved.
//

import UIKit

class LogoutViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        // Do any additional setup after loading the view.
    }
    

    @IBAction func logout_tapped(_ sender: Any) {
        variable.status = false
        Switcher.updateRootVC()
        let newViewObject = self.storyboard?.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController //LoginPageViewController is my login view file, and identifier also has the same name.
        self.navigationController?.pushViewController(newViewObject, animated: true)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
