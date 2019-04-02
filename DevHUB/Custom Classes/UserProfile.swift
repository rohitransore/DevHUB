//
//  UserProfile.swift
//  DevHUB
//
//  Created by Rohit Ransore on 15/03/19.
//  Copyright © 2019 Rohit Ransore. All rights reserved.
//

import Foundation

class UserProfile
{
    var uid:String
    var username:String
    //var photoURL:URL
   
    
    init(uid:String, username:String/*,photoURL:URL*/) {
        self.uid = uid
        self.username = username
        //self.photoURL = photoURL
       
    }
}
