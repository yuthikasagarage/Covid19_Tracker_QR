//
//  AddPersonViewController.swift
//  Covid19_Tracker
//
//  Created by Harshana Rathnamalala on 5/7/20.
//  Copyright © 2020 Harshana Rathnamalala. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    

}
