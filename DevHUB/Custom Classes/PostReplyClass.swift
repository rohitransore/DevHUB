//
//  PostReplyClass.swift
//  DevHUB
//
//  Created by Rohit Ransore on 02/04/19.
//  Copyright © 2019 Rohit Ransore. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PostReplyClass: UIViewController
{
    @IBOutlet weak var NewReplyTV: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func HandlePostReply(_ sender: Any)
    {
        UpdatePost(pid: GlobalPostKey, username: UName, text: NewReplyTV.text)
    }
    
    func UpdatePost (pid: String, username:String, text: String)
    {
        let PostRef = Database.database().reference().child("posts/\(pid)/Replies")
        
        let postObject =
            [
                "author":
                        [//"uid": userProfile.uid,
                            "username": username
                        ],
                    "answer" : text,
                    "timestamp": [".sv":"timestamp"]
                
            ] as [String:Any]
        
       
        PostRef.childByAutoId().setValue(postObject, withCompletionBlock: { error, ref in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            } else {
                print("Handle the error")
                // Handle the error
            }
        })

        
        
        
    }
    
}
