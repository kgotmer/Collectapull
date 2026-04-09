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
    var collectionText: String = ""
    var descriptionText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
