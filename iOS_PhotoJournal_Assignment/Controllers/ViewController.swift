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
        
        //let favorite = favorites[indexPath.row]
        //let detailVC = storyboard?.instantiateViewController(withIdentifier: "AddNewPhoto") as! EntryViewController
        //detailVC.photo = favorite
        //self.navigationController?.show(detailVC, sender: Any?.self)
        //pushViewController(detailVC,animated: true)
        
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
        
        cell.photoDate.text = entry.date
        cell.photoName.text = entry.description
        print(entry.description)
        cell.photoView.image = UIImage(data: entry.image)
        
        return cell
    }
    
    
}

