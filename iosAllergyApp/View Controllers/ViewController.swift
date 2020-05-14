//
//  ViewController.swift
//  iosAllergyApp
//
//  Created by Melissa Nguyen on 5/8/20.
//  Copyright © 2020 Melissa Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpBttn: UIButton!
    
    @IBOutlet weak var loginBttn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()
        
    }

    func setUpElements() {
        Utilities.styleFilledButton(signUpBttn)
        Utilities.styleHollowButton(loginBttn)
        
    }

}

