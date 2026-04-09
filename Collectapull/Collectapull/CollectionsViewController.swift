//
//  CollectionsViewController.swift
//  placeholder
//
//  Created by Dolan,Allison L on 3/28/26.
//


import UIKit

class CollectionsViewController: UIViewController {
    
    //existing data
    var collections : [Collection] = []
    var selectedCollection : Collection?
    
    
    
    //added data fields
    var addName : String = ""
    var addDescription : String = ""
    var addImage : UIImage? = nil
    var addYear : String = ""
    var addValue : String = ""
    var addPurchasePrice : String = ""
    var addType = ""
    
    
    @IBOutlet weak var searchBar: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }


}
