//
//  UserInfoViewController.swift
//  iosAllergyApp
//
//  Created by Melissa Nguyen on 5/16/20.
//  Copyright © 2020 Melissa Nguyen. All rights reserved.
//

import UIKit
import FirebaseDatabase

class UserInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(handlesSignOutTapp))
             }
    

    @objc func handlesSignOutTapp(){
        print(123)
    }

}
