//
//  Post.swift
//  DevHUB
//
//  Created by Rohit Ransore on 29/03/19.
//  Copyright © 2019 Rohit Ransore. All rights reserved.
//

import Foundation

class Post {
    var id:String
    var pid:String
    var author:UserProfile
    var text:String
    var createdAt:Date
    
    init(id:String, pid:String, author:UserProfile,text:String,timestamp:Double) {
        self.id = id
        self.pid = pid
        self.author = author
        self.text = text
        self.createdAt = Date(timeIntervalSince1970: timestamp / 1000)
    }
}
