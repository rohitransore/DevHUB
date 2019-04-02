//
//  ComposeViewController.swift
//  DevHUB
//
//  Created by Rohit Ransore on 19/02/19.
//  Copyright © 2019 Rohit Ransore. All rights reserved.
//

import UIKit
import Firebase

class ComposeViewController: UIViewController
{
    //@IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var QuestionTextField: UITextView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //self.ImgView.layer.cornerRadius = self.ImgView.frame.size.width / 2;
        //self.ImgView.clipsToBounds = true;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CancelBarButton(_ sender: UIBarButtonItem)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    @IBAction func HandlePostButton()
    {
        
        guard let userProfile = UserService.currentUserProfile else { return }
        // Firebase code here
        print("Runing")
        let postRef = Database.database().reference().child("posts");
        let key = postRef.childByAutoId().key
        
        
        let postObject = [
            "pid": key!,
            "author": [
                "uid": userProfile.uid,
                "username": userProfile.username
                
            ],
            "text": QuestionTextField.text,
            "timestamp": [".sv":"timestamp"]
            ] as [String:Any]
        
        
        postRef.child(key!).setValue(postObject, withCompletionBlock: { error, ref in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            } else {
                print("Handle the error")
                // Handle the error
            }
        })
        
    }
    
    
   

}
