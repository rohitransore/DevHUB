//
//  HomeTableViewCell.swift
//  DevHUB
//
//  Created by Rohit Ransore on 29/01/19.
//  Copyright © 2019 Rohit Ransore. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell
{
    @IBOutlet weak var NameTextLabel: UILabel!
    @IBOutlet weak var QuestionPreviewTextField: UITextView!
    
    
    @IBOutlet weak var ImageView: UIImageView!
    
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.ImageView.layer.cornerRadius = self.ImageView.frame.size.width / 2;
        self.ImageView.clipsToBounds = true;
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(post: Post)
    {
        NameTextLabel.text = post.author.username
        QuestionPreviewTextField.text = post.text
        
    }

}
