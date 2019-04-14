//
//  QuestionPage.swift
//  DevHUB
//
//  Created by Rohit Ransore on 21/02/19.
//  Copyright © 2019 Rohit Ransore. All rights reserved.
//

import UIKit

var GlobalPostKey: String!
var UName: String!

class QuestionPage: UIViewController {
    
    @IBOutlet weak var QPNameLabel: UILabel!
    @IBOutlet weak var QPTextView: UITextView!
    @IBOutlet weak var PostKey: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        set(post: posts[myIndex])
        //print(GlobalPostKey)
        // Do any additional setup after loading the view.
    }
    
    func set(post: Post)
    {
        QPNameLabel.text = UserService.currentUserProfile?.username
        UName = UserService.currentUserProfile?.username
        QPTextView.text = post.text
        PostKey.text = post.pid
        GlobalPostKey = PostKey.text
    }
    
    


}
