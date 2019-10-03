//
//  ViewController.swift
//  iOS_PhotoJournal_Assignment
//
//  Created by Alexander George Legaspi on 9/29/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addImageButtonPress(_ sender: UIBarButtonItem) {
        
        //let favorite = favorites[indexPath.row]
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "AddNewPhoto") as! EntryViewController
        //detailVC.photo = favorite
        self.navigationController?.pushViewController(detailVC,animated: true)
    }
    
}

