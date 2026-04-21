//
//  ItemViewController.swift
//  Collectapull
//
//  Created by Dolan,Allison L on 4/7/26.
//

import UIKit

class ItemViewController: UIViewController {
    
    //text
    @IBOutlet weak var nameOL: UILabel!
    @IBOutlet weak var yearOL: UILabel!
    @IBOutlet weak var typeOL: UILabel!
    @IBOutlet weak var priceOL: UILabel!
    @IBOutlet weak var currentOL: UILabel!
    @IBOutlet weak var collectionOL: UILabel!
    @IBOutlet weak var descriptionOL: UITextView!
    
    
    //buttons
    @IBOutlet weak var editBTN: UIButton!
    
    //image
    @IBOutlet weak var imageIV: UIImageView!
    
    //make text for view
    var nameText: String = ""
    var yearText: String = ""
    var typeText: String = ""
    var priceText: String = ""
    var currentText: String = ""
    var collectionText: String = ""
    var descriptionText: String = ""
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOL.text = nameText
        yearOL.text = "Year Made: \(yearText)"
        typeOL.text = "Product Type: \(typeText)"
        priceOL.text = "Price Purchased At: \(priceText)"
        currentOL.text = "Current Value: \(currentText)"
        collectionOL.text = "Collection: \(collectionText)"
        descriptionOL.text = descriptionText
        imageIV.image = image ?? UIImage(named: "placeholder")
    }

}
