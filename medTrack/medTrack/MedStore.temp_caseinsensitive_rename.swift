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
    
    @discardableResult func createmed(isRandom: Bool) -> Medication {
        let newmed = Medication(random: isRandom)
        allmeds.append(newmed)
        return newmed
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
        let movedmed = allmeds[fromIndex]
        allmeds.remove(at: fromIndex)
        allmeds.insert(movedmed, at: toIndex)
    }
    
    @objc func saveChanges() -> Bool {
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(allmeds)
            try data.write(to: medArchiveURL)
            return true
        } catch let encodingError {
            print("Error encoding allmeds: \(encodingError)")
            return false
        }
    }
    
}
