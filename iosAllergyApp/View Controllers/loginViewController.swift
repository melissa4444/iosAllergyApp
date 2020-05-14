//
//  loginViewController.swift
//  iosAllergyApp
//
//  Created by Melissa Nguyen on 5/8/20.
//  Copyright © 2020 Melissa Nguyen. All rights reserved.
//

import UIKit
import FirebaseAuth
class loginViewController: UIViewController {

   
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    
    
    @IBOutlet weak var passwordTxtField: UITextField!
    
    
 
    @IBOutlet weak var loginBttn: UIButton!
    
    
    
    @IBOutlet weak var errorlabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
        
        
        
        
        
    }
    
    func setUpElements() {
        errorlabel.alpha=0
        
        //style the elements
        
        Utilities.styleTextField(emailTxtField)
        Utilities.styleTextField(passwordTxtField)
        Utilities.styleFilledButton(loginBttn)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func loginTap(_ sender: Any) {
        
        //todo validate text field
        
        //create cleaned fields
        let email  = emailTxtField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTxtField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //signing in the user
        
  Auth.auth().signIn(withEmail: email,
                     password: password) { (result, error) in
       
       if error != nil {
           // Couldn't sign in
           self.errorlabel.text = error!.localizedDescription
           self.errorlabel.alpha = 1
       }
       else {
           
           let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
           
           self.view.window?.rootViewController = homeViewController
           self.view.window?.makeKeyAndVisible()
       }
   }
        
    }
    
}
