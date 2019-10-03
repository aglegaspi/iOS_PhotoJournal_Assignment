//
//  EntryViewController.swift
//  iOS_PhotoJournal_Assignment
//
//  Created by Alexander George Legaspi on 9/29/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image = UIImage() {
        didSet {
            imageView.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func photoLibraryPressed(_ sender: UIBarButtonItem) {
        
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        present(imagePickerViewController,animated: true, completion: nil)
    }
    
    
    
}

extension EntryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("\ninfo: \(info)\n") // keys: UIImagePickerController.InfoKey.originalImage
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            print("no image found")
            return
        }
        self.image = image
        dismiss(animated: true, completion: nil)
    }
}

