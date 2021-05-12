//
//  LineUpTableView.swift
//  medTrack
//
//  Created by Student on 3/23/21.
//  Copyright © 2021 Jareds apps. All rights reserved.
//

import UIKit

class LineUpTableViewController: UITableViewController {
    var medStore: MedStore!
    //function to check current date:
    //needs a collection, just an array of medications.
    //each 24 hours clear the array
    //display date at the top of the nav bar
    //
    var lineup = [Medication]()
    
    //Function to go through the list of medication, find the ones that fit the criteria daily, add them to a collection and pass the collection over to the lineupviewController
    //if medication schedule is daily, send it on over to the collection.
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    
    
    func findbySchedule() {
        var temp = [Medication]()
        medStore.allmeds.forEach {med in
            if med.schedule == "Daily"{
                temp.append(med)
            }
        }
        // pass the temp array over to lineup view controller
        lineup = temp
        
    }
    
    
    
    
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lineupCell", for: indexPath) as! LineUpCell
        let med = lineup[indexPath.row]
        cell.medName.text = med.name
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentDate = Date()
        let formatter =  DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        findbySchedule()
    }
    
    
}
