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
    //each 24 hours clear the array
    @IBOutlet var currentDate: UILabel!
    
    //add a property observer
   
    
    
    
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addtoTableView() {
        let med = medStore.allmeds.first
        if let index = medStore.allmeds.firstIndex(of: med!) { 
            let indexPath = IndexPath(row: index, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    //add some kind of method that checks the buttonStack, if it is empty that means we have taken all the doses for the day and that means delete the cell
    
    func perDayButtons(cell: LineUpCell, medication: Medication) {
        let buttonsToShowCount = medication.perDay
        var i = 0
        while i < cell.buttonStack.arrangedSubviews.count {
            if i >= buttonsToShowCount {
                cell.buttonStack.arrangedSubviews[i].backgroundColor = UIColor.white
            }
            i += 1
        }
        cell.buttonStack.isHidden = false
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medStore.allmeds.count
    }
    
    /*func checkPressSubtract(cell: LineUpCell, medication: Medication) {
        cell.buttonStack.arrangedSubviews.forEach{ button in
            if button.isHidden == true {
               medication.numOfDoses = medication.numOfDoses - 1
            }
        }
    }*/
    // add the internal clock or whatever to refresh the list every 24 hours
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todayCell", for: indexPath) as! LineUpCell
        //let cell = LineUpCell.init(medication: medStore.allmeds[indexPath.row])
        cell.buttonStack.isHidden = true
        let med = medStore.allmeds[indexPath.row]
        cell.med = med
        cell.medName.text = med.name
        cell.patientName.text = med.patientName
        perDayButtons(cell: cell, medication: med)
      
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        medStore.movemed(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //try putting the day
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        let formatter =  DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        formatter.dateFormat = "EEEE"
        //var dayInWeek = formatter.string(from: date)
        currentDate.text = formatter.string(from: date)
        addtoTableView()
        
    }
    // check if it is the right day, if it was monday and now it is tuesday change everything.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
    }
    
    
}
