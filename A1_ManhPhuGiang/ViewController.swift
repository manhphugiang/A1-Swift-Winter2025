//
//  ViewController.swift
//  A1_ManhPhuGiang
//
//  Created by ManhPhu Giang on 2025-02-16.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()

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

    func numberOfComponents(in _: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent _: Int) {
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

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent _: Int) -> Int {
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

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent _: Int) -> String? {
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

    @IBAction func submitBtnPressed(_: UIButton) {
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

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "goToVCTwo" {
            print("Segue triggered!")

            if let vcTwo = segue.destination as? ViewControllerTwo {
                vcTwo.stringText = """
                Your first name is \(firstNameTextField.text ?? "") and your last name is \(lastNameTextField.text ?? "").
                Your nickname is \(nickNameTextField.text ?? "").
                Your age is \(ageLabel.text ?? ""). You live at \(addressTextField.text ?? ""), in the city of \(cityTextField.text ?? ""), in \(selectedProvince), \(selectedCountry).
                Your postal code is \(postalCodeTextField.text ?? "").
                Your email is \(emailTextField.text ?? "").
                Your gender is \(selectedGender).
                You work as \(occupationTextField.text ?? "").
                \(attendSheridanCollegeSwitch.isOn ? "This is a Sheridan College student" : "This is not a Sheridan College student")
                """
            }
        }
    }
}
