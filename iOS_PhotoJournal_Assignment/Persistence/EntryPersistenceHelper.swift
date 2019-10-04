//
//  PhotoPersistenceHelper.swift
//  iOS_PhotoJournal_Assignment
//
//  Created by Alexander George Legaspi on 10/3/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import Foundation

struct EntryPersistenceHelper {
    
    private init() {}
    static let manager = EntryPersistenceHelper()
    
    private let persistenceHelper = PersistenceHelper<Entry>(fileName: "entries.plist")
    
    func saveEntry(entry: Entry) throws {
        try persistenceHelper.save(newElement: entry)
    }
    
    func getEntries() throws -> [Entry] {
        return try persistenceHelper.getObjects()
    }
    
    func deleteFavorite(withDescription: String) throws {
        do {
            let entries = try getEntries()
            let newEntries = entries.filter { $0.description != withDescription}
            try persistenceHelper.replace(elements: newEntries)
        }
    }
    
}
