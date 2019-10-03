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
        //let detailVC = storyboard?.instantiateViewController(withIdentifier: "AddNewPhoto") as! EntryViewController
        //detailVC.photo = favorite
        //self.navigationController?.show(detailVC, sender: Any?.self)
        //pushViewController(detailVC,animated: true)
        
        let modalViewController = storyboard?.instantiateViewController(withIdentifier: "AddNewPhoto") as! EntryViewController
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)
        
    
    }
    
}

