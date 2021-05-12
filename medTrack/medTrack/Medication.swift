//
//  Medication.swift
//  medTrack
//
//  Created by Student on 2/19/21.
//  Copyright © 2021 Jareds apps. All rights reserved.
//

import UIKit

class Medication: Equatable, Codable {
    
    var name: String
    var instruct: String
    var dosage: String
    let medKey: String
    var patientName: String
    var numOfDoses: Int
    var perDay: Int
    
    static func ==(lhs: Medication, rhs: Medication) -> Bool {
        return lhs.name == rhs.name
            && lhs.instruct == rhs.instruct
            && lhs.dosage == rhs.dosage
    }
    

    
    init(name: String, instruct: String, dosage: String, patientName: String, numOfDoses: Int, perDay: Int) {
        self.name = name
        self.instruct = instruct
        self.dosage = dosage
        self.medKey = UUID().uuidString
        self.patientName = patientName
        self.numOfDoses = numOfDoses
        self.perDay = perDay
    }

    convenience init(random: Bool = false) {
        if random {
            self.init(name: "Ununquazine",
                      instruct: "take daily",
                      dosage: "5 mg",
                      patientName: "Jon/Jane Doe",
                      numOfDoses: 123,
                      perDay:123)
            
        } else {
            self.init(name: "", instruct: "", dosage: "", patientName: "", numOfDoses: 0, perDay: 0)
        }
    }
    
}
