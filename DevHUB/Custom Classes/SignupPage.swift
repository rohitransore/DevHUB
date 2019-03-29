//
//  SignupPage.swift
//  DevHUB
//
//  Created by Rohit Ransore on 28/01/19.
//  Copyright © 2019 Rohit Ransore. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignupPage: ViewController
{

    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var EmailTextFieldForNewUser: UITextField!
    @IBOutlet weak var PasswordTextFieldForNewUser: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        configureTextField(x: 0, y: EmailTextFieldForNewUser.frame.size.height-1.0, width: EmailTextFieldOutlet.frame.size.width, height:1.0, textField: EmailTextFieldForNewUser)
//        configureTextField(x: 0, y: PasswordTextFieldForNewUser.frame.size.height-1.0, width: PasswordTextFieldOutlet.frame.size.width, height:1.0, textField: PasswordTextFieldForNewUser)
    }
    
    
    
    @IBAction func SignupBtn(_ sender: UIButton)
    {
        //Validation on Email and password field.
        //if let email = EmailTextFieldForNewUser.text, let pass = PasswordTextFieldForNewUser.text, let usernm = UserName.text
        if EmailTextFieldForNewUser.text != nil, PasswordTextFieldForNewUser.text != nil, UserName.text != nil
        {
            
            Auth.auth().createUser(withEmail: EmailTextFieldForNewUser.text!, password: PasswordTextFieldForNewUser.text!)
            { (result, error) in
                //check user is not nil
                if result != nil
                {
                    //Result
                    print("User Created Successfully!!")
                    
                     let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = self.UserName.text!
                    
                     changeRequest?.commitChanges(completion: { error in
                     if error == nil
                     {
                     
                        self.saveProfile(username: self.UserName.text!) { success in
                            if success {
                                self.dismiss(animated: true, completion: nil)
                            }
                        }
 
                     print("Username Comitted")
                     }
                     else
                     {
                     print("Error")
                     }
                     })
                    self.dismiss(animated: true, completion: nil)
                }
                else
                {
                    //Error
                    print("error")
                }
            }
        
        }
    }
    
    func saveProfile(username:String, completion: @escaping ((_ success:Bool)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let databaseRef = Database.database().reference().child("users/profile/\(uid)")
        
        let userObject = [
            "username": username
            ] as [String:Any]
        
        databaseRef.setValue(userObject) { error, ref in
            completion(error == nil)
        }
    }
    
    
    
    @IBAction func GetBackToLoginPage(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }
    

}
