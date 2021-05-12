//
//  LineUpCell.swift
//  medTrack
//
//  Created by Student on 3/23/21.
//  Copyright © 2021 Jareds apps. All rights reserved.
//

import UIKit

class LineUpCell: UITableViewCell {
    @IBOutlet var medName: UILabel!
    @IBOutlet var buttonStack: UIStackView!
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    @IBOutlet var buttonFour: UIButton!
    @IBOutlet var buttonFive: UIButton!
    @IBOutlet var buttonSix: UIButton!
    @IBOutlet var buttonSeven: UIButton!
    @IBOutlet var buttonEight: UIButton!
    @IBOutlet var buttonNine: UIButton!
    @IBOutlet var buttonTen: UIButton!
    @IBOutlet var buttonEleven: UIButton!
    @IBOutlet var buttonTwelve: UIButton!
    @IBOutlet var patientName: UILabel!
    var med : Medication?
    
    
    @IBAction func buttonOnePressed(_ sender: UIButton) {
        buttonOne.isHidden = true
        buttonOne.isEnabled = false
        buttonOne.backgroundColor = UIColor.white
        med?.numOfDoses = (med?.numOfDoses ?? 1) - 1
    }
    @IBAction func buttonTwoPressed(_ sender: UIButton) {
        buttonTwo.isHidden = true
        buttonTwo.isEnabled = false
        buttonTwo.backgroundColor = UIColor.white
        med?.numOfDoses = (med?.numOfDoses ?? 1) - 1

    }
    @IBAction func buttonThreePressed(_ sender: UIButton) {
        buttonThree.isHidden = true
        buttonThree.isEnabled = false
        buttonThree.backgroundColor = UIColor.white
        med?.numOfDoses = (med?.numOfDoses ?? 1) - 1

    }
    @IBAction func buttonFourPressed(_ sender: UIButton) {
        buttonFour.isHidden = true
        buttonFour.isEnabled = false
        buttonFour.backgroundColor = UIColor.white
        med?.numOfDoses = (med?.numOfDoses ?? 1) - 1
    }
    @IBAction func buttonFivePressed(_ sender: UIButton) {
        buttonFive.isHidden = true
        buttonFive.isEnabled = false
        buttonFive.backgroundColor = UIColor.white
        med?.numOfDoses = (med?.numOfDoses ?? 1) - 1

    }
    @IBAction func buttonSixPressed(_ sender: UIButton) {
        buttonSix.isHidden = true
        buttonSix.isEnabled = false
        buttonSix.backgroundColor = UIColor.white
        med?.numOfDoses = (med?.numOfDoses ?? 1) - 1

    }
    @IBAction func buttonSevenPressed(_ sender: UIButton) {
        buttonSeven.isHidden = true
        buttonSeven.isEnabled = false
        buttonSeven.backgroundColor = UIColor.white
        med?.numOfDoses = (med?.numOfDoses ?? 1) - 1

    }
    @IBAction func buttonEightPressed(_ sender: UIButton) {
        buttonEight.isHidden = true
        buttonEight.isEnabled = false
        buttonEight.backgroundColor = UIColor.white
        med?.numOfDoses = (med?.numOfDoses ?? 1) - 1

    }
    
    @IBAction func buttonNinePressed(_ sender: UIButton) {
        buttonNine.isHidden = true
        buttonNine.isEnabled = false
        buttonNine.backgroundColor = UIColor.white
        med?.numOfDoses = (med?.numOfDoses ?? 1) - 1

    }
    @IBAction func buttonTenPressed(_ sender: UIButton) {
        buttonTen.isHidden = true
        buttonTen.isEnabled = false
        buttonTen.backgroundColor = UIColor.white
        med?.numOfDoses = (med?.numOfDoses ?? 1) - 1

    }
    
    @IBAction func buttonElevenPressed(_ sender: UIButton) {
        buttonEleven.isHidden = true
        buttonEleven.isEnabled = false
        buttonEleven.backgroundColor = UIColor.white
        med?.numOfDoses = (med?.numOfDoses ?? 1) - 1


    }
    
    @IBAction func buttonTwelvePressed(_ sender: UIButton) {
        buttonOne.isHidden = true
        buttonOne.isEnabled = false
        buttonTwelve.backgroundColor = UIColor.white
        med?.numOfDoses = (med?.numOfDoses ?? 1) - 1

    }
    

    
   
    
    
}
