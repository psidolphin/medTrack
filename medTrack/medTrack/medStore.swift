//
//  medStore.swift
//  medTrack
//
//  Created by Student on 2/25/21.
//  Copyright © 2021 Jareds apps. All rights reserved.
//


import UIKit

class MedStore {
    
    var allmeds = [Medication]()
    let medArchiveURL: URL = {
        let documentsDirectories =
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("meds.plist")
    }()
    
    init() {
        do {
            let data = try Data(contentsOf: medArchiveURL)
            let unarchiver = PropertyListDecoder()
            let meds = try unarchiver.decode([Medication].self, from: data)
            allmeds =  meds
        } catch {
            print("Error reading in saved meds: \(error)")
        }
        
        let nc = NotificationCenter.default
        nc.addObserver(self,
                       selector: #selector(saveChanges),
                       name: UIApplication.didEnterBackgroundNotification,
                       object: nil)
    }
    

    
    func removemed(_ med: Medication) {
        if let index = allmeds.firstIndex(of: med) {
            allmeds.remove(at: index)
        }
    }
    
    func movemed(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        // Get reference to object being moved so you can reinsert it
        let movedmed = allmeds[fromIndex]
        
        // Remove med from array
        allmeds.remove(at: fromIndex)
        
        // Insert med in array at new location
        allmeds.insert(movedmed, at: toIndex)
    }
    
    @objc func saveChanges() -> Bool {
        print("Saving meds to: \(medArchiveURL)")
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(allmeds)
            try data.write(to: medArchiveURL)
            print("Saved all of the meds")
            return true
        } catch let encodingError {
            print("Error encoding allmeds: \(encodingError)")
            return false
        }
    }
    
}
