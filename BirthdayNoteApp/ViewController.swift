//
//  ViewController.swift
//  BirthdayNoteApp
//
//  Created by Ömer Faruk Kılıçaslan on 27.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        guard let myName = storedName as? String else {return}
        nameLabel.text = myName
        guard let myBirthday = storedBirthday as? String else {return}
        birthdayLabel.text = myBirthday

    }

    @IBAction func buttonClicked(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text, forKey: "birthday")
        

        
        nameLabel.text = "Name : \(nameTextField.text!)"
        birthdayLabel.text = "Birthday : \(birthdayTextField.text!)"
    }
    @IBAction func deleteButtonClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name :"
        }
        
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday : "
        }
    }
    
}

