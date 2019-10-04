//
//  CollectionViewCell.swift
//  iOS_PhotoJournal_Assignment
//
//  Created by Alexander George Legaspi on 9/29/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import UIKit

protocol CollectionViewCellDelegate: AnyObject {
    func actionSheet(tag: Int) // signature
}

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var optionsButton: UIButton!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var photoName: UILabel!
    @IBOutlet weak var photoDate: UILabel!
    
    weak var delegate: CollectionViewCellDelegate?
    
    @IBAction func optionsButtonPressed(_ sender: UIButton) {
        
        delegate?.actionSheet(tag: sender.tag)
    }
    
}
