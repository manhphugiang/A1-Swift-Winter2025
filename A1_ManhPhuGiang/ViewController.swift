//
//  ViewController.swift
//  A1_ManhPhuGiang
//
//  Created by ManhPhu Giang on 2025-02-16.
//

import UIKit

class ViewController:UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        genderPicker.delegate = self
        genderPicker.dataSource = self
        
        genderPicker.isUserInteractionEnabled = true
        
        countryPicker.delegate = self
        countryPicker.dataSource = self
        
        countryPicker.isUserInteractionEnabled = true
        
        provincePicker.dataSource = self
        provincePicker.delegate = self
        
        provincePicker.isUserInteractionEnabled = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == genderPicker {
            
            selectedGender = genders[row] as String
            
        }
        
        if pickerView == provincePicker {
            
            selectedProvince = provinces[row] as String
            
        }
        
        if pickerView == countryPicker {
            
            selectedCountry = countries[row] as String
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == genderPicker {
            return 2
        }
        
        if pickerView == provincePicker {
            return 4
        }
        
        if pickerView == countryPicker {
            return 3
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == genderPicker {
            if row == 0 {
                return genders[0]
            }
            if row == 1 {
                return genders[1]
            }
        }
        
        if pickerView == countryPicker {
            if row == 0 {
                return countries[0]
            }
            if row == 1 {
                return countries[1]
            }
            if row == 2 {
                return countries[2]
            }
        }
        
        if pickerView == provincePicker {
            if row == 0 {
                return provinces[0]
            }
            if row == 1 {
                return provinces[1]
            }
            if row == 2 {
                return provinces[2]
            }
            if row == 3 {
                return provinces[3]
            }
        }
        return "None"
        
    }
    
    
    var provinces = ["Ontario", "Alberta", "British Columbia", "Quebec"]
    var genders = ["Male", "Female"]
    var countries = ["Canada", "USA", "Mexico"]
    
    var selectedProvince = " "
    var selectedGender = " "
    var selectedCountry = " "
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var postalCodeTextField: UITextField!
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var nickNameTextField: UITextField!
    @IBOutlet var occupationTextField: UITextField!
    
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var postalCodeLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var nickNameLabel: UILabel!
    @IBOutlet var occupationLabel: UILabel!
    
    @IBOutlet var ageLabel: UILabel!
    
    
    @IBOutlet var attendSheridanCollegeSwitch: UISwitch!
    @IBAction func switchSheridanToggled(_ sender: UISwitch) {
        if sender.isOn {
            print("This is a Sheridan College student")
        } else {
            print("This is not a Sheridan College student")
        }
    }
    
    
    @IBOutlet var countryPicker: UIPickerView!
    @IBOutlet var provincePicker: UIPickerView!
    @IBOutlet var genderPicker: UIPickerView!
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        ageLabel.text = "\(Int(sender.value))"
    }
    
    
    @IBAction func submitBtnPressed(_ sender: UIButton) {
        print(firstNameTextField.text)
        print(lastNameTextField.text)
        print(addressTextField.text)
        print(cityTextField.text)
        print(provincePicker.selectedRow(inComponent: 0))
        print(postalCodeTextField.text)
        print(countryPicker.selectedRow(inComponent: 0))
        print(ageLabel.text)
        print(emailTextField.text)
        print(genderPicker.selectedRow(inComponent: 0))
        print(occupationTextField.text)
        if attendSheridanCollegeSwitch.isOn {
            print("This is a Sheridan College student")
        } else {
            print("This is not a Sheridan College student")
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToVCTwo" {
            print("Segue triggered!")
            
            if let vcTwo = segue.destination as? ViewControllerTwo {
                vcTwo.stringText = """
                             Your first name is \(firstNameTextField.text ?? "N/A") and your last name is \(lastNameTextField.text ?? "N/A").
                             Your age is \(ageLabel.text ?? "N/A"). You live at \(addressTextField.text ?? "N/A"), in the city of \(cityTextField.text ?? "N/A"), in \(provinces[provincePicker.selectedRow(inComponent: 0)]), \(countries[countryPicker.selectedRow(inComponent: 0)]).
                             Your postal code is \(postalCodeTextField.text ?? "N/A").
                             Your email is \(emailTextField.text ?? "N/A").
                             Your gender is \(genders[genderPicker.selectedRow(inComponent: 0)]).
                             You work as \(occupationTextField.text ?? "N/A").
                             \(attendSheridanCollegeSwitch.isOn ? "This is a Sheridan College student" : "This is not a Sheridan College student")
                             """
                         }
                     }
                 }
}
