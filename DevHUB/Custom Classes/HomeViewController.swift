//
//  HomeViewController.swift
//  DevHUB
//
//  Created by Rohit Ransore on 29/01/19.
//  Copyright © 2019 Rohit Ransore. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    
   override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.reloadData()
        observePosts()
        // Do any additional setup after loading the view.
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! HomeTableViewCell
        cell.set(post: posts[indexPath.row])
        
        return cell
    }

    
    
    func observePosts() {
        let postsRef = Database.database().reference().child("posts")
        
        print("Something")
        postsRef.observe(.value, with: { snapshot in
            
            var tempPosts = [Post]()
            
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String:Any],
                    let author = dict["author"] as? [String:Any],
                    let uid = author["uid"] as? String,
                    let username = author["username"] as? String,
                    //let photoURL = author["photoURL"] as? String,
                    //let url = URL(string:photoURL),
                    let text = dict["text"] as? String,
                    let timestamp = dict["timestamp"] as? Double {
                    
                    let userProfile = UserProfile(uid: uid, username: username)
                    let post = Post(id: childSnapshot.key, author: userProfile, text: text, timestamp:timestamp)
                    tempPosts.append(post)
                }
            }
            
            self.posts = tempPosts
            self.tableView.reloadData()
            
        })
    }
    
    
    
    

}
