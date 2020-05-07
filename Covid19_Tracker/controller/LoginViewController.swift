//
//  ViewController.swift
//  Covid19_Tracker
//
//  Created by Harshana Rathnamalala on 5/5/20.
//  Copyright © 2020 Harshana Rathnamalala. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let calculateButton = UIBarButtonItem(title: "Calculate", style: .plain, target: self, action: #selector(addTapped))
        
        self.navigationItem.rightBarButtonItem = calculateButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func addTapped() {
    }


}

