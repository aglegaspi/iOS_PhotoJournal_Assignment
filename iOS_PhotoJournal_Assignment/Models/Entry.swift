//
//  Entry.swift
//  iOS_PhotoJournal_Assignment
//
//  Created by Alexander George Legaspi on 10/3/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import Foundation

struct Entry: Codable {
    let image: Data
    let description: String
    let date: String
}
