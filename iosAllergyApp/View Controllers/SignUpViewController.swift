//
//  SignUpViewController.swift
//  iosAllergyApp
//
//  Created by Melissa Nguyen on 5/8/20.
//  Copyright © 2020 Melissa Nguyen. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var nameTxtField: UITextField!
    
    @IBOutlet weak var usernameTxtField: UITextField!
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBOutlet weak var signUpBttn: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements(){
        //hide error label
        errorLabel.alpha = 0
        
        //style the elements
        
        Utilities.styleTextField(nameTxtField)
        
        Utilities.styleTextField(usernameTxtField)
        
        Utilities.styleTextField(emailTxtField)
        
        Utilities.styleTextField(passwordTxtField)
        

        Utilities.styleFilledButton(signUpBttn)
        
    }
    
    
    //new method to validate the fields
    //check the fields and validate that the data is correct if everyhting works then this
    //method returns nil or the error msg as a string
    
    func validateField() -> String? {
        
        //check that all fields are filled in
        //remove white space and check if empty
        if nameTxtField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            usernameTxtField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTxtField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTxtField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
            {
            return "Please Fill in all fields."
        }
        
        // check if the password is secure
        //method is in group Helpers in Utilities.swift
        
        let cleanPassword = passwordTxtField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanPassword) == false {
            //password is not secure
            return "Please secure your password it MUST have at least 8 characters, containing special characters and numbers."
        }
        
        return nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signUpTap(_ sender: Any) {
        
        //validate the fields
        
        let error = validateField()
        if error != nil {
            
            //something went wrong show message
            
            showError(error!)
        }
        else {
            //create the user
            
            
            
        }
        
        //transition to home screen
    
    }
    
    func showError(_ message: String ) {
        
                 errorLabel.text = message
                 errorLabel.alpha =  1
    }
    
}
