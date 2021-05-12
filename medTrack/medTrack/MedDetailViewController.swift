//
//  ViewController.swift
//  medTrack
//
//  Created by Student on 2/11/21.
//  Copyright © 2021 Jareds apps. All rights reserved.
//

import UIKit

class MedDetailViewController: UIViewController {
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var dosageField: UITextField!
    @IBOutlet var instructionField: UITextField!
    @IBOutlet var patientNameField: UITextField!
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var numlabel: UILabel!
    @IBOutlet var numOfDosesField: UITextField!
    
    
    var med: Medication! {
        didSet {
            navigationItem.title = med.name
        }
    }
    
    func checkIfEmpty(){
        var textFields = [UITextField]()
        textFields.append(nameField)
        textFields.append(dosageField)
        textFields.append(instructionField)
        textFields.append(patientNameField)
        textFields.append(numOfDosesField)
        textFields.forEach{ textField in
            if textField.hasText == false {
                let alert = UIAlertController(title: "Need input", message: "A text field is empty", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert,animated: true, completion: nil)
            }
        }
    }
    
    func nameFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        return true
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        checkIfEmpty()
        med.name = nameField.text ?? "n/a"
        med.dosage = dosageField.text ?? "n/a"
        med.instruct = instructionField.text ?? "n/a"
        med.patientName = patientNameField.text ?? "n/a"
        if Int(numOfDosesField.text ?? "0") ?? 0 < 900 {
            med.numOfDoses = Int(numOfDosesField.text ?? "0") ?? 0

        } else {
            let alert = UIAlertController(title: "Too many doses", message: "unacceptable input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        med.perDay = Int(numlabel.text ?? "0") ?? 0
        navigationController?.popViewController(animated: true)
    }
   
    @IBAction func stepperstepped(_ sender: UIStepper) {
        numlabel.text = Int(sender.value).description
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameField.text = med.name
        dosageField.text = med.dosage
        instructionField.text = med.instruct
        patientNameField.text = med.patientName
        numlabel.text = String(med.perDay)
        numOfDosesField.text = String(med.numOfDoses)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        
    }
    
}
