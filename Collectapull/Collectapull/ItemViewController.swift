//
//  ItemViewController.swift
//  Collectapull
//
//  Created by Dolan,Allison L on 4/7/26.
//

import UIKit

class ItemViewController: UIViewController {
    
    //text
    @IBOutlet weak var yearOL: UILabel!
    @IBOutlet weak var typeOL: UILabel!
    @IBOutlet weak var priceOL: UILabel!
    @IBOutlet weak var valueOL: UILabel!
    @IBOutlet weak var collectionOL: UILabel!
    @IBOutlet weak var descriptionOL: UITextView!
    
    //buttons
    @IBOutlet weak var backBTN: UIButton!
    @IBOutlet weak var editBTN: UIButton!
    
    //image
    @IBOutlet weak var imageIV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
