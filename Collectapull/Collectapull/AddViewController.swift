//
//  AddViewController.swift
//  placeholder
//
//  Created by Dolan,Allison L on 3/28/26.
//

import UIKit

class AddViewController: UIViewController,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //text fields
    @IBOutlet weak var nameTV: UITextField!
    @IBOutlet weak var yearMadeTV: UITextField!
    @IBOutlet weak var typeTV: UITextField!
    @IBOutlet weak var priceTV: UITextField!
    @IBOutlet weak var currentValTV: UITextField!
    @IBOutlet weak var descriptionTV: UITextField!
    
    //buttons
    @IBOutlet weak var addCollectionBTN: UIButton!
    @IBOutlet weak var clearBTN: UIButton!
    @IBOutlet weak var addBTN: UIButton!
    
    //image
    @IBOutlet weak var imageIV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
                imageIV.isUserInteractionEnabled = true
                imageIV.addGestureRecognizer(tap)
    }
    
    
    //below is all stuff needed to give users image options stuffs
    @objc func imageTapped() {
        showImageOptions()
    }
    
    func showImageOptions() {
        let alert = UIAlertController(title: "Add Photo", message: nil, preferredStyle: .actionSheet)

        // Camera option (only show if available)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(UIAlertAction(title: "Take Photo", style: .default) { _ in
                self.openPicker(source: .camera)
            })
        }

        alert.addAction(UIAlertAction(title: "Choose from Library", style: .default) { _ in
            self.openPicker(source: .photoLibrary)
        })

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        // Required for iPad — prevents crash
        if let popover = alert.popoverPresentationController {
            popover.sourceView = imageIV
            popover.sourceRect = imageIV.bounds
        }

        present(alert, animated: true)
    }
    
    func openPicker(source: UIImagePickerController.SourceType) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = source
            picker.allowsEditing = true  // lets user crop/adjust
            present(picker, animated: true)
        }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            // Use edited image if available, otherwise use original
            if let edited = info[.editedImage] as? UIImage {
                imageIV.image = edited
            } else if let original = info[.originalImage] as? UIImage {
                imageIV.image = original
            }
            picker.dismiss(animated: true)
        }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    

    //Button adds items to collections
    @IBAction func addBTNAction(_ sender: Any) {
        
    }
    
    
    //clears all fields
    @IBAction func clearBTNAction(_ sender: Any) {
        nameTV.text = ""
        yearMadeTV.text = ""
        typeTV.text = ""
        priceTV.text = ""
        currentValTV.text = ""
        descriptionTV.text = ""
        imageIV.image = nil
    }
    
}
