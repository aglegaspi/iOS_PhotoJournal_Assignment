//
//  ViewController.swift
//  iOS_PhotoJournal_Assignment
//
//  Created by Alexander George Legaspi on 9/29/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var entriesCollectionView: UICollectionView!
    
    private var entries = [Entry]() {
        didSet {
            entriesCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        loadEntries()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadEntries()
    }

    @IBAction func addImageButtonPress(_ sender: UIBarButtonItem) {
        
        let modalViewController = storyboard?.instantiateViewController(withIdentifier: "AddNewPhoto") as! EntryViewController
        modalViewController.modalPresentationStyle = .currentContext
        present(modalViewController, animated: true, completion: nil)
    }
    
    private func configureCollectionView() {
        entriesCollectionView.delegate = self
        entriesCollectionView.dataSource = self
    }
    
    private func loadEntries() {
        do {
            entries = try EntryPersistenceHelper.manager.getEntries()
        } catch {
            print(error)
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = entriesCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
        let entry = entries[indexPath.item]
        cell.delegate = self
        cell.optionsButton.tag = indexPath.item
        cell.photoDate.text = entry.date
        cell.photoName.text = entry.description
        cell.photoView.image = UIImage(data: entry.image)
        
        return cell
    }
    
    
}

extension ViewController: CollectionViewCellDelegate {
    
    func actionSheet(tag: Int) {
        
        let optionMenu = UIAlertController(title: "Options", message: "Choose Option", preferredStyle: .actionSheet)
        
        // DELETE
        let delete = UIAlertAction(title: "Delete", style: .destructive) { (action) in
            
            let entry = self.entries[tag]
            //self.entries.remove(at: tag)
            
            do {
                try EntryPersistenceHelper.manager.deleteFavorite(withDescription: entry.description)
            } catch {
                print(error)
            }
        }
        
        // EDIT
        let edit = UIAlertAction(title: "Edit", style: .default) { (_) in
            // edit functionality
        }
        
        // SHARE
        let share = UIAlertAction(title: "Share", style: .default) { (_) in
            //activity view controller
        }
        
        // CANCEL
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        optionMenu.addAction(delete)
        optionMenu.addAction(edit)
        optionMenu.addAction(share)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu,animated: true,completion: nil)
    }
}

