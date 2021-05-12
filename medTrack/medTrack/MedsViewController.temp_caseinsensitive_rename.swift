//
//  medsViewController.swift
//  medTrack
//
//  Created by Student on 2/17/21.
//  Copyright © 2021 Jareds apps. All rights reserved.
//


import UIKit

class MedsViewController: UITableViewController {
    var medStore: MedStore!
    @IBOutlet var editButton: UIBarButtonItem!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.rowHeight = UITableView.automaticDimension
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if medStore.allmeds.count < 1 {
            tabBarController?.tabBar.isHidden = true
        }else{
            tabBarController?.tabBar.isHidden = false
        }
        tableView.reloadData()
    }

    
    func addNewmed() -> Int? {
        let newmed = medStore.createmed(isRandom: false)
        if let index = medStore.allmeds.firstIndex(of: newmed) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
            return index
        }
        return nil
    }
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showMed":
            if let row = tableView.indexPathForSelectedRow?.row {
                let med = medStore.allmeds[row]
                let medDetailViewController = segue.destination as! MedDetailViewController
                medDetailViewController.med = med
               
            }
        case "addMed": 
            if let row = addNewmed() {
                let med = medStore.allmeds[row]
                let medDetailViewController = segue.destination as! MedDetailViewController
                medDetailViewController.med = med
            }
        case .none:
            print("o no")
        case .some(_):
            print("o nono")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medStore.allmeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medCell", for: indexPath) as! MedCell
        let med = medStore.allmeds[indexPath.row]
        cell.nameLabel.text = med.name
        cell.instructLabel.text = med.instruct
        cell.patientLabel.text = med.patientName
        cell.numDoseLabel.text = String(med.numOfDoses)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let med = medStore.allmeds[indexPath.row]
            medStore.removemed(med)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        medStore.movemed(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
