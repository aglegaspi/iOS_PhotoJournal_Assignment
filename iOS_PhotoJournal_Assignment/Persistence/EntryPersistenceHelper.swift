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
    
    func deleteFavorite(withID: String) throws {
        do {
            let entries = try getEntries()
            let newEntries = entries.filter { $0.id != withID}
            try persistenceHelper.replace(elements: newEntries)
        }
    }
    
    func editEntry(editEntry: Entry, index: Int) throws {
        do {
            try persistenceHelper.update(updatedElement: editEntry, index: index)
        } catch {
            print(error)
        }
        
    }
    
}
