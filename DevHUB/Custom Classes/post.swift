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
    var author:UserProfile
    var text:String
    var timestamp:Double
    
    init(id:String, author:UserProfile,text:String,timestamp:Double) {
        self.id = id
        self.author = author
        self.text = text
        self.timestamp = timestamp
    }
}
