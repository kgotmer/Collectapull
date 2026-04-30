//
//  AddListItemViewController.swift
//  Collectapull
//
//  Created by Kallam,Poornima on 4/22/26.
//
import UIKit

class AddListItemViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!
    // callback to send data back
    var onCreateItem: ((String, String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.isHidden = true
    }

    

    @IBAction func cancelTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func createTapped(_ sender: UIButton) {

        let name = nameTextField.text?.trimmingCharacters(in: .whitespaces) ?? ""
        let description = descriptionTextField.text?.trimmingCharacters(in: .whitespaces) ?? ""

        // validation
        if name.isEmpty {
            messageLabel.text = "Please enter item name"
            messageLabel.isHidden = false
            return
        }

        // send data back
        onCreateItem?(name, description)

        dismiss(animated: true)
    }
}
