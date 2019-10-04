//
//  EntryViewController.swift
//  iOS_PhotoJournal_Assignment
//
//  Created by Alexander George Legaspi on 9/29/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    
    var entry: Entry?
    var currentIndex: Int?
    
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
        
        if let entry = entry {
            descriptionTextField.text = entry.description
            imageView.image = UIImage(data: entry.image)
            
        }
        
        //print(entry.id)
        
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
        
        
        if descriptionTextField != nil && imageView != nil {
            update()
            dismiss(animated: true)
        } else {
            save()
            dismiss(animated: true)
        }
        
        
    }
    
    private func setupTextFieldUI() {
        let blackBorder = UIColor.black
        descriptionTextField.layer.borderColor = blackBorder.cgColor
        descriptionTextField.layer.borderWidth = 1.0
    }
    
    private func save() {
        guard let imageData = self.imageView.image?
            .jpegData(compressionQuality: 0.5)
            else { return }
    
            let entry = Entry(id: getIDForEntry(), image: imageData, description: descriptionText, date: getDate())
            try?
                EntryPersistenceHelper.manager.saveEntry(entry: entry)
    }
    
    private func update() {
        
        guard let imageData = self.imageView.image?
                .jpegData(compressionQuality: 0.5)
                else { return }
        
                let entry = Entry(id: getIDForEntry(), image: imageData, description: descriptionText, date: getDate())
                try?
                    EntryPersistenceHelper.manager.editEntry(editEntry: entry, index: currentIndex ?? 0)
    }
    
    private func getDate() -> String {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy HH:mm"
        let output = formatter.string(from: date)
        print(output)
        return String(output)
        
    }
    
    private func getIDForEntry() -> Int {
        
        do {
            let entries = try EntryPersistenceHelper.manager.getEntries()
            let max = entries.map{ $0.id }.max() ?? 0
            return max + 1
        } catch {
            print(error)
        }
        return 1
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
