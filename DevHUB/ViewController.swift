//
//  ViewController.swift
//  DevHUB
//
//  Created by Rohit Ransore on 28/01/19.
//  Copyright © 2019 Rohit Ransore. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var EmailTextFieldOutlet: UITextField!
    @IBOutlet weak var PasswordTextFieldOutlet: UITextField!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Getting Underline below Text Fields
        configureTextField(x: 0, y: EmailTextFieldOutlet.frame.size.height-1.0, width: EmailTextFieldOutlet.frame.size.width, height:1.0, textField: EmailTextFieldOutlet)
        configureTextField(x: 0, y: PasswordTextFieldOutlet.frame.size.height-1.0, width: PasswordTextFieldOutlet.frame.size.width, height:1.0, textField: PasswordTextFieldOutlet)
    }
    
    //Configureing text field and putting underlines
    func configureTextField(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,textField:UITextField)
        
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: x, y: y, width: width, height: height)
        //bottomLine.backgroundColor = UIColor.black.cgColor
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        
        
    }


}

