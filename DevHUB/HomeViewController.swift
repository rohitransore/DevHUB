//
//  HomeViewController.swift
//  DevHUB
//
//  Created by Rohit Ransore on 29/01/19.
//  Copyright © 2019 Rohit Ransore. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    let Names = ["Rohit Ransore" , "Vishwas Soni" , "Shriyasnsh"]
    
   override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (Names.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! HomeTableViewCell
        
        cell.NameTextLabel.text = Names[indexPath.row]
        
        return (cell)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
