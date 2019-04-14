//
//  AllRepliesPage.swift
//  DevHUB
//
//  Created by Rohit Ransore on 02/04/19.
//  Copyright © 2019 Rohit Ransore. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AllRepliesPage: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var replies = [Replies]()

    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        tableViewOutlet.reloadData()
        observeReplies()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return replies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Rcell = tableView.dequeueReusableCell(withIdentifier: "ReplyCell", for: indexPath) as! ARTableViewCell
        Rcell.set(post: replies[indexPath.row])
        
        return Rcell
    }
    
    
    

    func observeReplies() {
        let repliesRef = Database.database().reference().child("posts").child(GlobalPostKey!).child("Replies")
        
        //print("Something")
     /*   repliesRef.observe(.childAdded, with: { snapshot in
            
            var tempReply = [Replies]()
            
            
            for child in snapshot.children {
                print("For loop working")
                if let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String:Any],
                    let author = dict["author"] as? [String:Any],
                    //let uid = author["uid"] as? String,
                    let username = author["username"] as? String,
                    //let photoURL = author["photoURL"] as? String,
                    //let url = URL(string:photoURL),
                    //let pid = dict["pid"] as? String,
                    let text = dict["answer"] as? String,
                    let timestamp = dict["timestamp"] as? Double {
                    
                    let userProfile = ReplyUserProfile(username: username)
                    let replies = Replies(id: childSnapshot.key, author: userProfile, text: text, timestamp:timestamp)
                    tempReply.append(replies)
                    print(dict)
                }
                print("Not Worked")
            }
            print("For loop not")
            
            
            self.replies = tempReply
            self.tableViewOutlet.reloadData()
            
        })*/
        
        repliesRef.observe(.value) { (snapshot) in
            
        
        //repliesRef.observeSingleEvent(of: .childAdded) { (snapshot) in
            var tempReply = [Replies]()
            
            
            for child in snapshot.children {
                //print("For loop working 1")
                if let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String:Any],
                    let author = dict["author"] as? [String:Any],
                    //let uid = author["uid"] as? String,
                    let username = author["username"] as? String,
                    //let photoURL = author["photoURL"] as? String,
                    //let url = URL(string:photoURL),
                    //let pid = dict["pid"] as? String,
                    let text = dict["answer"] as? String,
                    let timestamp = dict["timestamp"] as? Double
                    {
                    print("Worked")
                    let userProfile = ReplyUserProfile(username: username)
                    let replies = Replies(id: childSnapshot.key, author: userProfile, text: text, timestamp:timestamp)
                    tempReply.append(replies)
                    //print(dict)
                }
                else
                {
                    print("Not Worked")
                }
                
            }
            //print("For loop not")
            
            
            self.replies = tempReply
            self.tableViewOutlet.reloadData()
        }
        
    }

}
