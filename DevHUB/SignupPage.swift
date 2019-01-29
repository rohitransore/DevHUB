//
//  SignupPage.swift
//  DevHUB
//
//  Created by Rohit Ransore on 28/01/19.
//  Copyright © 2019 Rohit Ransore. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupPage: ViewController
{

    @IBOutlet weak var EmailTextFieldForNewUser: UITextField!
    @IBOutlet weak var PasswordTextFieldForNewUser: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        configureTextField(x: 0, y: EmailTextFieldForNewUser.frame.size.height-1.0, width: EmailTextFieldOutlet.frame.size.width, height:1.0, textField: EmailTextFieldForNewUser)
    //    configureTextField(x: 0, y: PasswordTextFieldForNewUser.frame.size.height-1.0, width: PasswordTextFieldOutlet.frame.size.width, height:1.0, textField: PasswordTextFieldForNewUser)
    }
    
    
    
    @IBAction func SignupButton(_ sender: AnyObject)
    {
        //Validation on Email and password field.
        if let email = EmailTextFieldForNewUser.text, let pass = PasswordTextFieldForNewUser.text
        {
            
            Auth.auth().createUser(withEmail: email, password: pass)
            { (result, error) in
                
                //check user is not nil
                if result != nil
                {
                    //Result
                    self.performSegue(withIdentifier: "GoToHome", sender: self)
                }
                else
                {
                    //Error
                }
            }
            
        }
    }
    

    

}
