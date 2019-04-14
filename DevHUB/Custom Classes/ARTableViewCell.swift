//
//  ARTableViewCell.swift
//  DevHUB
//
//  Created by Rohit Ransore on 03/04/19.
//  Copyright © 2019 Rohit Ransore. All rights reserved.
//

import UIKit


class ARTableViewCell: UITableViewCell
{
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var ReplyLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(post: Replies)
    {
        Name.text = post.author.username
        ReplyLabel.text = post.text
        TimeLabel.text = post.createdAt.calenderTimeSinceNow()
        print(Name)
        print(ReplyLabel)
        //subtitleLabel.text = post.createdAt.calenderTimeSinceNow()
        //PostIDTextLabel.text = post.pid
    }

}
