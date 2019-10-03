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
    @IBOutlet weak var descriptionTextField: UITextView!
    
    var image = UIImage() {
        didSet {
            imageView.image = image
        }
    }
    
    var descriptionText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextField.delegate = self
        setupTextFieldUI()
    }
    
    
    @IBAction func photoLibraryPressed(_ sender: UIBarButtonItem) {
        
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        present(imagePickerViewController,animated: true, completion: nil)
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let imageData = self.imageView.image?
            .jpegData(compressionQuality: 0.5)
            else { return }
        
        let entry = Entry(image: imageData, description: descriptionText, date: getDate())
        try?
            EntryPersistenceHelper.manager.saveEntry(entry: entry)
        
        dismiss(animated: true)
    }
    
    private func setupTextFieldUI() {
        let blackBorder = UIColor.black
        descriptionTextField.layer.borderColor = blackBorder.cgColor
        descriptionTextField.layer.borderWidth = 1.0
    }
    
    func getDate() -> String {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy HH:mm"
        let output = formatter.string(from: date)
        print(output)
        return String(output)
        
    }
    
}

extension EntryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        } else {
            print("no original image")
        }
        
        dismiss(animated: true)
    }
}

extension EntryViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        descriptionText = textView.text
    }
}
